#!/usr/bin/env/bash

# example:
# ssh -T root@192.168.168.101 < scripts/format_mount_uefi.sh

# https://nixos.org/manual/nixos/stable/index.html#sec-installation


DISK=vda
LABEL=nixos
LABEL_BOOT=boot

mkfs.ext4 -L ${LABEL} /dev/${DISK}1

mkswap -L swap /dev/${DISK}2

mkfs.fat -F 32 -n ${LABEL_BOOT} /dev/${DISK}3   

mount /dev/disk/by-label/${LABEL} /mnt

mkdir -p /mnt/boot
mount /dev/disk/by-label/${LABEL_BOOT} /mnt/boot

swapon /dev/${DISK}2

mount | grep "on /mnt"