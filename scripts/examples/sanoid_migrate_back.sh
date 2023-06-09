#!/bin/bash

#migrate back

set -e
VM="$1"
POOL="$VM"-pool
EPOCH="$(date +"%s")"

zfs snap data/vms/"$VM"@presnap-"$EPOCH"
/usr/local/sbin/syncoid --no-sync-snap data/vms/"$VM" root@zfs1:data/vms/"$VM"
ssh root@kvm2 "virsh suspend "$VM""
ssh root@kvm2 "sync -f /vms/"$VM""
sync -f /data/vms/"$VM"
zfs snap data/vms/"$VM"@finalsnap-"$EPOCH"
/usr/local/sbin/syncoid --no-sync-snap data/vms/"$VM" root@zfs1:data/vms/"$VM"

ssh -T root@zfs1 << EOL
set -e
zfs list -r -t snap data/vms/"$VM" | awk "/"$VM"@presnap-"$EPOCH"/ {f1=1} /"$VM"@finalsnap-"$EPOCH"/ {f2=1} END {exit !(f1 && f2)}"
EOL

ssh root@kvm2 "virsh migrate --verbose --live --persistent --undefinesource "$VM" qemu+ssh://kvm1/system --migrateuri tcp://@kvm1:49152"
ssh root@kvm1 "virsh resume "$VM""

ssh -T root@kvm2 << EOL
set -e
virsh pool-destroy "$POOL"
virsh pool-undefine "$POOL"
virsh pool-define-as --name "$POOL" --type netfs --target /vms/"$VM" --source-host 10.0.0.100 --source-path /data/vms/"$VM"
virsh pool-start "$POOL"
virsh pool-autostart "$POOL"
EOL