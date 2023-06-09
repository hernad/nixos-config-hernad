#!/usr/bin/env/bash

# example:
# ssh -T root@192.168.168.101 < scripts/partition_uefi.sh

#export DISK=sda
if [ -z "$DISK" ]; then
  echo "DISK envar nije definisano"
  DISK=vda
fi

echo == DISK=$DISK ==


# size in GB
BOOT_SIZE=1 
SWAP_SIZE=4


parted /dev/$DISK -- print | grep -q "^ 1" && echo vec postoji particija 1 na /dev/$DISK && exit 1

# https://nixos.org/manual/nixos/stable/index.html#sec-installation


parted /dev/$DISK -- mklabel gpt

# partition 1 root
parted /dev/$DISK -- mkpart primary ${BOOT_SIZE}GB -${SWAP_SIZE}GB

# partition 2 swap
parted /dev/$DISK -- mkpart primary linux-swap -${SWAP_SIZE}GB 100%

# partition 3 boot
parted /dev/$DISK -- mkpart ESP fat32 1MB ${BOOT_SIZE}GB
parted /dev/$DISK -- set 3 esp on

parted /dev/$DISK -- print
