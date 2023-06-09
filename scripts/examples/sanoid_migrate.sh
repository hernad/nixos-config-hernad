#!/bin/bash


# sanoid, sanoid timer and sanoid prune service are all disabled and stopped on both zfs servers first and cron jobs 
# for syncoid scripts are commented out. When everything is done and migrated back, 
# I start and reenable the services and uncomment the syncoid scripts from cron.


# migrate kvm1, zfs1 - kvm2, zfs2

#I run these scripts from zfs2. zfs2 has ssh access through public keys to all hosts. 

#./migrate myvm


set -e
VM="$1"
POOL="$VM"-pool
EPOCH="$(date +"%s")"

#-T     Disable pseudo-terminal allocation.

# storage administrator responsible for an NFS server creates a share to store virtual machines' data. 
# The system administrator defines a pool on the virtualization host with the details of the share 
# (e.g. nfs.example.com:/path/to/share should be mounted on /vm_data). 
# When the pool is started, libvirt mounts the share on the specified directory, 
# just as if the system administrator logged in and executed 'mount nfs.example.com:/path/to/share /vmdata'. 
# If the pool is configured to autostart, 
# libvirt ensures that the NFS share is mounted on the directory specified when libvirt is started

# Once the pool is started, the files in the NFS share are reported as volumes, 
# and the storage volumes' paths may be queried using the libvirt APIs. 
# The volumes' paths can then be copied into the section of a VM's XML definition describing 
# the source storage for the VM's block devices. In the case of NFS, an application using the libvirt 
# APIs can create and delete volumes in the pool (files in the NFS share) up to the limit of the size of the pool 
# (the storage capacity of the share). 
# Not all pool types support creating and deleting volumes. 
#Stopping the pool (somewhat unfortunately referred to by virsh and the API as "pool-destroy") 
# undoes the start operation, in this case, unmounting the NFS share. 
#The data on the share is not modified by the destroy operation, despite the name.


# A second example is an iSCSI pool. A storage administrator provisions an iSCSI target to present a set of LUNs to the 
# host running the VMs. When libvirt is configured to manage that iSCSI target as a pool, 
# libvirt will ensure that the host logs into the iSCSI target and libvirt can then report the available 
# LUNs as storage volumes. The volumes' paths can be queried and used in VM's XML definitions as in the NFS example. 
# In this case, the LUNs are defined on the iSCSI server, and libvirt cannot create and delete volumes.

ssh -T root@kvm2 << EOF
set -e
virsh pool-destroy "$POOL"
virsh pool-undefine "$POOL"
virsh pool-define-as --name "$POOL" --type netfs --target /vms/"$VM" --source-host 10.0.0.101 --source-path /data/vms/"$VM"
virsh pool-start "$POOL"
virsh pool-autostart "$POOL"
EOF

ssh root@zfs1 "zfs snap data/vms/"$VM"@presnap-"$EPOCH""
/usr/local/sbin/syncoid --no-sync-snap root@zfs1:data/vms/"$VM" data/vms/"$VM"

ssh -T root@kvm1 << EOF
virsh suspend "$VM"
sync -f /vms/"$VM"
EOF

ssh -T root@zfs-1 << EOF
sync -f /data/vms/"$VM"
zfs snap data/vms/"$VM"@finalsnap-"$EPOCH"
EOF

/usr/local/sbin/syncoid --no-sync-snap root@zfs1:data/vms/"$VM" data/vms/"$VM"
zfs list -r -t snap data/vms/"$VM" | awk "/"$VM"@presnap-"$EPOCH"/ {f1=1} /"$VM"@finalsnap-"$EPOCH"/ {f2=1} END {exit !(f1 && f2)}"
ssh root@kvm1 "virsh migrate --verbose --live --persistent --undefinesource "$VM" qemu+ssh://kvm2/system --migrateuri tcp://@kvm2:49152"
ssh root@kvm2 "virsh resume "$VM""