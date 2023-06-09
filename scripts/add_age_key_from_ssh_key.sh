#!/run/current-system/sw/bin/bash

if [ ! -f ssh_host_ed25519_key ]; then
   echo trebamo ssh_host_ed25519_key
   exit 1
fi

nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ssh_host_ed25519_key >> ~/.config/sops/age/keys.txt"

echo "==== show age public keys ============"
nix-shell -p age --run "age-keygen -y ~/.config/sops/age/keys.txt"


echo "======================================="
echo "remove ssh key, add age pubkey to .sops.yaml"
echo "run sops, primjer:"
echo "nix-shell -p sops --run "sops secrets/user-secrets-hpdl380pg8-1.yaml"
