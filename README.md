# Start


## Notes

   nix flake init -t github:misterio77/nix-starter-config#standard

 
lenovo16 configuration.nix

   services.pcscd.enable = true;
   programs.gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
   };


   gpg --full-generate-key

      gpg: revocation certificate stored as '/home/hernad/.gnupg/openpgp-revocs.d/453454CDE1C7FE12A2995CAC85669FDDE2456A79.rev'
      public and secret key created and signed.

      pub   ed25519 2023-06-02 [SC]
            453454CDE1C7FE12A2995CAC85669FDDE2456A79
      uid                      Ernad Husremovic (bring.out doo Sarajevo) <hernad@bring.out.ba>
      sub   cv25519 2023-06-02 [E]


   
    gpg --keyring secring.gpg --export-secret-keys 453454CDE1C7FE12A2995CAC85669FDDE2456A79 > ~/.gnupg/secring.gpg



   systemctl --user restart gpg-agent


   age-keygen -o ~/.config/sops/age/keys.txt
   Public key: age1y26hj2vaf8tk2sv3hpl4fg6c8s6g9ccnhuu09vchh4hu3ytkvews3jpq0v




sops password file

   nix-shell -p sops --run "sops secrets/age.yaml"


   nix-shell -p sops age --run "sops -e -d secrets/age.yaml"
   hello: test
   example_key: value1




Push flake on remote host

   nixos-rebuild  --flake .#hped800g3-4 --target-host root@192.168.168.109 --build-host root@192.168.168.109 --use-remote-sudo switch 



check.sh:


      #!/bin/bash
      # This is a slightly modified version of the script found at 
      #    https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF#Ensuring_that_the_groups_are_valid
      # It adds a tab to make the output prettier and sorts the output per-group
      shopt -s nullglob;
      for d in /sys/kernel/iommu_groups/*/devices/*;
      do
            n="${d#*/iommu_groups/*}";
            n="${n%%/*}";
            printf 'IOMMU Group %s \t' "$n";
            lspci -nns "${d##*/}";
      done | sort -h -k 3


   nix-shell -p pciutils --run "bash check.sh"



sops age from ssh key


     # /persist/etc/ssh ... !!!
     scp root@192.168.168.109:/persist/etc/ssh/ssh_host_ed25519_key .

     nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ssh_host_ed25519_key >> ~/.config/sops/age/keys.txt"

     nix-shell -p age --run "age-keygen -y ~/.config/sops/age/keys.txt"
     age13sdmfcrdh8dn05v594nr7dxywklmmanugj7j66ndaawy6hg6hs8sw5hcuz


nixos-rebuild  ...

      ....
      activating the configuration...
      sops-install-secrets: Imported /persist/etc/ssh/ssh_host_ed25519_key as age key with fingerprint age13sdmfcrdh8dn05v594nr7dxywklmmanugj7j66ndaawy6hg6hs8sw5hcuz
      ....



build installer iso

   nix build .#installer-iso
   nix build .#test-txt

   ls -l result/test/text.txt
   lrwxrwxrwx 1 root root 52 Jan  1  1970 result/test/text.txt -> /nix/store/9gzn9al449pygm5w2iarvajanmgfargk-test.txt



# KVM host 192.168.168.101 partition uefi

   export HOST_IP=192.168.168.134
   ssh -T root@$HOST_IP < scripts/partition_uefi.sh
   ssh -T root@$HOST_IP < scripts/format_mount_uefi.sh
   ssh -T root@$HOST_IP < scripts/nixos_install_uefi.sh




# libvirt migrate

      [root@hped800g3-4:~]# virsh migrate guest31 qemu+ssh://hped800g3-3/system --unsafe --live --copy-storage-all --persistent  --verbose
      Migration: [100 %]


# Cluster staging / sa1

   export SSH_USER=root; export ROOT_PASS=dummy
   ./deploy_pki staging node1


   ./tlsproxy staging
   + ORG=bring-out
   ++ dirname ./tlsproxy
   + cd .
   + CLUSTER=staging
   + '[' '!' -d cluster/staging ']'
   + PREFIX=bring-out/cluster/staging
   ++ date +%Y
   + YEAR=2023
   ++ mktemp -d
   + CERTDIR=/run/user/1000/tmp.blE6R0JHo1
   + trap _int SIGINT
   + pass bring-out/cluster/staging/nomad2023.crt
   + pass bring-out/cluster/staging/nomad2023-client.crt
   + pass bring-out/cluster/staging/nomad2023-client.key
   + pass bring-out/cluster/staging/consul2023.crt
   + pass bring-out/cluster/staging/consul2023-client.crt
   + pass bring-out/cluster/staging/consul2023-client.key
   + child1=874034
   + socat -dd tcp-listen:4646,reuseaddr,fork,bind=localhost openssl:localhost:14646,cert=/run/user/1000/tmp.blE6R0JHo1/nomad-client.crt,key=/run/user/1000/tmp.blE6R0JHo1/nomad-client.key,cafile=/run/user/1000/tmp.blE6R0JHo1/nomad.crt,verify=0
   + child2=874035
   + wait 874034
   + socat -dd tcp-listen:8500,reuseaddr,fork,bind=localhost openssl:localhost:8501,cert=/run/user/1000/tmp.blE6R0JHo1/consul-client.crt,key=/run/user/1000/tmp.blE6R0JHo1/consul-client.key,cafile=/run/user/1000/tmp.blE6R0JHo1/consul.crt,verify=0
   2023/06/12 12:29:30 socat[874035] N listening on AF=2 127.0.0.1:8500
   2023/06/12 12:29:30 socat[874034] N listening on AF=2 127.0.0.1:4646
