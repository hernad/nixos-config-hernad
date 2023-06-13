#!/bin/sh

set -x -e

cd /root

chmod 0600 .ssh/id_ed25519

cat > .ssh/config <<EOF
Host backuphost
	HostName $TARGET_SSH_HOST
	Port $TARGET_SSH_PORT
	User $TARGET_SSH_USER
EOF

consul kv export | \
	gzip | \
	age -r "$(cat /root/.ssh/id_ed25519.pub)" | \
	ssh backuphost "cat > $TARGET_SSH_DIR/consul/$(date --iso-8601=minute)_consul_kv_export.gz.age"

