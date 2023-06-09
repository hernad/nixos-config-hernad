#!/run/current-system/sw/bin/bash

if [ -z "$1" ] ; then
   echo $0 hostName ipAddress
   echo Example:
   echo $0 hped800g3-4 192.168.168.109
   exit 0
fi

nixos-rebuild  --flake .#$1 --target-host root@$2 --build-host root@$2 --use-remote-sudo switch --show-trace