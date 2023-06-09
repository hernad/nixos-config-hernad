#!/usr/bin/env/bash

# example:
# ssh -T root@192.168.168.101 < scripts/format_mount_uefi.sh

# https://nixos.org/manual/nixos/stable/index.html#sec-installation


CONFIG=/mnt/etc/nixos/configuration.nix

SSH_KEY="AAAAB3NzaC1yc2EAAAADAQABAAABgQC0xP+KKZzsiYdP84jJWPUbppag5ldMl3evYtyh01CZ+Us3xIPPCtApmAGvFsjfgg3mJIPen+B1kHmmc4QaZNbbgF5J2f10eH7WH8b2JazyJsZo2S4eObtH4J2gqstFgFxWeZOG/nGDi9Q1JqVrF0ubtK0Mu5f4dSBQ4YYh3fsuj351CA7snF+KcIJ9uLCAJUYezX9LIyhNd7fDpKPuMsHiUCwsTSji0l5kT4xlZ4OoOE+B1fmZ0vFP3gfah+YXQXv4eUbjt79kMdgCIvG6gh6x7Xm5RbE/LdAAYNnevWHv7gDjQKuyakKQp/lEdr6K5fSJNNJ5PB6uvE8/NT95rEP/hr7vE2N5qlMRyozQfZbYp6o1pD6vKSohTK8cLkfNcfwDXRyWvl2vOvgLYv5u2E+OR/MoCUybcfEmwnthRPAA+jXYrMyLTL5ZzeP8UBST6zTkjB2aU/G2AUQW2nKre5isAxjWUo1T0gzBQKTlP5N5vaGWxPVL/xZsJDfARgbIeik= hernad@dev"


[ -f $CONFIG ] && rm $CONFIG
nixos-generate-config --root /mnt

echo "=================hardware-configuration============================"
cat $CONFIG

# activate openssh service
sed -i "s/# services.openssh.enable = true;/services.openssh.enable = true;/g" $CONFIG

LINE="users.users.root.openssh.authorizedKeys.keys = [ \"ssh-rsa ${SSH_KEY}\" ];"

echo =============== LINE =======================
echo $LINE

# add authorized SSH_KEY
sed -i "s#services.openssh.enable = true;#services.openssh.enable = true;\\n  ${LINE}#g" $CONFIG

echo "=================configuration======================================"
cat /mnt/etc/nixos/configuration.nix

nixos-install --root /mnt --no-root-passwd

   