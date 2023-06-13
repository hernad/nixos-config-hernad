#!/usr/bin/env bash

# DESCRIPTION:
# 		Script to backup all buckets on a Garage cluster using rclone.
#
# REQUIREMENTS:
# 		An access key for the backup script must be created in Garage beforehand.
# 		This script will use the Garage administration API to grant read access
# 		to this key on all buckets.
#
# 		A rclone configuration file is expected to be located at `/etc/secrets/rclone.conf`,
# 		which contains credentials to the following two remotes:
# 			garage:		the Garage server, for read access (using the backup access key)
# 			backup:		the backup location
#
# DEPENDENCIES: (see Dockerfile)
# 		curl
# 		jq
# 		rclone
#
# PARAMETERS (environmenet variables)
#       $GARAGE_ADMIN_API_URL   => Garage administration API URL (e.g. http://localhost:3903)
#       $GARAGE_ADMIN_TOKEN     => Garage administration access token
#       $GARAGE_ACCESS_KEY      => Garage access key ID
#       $TARGET_BACKUP_DIR      => Folder on the backup remote where to store buckets

if [ -z "$GARAGE_ACCESS_KEY" -o -z "$GARAGE_ADMIN_TOKEN" -o -z "$GARAGE_ADMIN_API_URL" ]; then
        echo "Missing parameters"
fi

# copy potentially immutable file to a mutable location,
# otherwise rclone complains
mkdir -p /root/.config/rclone
cp /etc/secrets/rclone.conf /root/.config/rclone/rclone.conf

function gcurl {
        curl -s -H "Authorization: Bearer $GARAGE_ADMIN_TOKEN" $@
}

BUCKETS=$(gcurl "$GARAGE_ADMIN_API_URL/v0/bucket" | jq -r '.[].id')

mkdir -p /tmp/buckets-info

for BUCKET in $BUCKETS; do
        echo "==== BUCKET $BUCKET ===="

        gcurl "http://localhost:3903/v0/bucket?id=$BUCKET" > "/tmp/buckets-info/$BUCKET.json"
		rclone copy "/tmp/buckets-info/$BUCKET.json" "backup:$TARGET_BACKUP_DIR/" 2>&1

        ALIASES=$(jq -r '.globalAliases[]' < "/tmp/buckets-info/$BUCKET.json")
        echo "(aka. $ALIASES)"

        case $ALIASES in
                *backup*)
                        echo "Skipping $BUCKET (not doing backup of backup)"
                        ;;
                *cache*)
                        echo "Skipping $BUCKET (not doing backup of cache)"
                        ;;
                *)
                        echo "Backing up $BUCKET"

                        gcurl -X POST -H "Content-Type: application/json"  --data @- "http://localhost:3903/v0/bucket/allow" >/dev/null <<EOF
                                {
                                        "bucketId": "$BUCKET",
                                        "accessKeyId": "$GARAGE_ACCESS_KEY",
                                        "permissions": {"read": true}
                                }
EOF

                        rclone sync \
                        		--transfers 32 \
                                --fast-list \
                                --stats-one-line \
                                --stats 10s \
                                --stats-log-level NOTICE \
								"garage:$BUCKET" "backup:$TARGET_BACKUP_DIR/$BUCKET" 2>&1
                        ;;
        esac
done

echo "========= DONE SYNCHRONIZING =========="

