# Notes

# Init flake from template

<pre>
   nix flake init -t github:misterio77/nix-starter-config#standard
</pre>
 
# lenovo16 configuration.nix

<pre>
   services.pcscd.enable = true;
   programs.gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
   };
</pre>

# GPG generate key

Run:
<pre>
   gpg --full-generate-key
</pre>

Output:
<pre>
      gpg: revocation certificate stored as '/home/hernad/.gnupg/openpgp-revocs.d/453454CDE1C7FE12A2995CAC85669FDDE2456A79.rev'
      public and secret key created and signed.

      pub   ed25519 2023-06-02 [SC]
            453454CDE1C7FE12A2995CAC85669FDDE2456A79
      uid                      Ernad Husremovic (bring.out doo Sarajevo) <hernad@bring.out.ba>
      sub   cv25519 2023-06-02 [E]
</pre>

<pre>   
    gpg --keyring secring.gpg --export-secret-keys 453454CDE1C7FE12A2995CAC85669FDDE2456A79 > ~/.gnupg/secring.gpg
</pre>


   systemctl --user restart gpg-agent


   age-keygen -o ~/.config/sops/age/keys.txt
   Public key: age1y26hj2vaf8tk2sv3hpl4fg6c8s6g9ccnhuu09vchh4hu3ytkvews3jpq0v




# sops password file

<pre>
   nix-shell -p sops --run "sops secrets/age.yaml"
</pre>

<pre>
   nix-shell -p sops age --run "sops -e -d secrets/age.yaml"
   hello: test
   example_key: value1
</pre>



# Push flake on remote host

<pre>
   nixos-rebuild  --flake .#hped800g3-4 --target-host root@192.168.168.109 --build-host root@192.168.168.109 --use-remote-sudo switch 
</pre>


# check iommu:


<pre>
iommu_check
</pre>




# sops age from ssh key

<pre>
     # /persist/etc/ssh ... !!!
     scp root@192.168.168.109:/persist/etc/ssh/ssh_host_ed25519_key .

     nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ssh_host_ed25519_key >> ~/.config/sops/age/keys.txt"

     nix-shell -p age --run "age-keygen -y ~/.config/sops/age/keys.txt"
     age13sdmfcrdh8dn05v594nr7dxywklmmanugj7j66ndaawy6hg6hs8sw5hcuz
</pre>

# nixos-rebuild sops

<pre>
      ....
      activating the configuration...
      sops-install-secrets: Imported /persist/etc/ssh/ssh_host_ed25519_key as age key with fingerprint age13sdmfcrdh8dn05v594nr7dxywklmmanugj7j66ndaawy6hg6hs8sw5hcuz
      ....
</pre>


# build installer iso

<pre>
   nix build .#installer-iso
   nix build .#test-txt

   ls -l result/test/text.txt
   lrwxrwxrwx 1 root root 52 Jan  1  1970 result/test/text.txt -> /nix/store/9gzn9al449pygm5w2iarvajanmgfargk-test.txt
</pre>


# Install nixos at kvm guest on host 192.168.168.101

<pre>
   export HOST_IP=192.168.168.134
   ssh -T root@$HOST_IP < scripts/partition_uefi.sh
   ssh -T root@$HOST_IP < scripts/format_mount_uefi.sh
   ssh -T root@$HOST_IP < scripts/nixos_install_uefi.sh
</pre>



# libvirt migrate

<pre>
      [root@hped800g3-4:~]# virsh migrate guest31 qemu+ssh://hped800g3-3/system --unsafe --live --copy-storage-all --persistent  --verbose
      Migration: [100 %]
</pre>

# Cluster staging, gen-pki, deploy-pki, tlsproxy

<pre>
   export SSH_USER=root; export ROOT_PASS=dummy
   ./deploy_pki staging
</pre>

Run:

<pre>
./tlsproxy staging
</pre>

<pre>
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
</pre>



# wgautomesh gossip_secret

on every node set gossip_secret for wgautomesh functioning:

<pre>
   [root@node1:~]# echo f5ed529a-0936-11ee-a168-2b2699a12b5e > /var/lib/wgautomesh/gossip_secret
</pre>

# run consul client

<pre>
[root@node1:~]# 
export CONSUL_HTTP_ADDR=https://localhost:8501
export CONSUL_CLIENT_KEY=/var/lib/consul/pki/consul-client.key
export CONSUL_CLIENT_CERT=/var/lib/consul/pki/consul-client.crt
export CONSUL_CACERT=/var/lib/consul/pki/consul-ca.crt

[root@node1:~]# consul members
Node   Address          Status  Type    Build   Protocol  DC       Partition  Segment
node1  10.183.1.1:8301  alive   server  1.15.2  2         staging  default    <all>

[root@node1:~]# consul members
Node   Address          Status  Type    Build   Protocol  DC       Partition  Segment
node1  10.183.1.1:8301  alive   server  1.15.2  2         staging  default    <all>
node2  10.183.1.2:8301  alive   server  1.15.2  2         staging  default    <all>
node3  10.183.1.3:8301  alive   server  1.15.2  2         staging  default    <all>
</pre>

deploy pki:

<pre>
 ./deploy_pki staging 
</pre>

output:

<pre>
==== DOING node1 ====
- run mkdir -p /var/lib/nomad/pki /var/lib/consul/pki
- write secret /var/lib/consul/pki/consul-ca.crt from pass bring-out/cluster/staging/consul-ca.crt
- run chown consul:root /var/lib/consul/pki/consul-ca.crt
- write secret /var/lib/consul/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown consul:root /var/lib/consul/pki/consul2023.crt
- write secret /var/lib/consul/pki/consul2023.key from pass bring-out/cluster/staging/consul2023.key
- run chown consul:root /var/lib/consul/pki/consul2023.key
- write secret /var/lib/consul/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown consul:root /var/lib/consul/pki/consul2023-client.crt
- write secret /var/lib/consul/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown consul:root /var/lib/consul/pki/consul2023-client.key
- run ln -sf /var/lib/consul/pki/consul2023.crt /var/lib/consul/pki/consul.crt
- run ln -sf /var/lib/consul/pki/consul2023.key /var/lib/consul/pki/consul.key
- run ln -sf /var/lib/consul/pki/consul2023-client.crt /var/lib/consul/pki/consul-client.crt
- run ln -sf /var/lib/consul/pki/consul2023-client.key /var/lib/consul/pki/consul-client.key
- run systemctl restart consul
- run sleep 10
- write secret /var/lib/nomad/pki/nomad-ca.crt from pass bring-out/cluster/staging/nomad-ca.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad-ca.crt
- write secret /var/lib/nomad/pki/nomad2023.crt from pass bring-out/cluster/staging/nomad2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.crt
- write secret /var/lib/nomad/pki/nomad2023.key from pass bring-out/cluster/staging/nomad2023.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.key
- write secret /var/lib/nomad/pki/nomad2023-client.crt from pass bring-out/cluster/staging/nomad2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.crt
- write secret /var/lib/nomad/pki/nomad2023-client.key from pass bring-out/cluster/staging/nomad2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.key
- write secret /var/lib/nomad/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023.crt
- write secret /var/lib/nomad/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.crt
- write secret /var/lib/nomad/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.key
- run ln -sf /var/lib/nomad/pki/nomad2023.crt /var/lib/nomad/pki/nomad.crt
- run ln -sf /var/lib/nomad/pki/nomad2023.key /var/lib/nomad/pki/nomad.key
- run ln -sf /var/lib/nomad/pki/nomad2023-client.crt /var/lib/nomad/pki/nomad-client.crt
- run ln -sf /var/lib/nomad/pki/nomad2023-client.key /var/lib/nomad/pki/nomad-client.key
- run ln -sf /var/lib/nomad/pki/consul2023.crt /var/lib/nomad/pki/consul.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.crt /var/lib/nomad/pki/consul-client.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.key /var/lib/nomad/pki/consul-client.key
- run systemctl restart nomad
- set CONSUL_HTTP_ADDR=https://localhost:8501
- set CONSUL_CACERT=/var/lib/consul/pki/consul-ca.crt
- set CONSUL_CLIENT_CERT=/var/lib/consul/pki/consul-client.crt
- set CONSUL_CLIENT_KEY=/var/lib/consul/pki/consul-client.key
- run consul kv put secrets/consul/consul-ca.crt - < /var/lib/consul/pki/consul-ca.crt
Success! Data written to: secrets/consul/consul-ca.crt
- run consul kv put secrets/consul/consul.crt - < /var/lib/consul/pki/consul.crt
Success! Data written to: secrets/consul/consul.crt
- run consul kv put secrets/consul/consul-client.crt - < /var/lib/consul/pki/consul-client.crt
Success! Data written to: secrets/consul/consul-client.crt
- run consul kv put secrets/consul/consul-client.key - < /var/lib/consul/pki/consul-client.key
Success! Data written to: secrets/consul/consul-client.key
- run consul kv put secrets/nomad/nomad-ca.crt - < /var/lib/nomad/pki/nomad-ca.crt
Success! Data written to: secrets/nomad/nomad-ca.crt
- run consul kv put secrets/nomad/nomad.crt - < /var/lib/nomad/pki/nomad.crt
Success! Data written to: secrets/nomad/nomad.crt
- run consul kv put secrets/nomad/nomad-client.crt - < /var/lib/nomad/pki/nomad-client.crt
Success! Data written to: secrets/nomad/nomad-client.crt
- run consul kv put secrets/nomad/nomad-client.key - < /var/lib/nomad/pki/nomad-client.key
Success! Data written to: secrets/nomad/nomad-client.key
removed '/tmp/deploytool_askpass_299e920cfe325f4bade4b17c'
removed '/tmp/deploytool_askpass_3058d9d9984d6a2ad7572f47'
removed '/tmp/deploytool_askpass_37d50dc7be7fc82d05a0a749'
removed '/tmp/deploytool_askpass_5285a3ca115149c473a0ee11'
removed '/tmp/deploytool_askpass_5745f5efc1ad18a463272cee'
removed '/tmp/deploytool_askpass_87efa953076a3efec53bdec1'
removed '/tmp/deploytool_askpass_90a4ebfa8bd8b9e141299805'
removed '/tmp/deploytool_askpass_928bf2208c7dbe8667ae1ec3'
removed '/tmp/deploytool_askpass_9550098c5c9f6a697ee2e300'
removed '/tmp/deploytool_askpass_a05dd8e89820566dee3f2119'
removed '/tmp/deploytool_askpass_bedb5799bc971b59bd0ca9ee'
removed '/tmp/deploytool_askpass_c0ca95d3bc545dccabff18dd'
removed '/tmp/deploytool_askpass_c6f1c649ff6e7d05430e5c4e'
removed '/tmp/deploytool_askpass_d8b6c29c0ea9b26dc83d8d8d'
removed '/tmp/deploytool_askpass_dc778f1ca7720ee65f91ed0b'
removed '/tmp/deploytool_askpass_f8a3fd8a9ec75221fe6c66cd'
==== DOING node2 ====
- run mkdir -p /var/lib/nomad/pki /var/lib/consul/pki
- write secret /var/lib/consul/pki/consul-ca.crt from pass bring-out/cluster/staging/consul-ca.crt
- run chown consul:root /var/lib/consul/pki/consul-ca.crt
- write secret /var/lib/consul/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown consul:root /var/lib/consul/pki/consul2023.crt
- write secret /var/lib/consul/pki/consul2023.key from pass bring-out/cluster/staging/consul2023.key
- run chown consul:root /var/lib/consul/pki/consul2023.key
- write secret /var/lib/consul/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown consul:root /var/lib/consul/pki/consul2023-client.crt
- write secret /var/lib/consul/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown consul:root /var/lib/consul/pki/consul2023-client.key
- run ln -sf /var/lib/consul/pki/consul2023.crt /var/lib/consul/pki/consul.crt
- run ln -sf /var/lib/consul/pki/consul2023.key /var/lib/consul/pki/consul.key
- run ln -sf /var/lib/consul/pki/consul2023-client.crt /var/lib/consul/pki/consul-client.crt
- run ln -sf /var/lib/consul/pki/consul2023-client.key /var/lib/consul/pki/consul-client.key
- run systemctl restart consul
- run sleep 10
- write secret /var/lib/nomad/pki/nomad-ca.crt from pass bring-out/cluster/staging/nomad-ca.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad-ca.crt
- write secret /var/lib/nomad/pki/nomad2023.crt from pass bring-out/cluster/staging/nomad2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.crt
- write secret /var/lib/nomad/pki/nomad2023.key from pass bring-out/cluster/staging/nomad2023.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.key
- write secret /var/lib/nomad/pki/nomad2023-client.crt from pass bring-out/cluster/staging/nomad2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.crt
- write secret /var/lib/nomad/pki/nomad2023-client.key from pass bring-out/cluster/staging/nomad2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.key
- write secret /var/lib/nomad/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023.crt
- write secret /var/lib/nomad/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.crt
- write secret /var/lib/nomad/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.key
- run ln -sf /var/lib/nomad/pki/nomad2023.crt /var/lib/nomad/pki/nomad.crt
- run ln -sf /var/lib/nomad/pki/nomad2023.key /var/lib/nomad/pki/nomad.key
- run ln -sf /var/lib/nomad/pki/nomad2023-client.crt /var/lib/nomad/pki/nomad-client.crt
- run ln -sf /var/lib/nomad/pki/nomad2023-client.key /var/lib/nomad/pki/nomad-client.key
- run ln -sf /var/lib/nomad/pki/consul2023.crt /var/lib/nomad/pki/consul.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.crt /var/lib/nomad/pki/consul-client.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.key /var/lib/nomad/pki/consul-client.key
- run systemctl restart nomad
- set CONSUL_HTTP_ADDR=https://localhost:8501
- set CONSUL_CACERT=/var/lib/consul/pki/consul-ca.crt
- set CONSUL_CLIENT_CERT=/var/lib/consul/pki/consul-client.crt
- set CONSUL_CLIENT_KEY=/var/lib/consul/pki/consul-client.key
- run consul kv put secrets/consul/consul-ca.crt - < /var/lib/consul/pki/consul-ca.crt
Success! Data written to: secrets/consul/consul-ca.crt
- run consul kv put secrets/consul/consul.crt - < /var/lib/consul/pki/consul.crt
Success! Data written to: secrets/consul/consul.crt
- run consul kv put secrets/consul/consul-client.crt - < /var/lib/consul/pki/consul-client.crt
Success! Data written to: secrets/consul/consul-client.crt
- run consul kv put secrets/consul/consul-client.key - < /var/lib/consul/pki/consul-client.key
Success! Data written to: secrets/consul/consul-client.key
- run consul kv put secrets/nomad/nomad-ca.crt - < /var/lib/nomad/pki/nomad-ca.crt
Success! Data written to: secrets/nomad/nomad-ca.crt
- run consul kv put secrets/nomad/nomad.crt - < /var/lib/nomad/pki/nomad.crt
Success! Data written to: secrets/nomad/nomad.crt
- run consul kv put secrets/nomad/nomad-client.crt - < /var/lib/nomad/pki/nomad-client.crt
Success! Data written to: secrets/nomad/nomad-client.crt
- run consul kv put secrets/nomad/nomad-client.key - < /var/lib/nomad/pki/nomad-client.key
Success! Data written to: secrets/nomad/nomad-client.key
removed '/tmp/deploytool_askpass_0cbf5a83c0ebf7722355d5dd'
removed '/tmp/deploytool_askpass_15c4eaf10da9d215e7fa1a55'
removed '/tmp/deploytool_askpass_2f94dae399c48ab2a42d6a58'
removed '/tmp/deploytool_askpass_35ce292eed0289cfe1533e39'
removed '/tmp/deploytool_askpass_448d80882bbea164de2e77da'
removed '/tmp/deploytool_askpass_47f82b118b790f3d570797eb'
removed '/tmp/deploytool_askpass_4fac1492a287cf8c7e96f00e'
removed '/tmp/deploytool_askpass_5c021ebcf8329516b32044ea'
removed '/tmp/deploytool_askpass_a92795619045d87c4e4344a8'
removed '/tmp/deploytool_askpass_babc669bf0b2c991a61df4c3'
removed '/tmp/deploytool_askpass_d055a9da5738d0ca48e9d8aa'
==== DOING node3 ====
- run mkdir -p /var/lib/nomad/pki /var/lib/consul/pki
- write secret /var/lib/consul/pki/consul-ca.crt from pass bring-out/cluster/staging/consul-ca.crt
- run chown consul:root /var/lib/consul/pki/consul-ca.crt
- write secret /var/lib/consul/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown consul:root /var/lib/consul/pki/consul2023.crt
- write secret /var/lib/consul/pki/consul2023.key from pass bring-out/cluster/staging/consul2023.key
- run chown consul:root /var/lib/consul/pki/consul2023.key
- write secret /var/lib/consul/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown consul:root /var/lib/consul/pki/consul2023-client.crt
- write secret /var/lib/consul/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown consul:root /var/lib/consul/pki/consul2023-client.key
- run ln -sf /var/lib/consul/pki/consul2023.crt /var/lib/consul/pki/consul.crt
- run ln -sf /var/lib/consul/pki/consul2023.key /var/lib/consul/pki/consul.key
- run ln -sf /var/lib/consul/pki/consul2023-client.crt /var/lib/consul/pki/consul-client.crt
- run ln -sf /var/lib/consul/pki/consul2023-client.key /var/lib/consul/pki/consul-client.key
- run systemctl restart consul
- run sleep 10
- write secret /var/lib/nomad/pki/nomad-ca.crt from pass bring-out/cluster/staging/nomad-ca.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad-ca.crt
- write secret /var/lib/nomad/pki/nomad2023.crt from pass bring-out/cluster/staging/nomad2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.crt
- write secret /var/lib/nomad/pki/nomad2023.key from pass bring-out/cluster/staging/nomad2023.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023.key
- write secret /var/lib/nomad/pki/nomad2023-client.crt from pass bring-out/cluster/staging/nomad2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.crt
- write secret /var/lib/nomad/pki/nomad2023-client.key from pass bring-out/cluster/staging/nomad2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/nomad2023-client.key
- write secret /var/lib/nomad/pki/consul2023.crt from pass bring-out/cluster/staging/consul2023.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023.crt
- write secret /var/lib/nomad/pki/consul2023-client.crt from pass bring-out/cluster/staging/consul2023-client.crt
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.crt
- write secret /var/lib/nomad/pki/consul2023-client.key from pass bring-out/cluster/staging/consul2023-client.key
- run chown $(stat -c %u /var/lib/private/nomad/) /var/lib/nomad/pki/consul2023-client.key
- run ln -sf /var/lib/nomad/pki/nomad2023.crt /var/lib/nomad/pki/nomad.crt
- run ln -sf /var/lib/nomad/pki/nomad2023.key /var/lib/nomad/pki/nomad.key
- run ln -sf /var/lib/nomad/pki/nomad2023-client.crt /var/lib/nomad/pki/nomad-client.crt
- run ln -sf /var/lib/nomad/pki/nomad2023-client.key /var/lib/nomad/pki/nomad-client.key
- run ln -sf /var/lib/nomad/pki/consul2023.crt /var/lib/nomad/pki/consul.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.crt /var/lib/nomad/pki/consul-client.crt
- run ln -sf /var/lib/nomad/pki/consul2023-client.key /var/lib/nomad/pki/consul-client.key
- run systemctl restart nomad
- set CONSUL_HTTP_ADDR=https://localhost:8501
- set CONSUL_CACERT=/var/lib/consul/pki/consul-ca.crt
- set CONSUL_CLIENT_CERT=/var/lib/consul/pki/consul-client.crt
- set CONSUL_CLIENT_KEY=/var/lib/consul/pki/consul-client.key
- run consul kv put secrets/consul/consul-ca.crt - < /var/lib/consul/pki/consul-ca.crt
Success! Data written to: secrets/consul/consul-ca.crt
- run consul kv put secrets/consul/consul.crt - < /var/lib/consul/pki/consul.crt
Success! Data written to: secrets/consul/consul.crt
- run consul kv put secrets/consul/consul-client.crt - < /var/lib/consul/pki/consul-client.crt
Success! Data written to: secrets/consul/consul-client.crt
- run consul kv put secrets/consul/consul-client.key - < /var/lib/consul/pki/consul-client.key
Success! Data written to: secrets/consul/consul-client.key
- run consul kv put secrets/nomad/nomad-ca.crt - < /var/lib/nomad/pki/nomad-ca.crt
Success! Data written to: secrets/nomad/nomad-ca.crt
- run consul kv put secrets/nomad/nomad.crt - < /var/lib/nomad/pki/nomad.crt
Success! Data written to: secrets/nomad/nomad.crt
- run consul kv put secrets/nomad/nomad-client.crt - < /var/lib/nomad/pki/nomad-client.crt
Success! Data written to: secrets/nomad/nomad-client.crt
- run consul kv put secrets/nomad/nomad-client.key - < /var/lib/nomad/pki/nomad-client.key
Success! Data written to: secrets/nomad/nomad-client.key
removed '/tmp/deploytool_askpass_ba81282a0591ecc65ff42e07'
</pre>

# consul, dns server unbound

run on node1:

<pre>
[root@node1:~]# ping consul.service.staging.consul
PING consul.service.staging.consul (10.183.1.1) 56(84) bytes of data.
64 bytes from node1 (10.183.1.1): icmp_seq=1 ttl=64 time=0.034 ms
</pre>


run on node2:

<pre>
[root@node2:~]# ping consul.service.staging.consul
PING consul.service.staging.consul (10.183.1.2) 56(84) bytes of data.
64 bytes from node2 (10.183.1.2): icmp_seq=1 ttl=64 time=0.043 ms
</pre>

dns server dig:

<pre>
[root@node2:~]# nix-shell -p dig --run "dig @127.0.0.1 consul.service.staging.consul"
</pre>

output:
<pre>
these 2 paths will be fetched (0.40 MiB download, 1.83 MiB unpacked):
  /nix/store/7xi79pp0a0vlzlyws8m8bb9aa1rpzg54-bind-9.18.14-dnsutils
  /nix/store/ywv0pi4c10ib0kmndr34fh86dhf4wax1-bind-9.18.14
copying path '/nix/store/ywv0pi4c10ib0kmndr34fh86dhf4wax1-bind-9.18.14' from 'https://cache.nixos.org'...
copying path '/nix/store/7xi79pp0a0vlzlyws8m8bb9aa1rpzg54-bind-9.18.14-dnsutils' from 'https://cache.nixos.org'...

; <<>> DiG 9.18.14 <<>> @127.0.0.1 consul.service.staging.consul
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47775
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;consul.service.staging.consul.	IN	A

;; ANSWER SECTION:
consul.service.staging.consul. 0 IN	A	10.183.1.3
consul.service.staging.consul. 0 IN	A	10.183.1.1
consul.service.staging.consul. 0 IN	A	10.183.1.2

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1) (UDP)
;; WHEN: Tue Jun 13 11:20:36 CEST 2023
;; MSG SIZE  rcvd: 106
</pre>


# nomad run job

<pre>
# DIR taken from ./tlsproxy command 
DIR=/run/user/1000/tmp.XlxMl57UUj && export NOMAD_ADDR=http://localhost:4646 && NOMAD_CLIENT_CERT=$DIR/nomad-client.crt && NOMAD_CLIENT_KEY=$DIR/nomad-client.key && NOMAD_CAFILE=$DIR/nomad.crt && export NOMAD_CLIENT_CERT NOMAD_CLIENT_KEY NOMAD_CAFILE

nomad run deploy/d53.hcl 
</pre>

Output:
<pre>

==> 2023-06-13T18:23:14+02:00: Monitoring evaluation "1c372003"
    2023-06-13T18:23:14+02:00: Evaluation triggered by job "core-d53"
    2023-06-13T18:23:15+02:00: Evaluation within deployment: "1d76cdff"
    2023-06-13T18:23:15+02:00: Allocation "3c60f828" created: node "bc13f4eb", group "D53"
    2023-06-13T18:23:15+02:00: Allocation "ee53d630" created: node "bc13f4eb", group "gitea-dummy"
    2023-06-13T18:23:15+02:00: Evaluation status changed: "pending" -> "complete"
==> 2023-06-13T18:23:15+02:00: Evaluation "1c372003" finished with status "complete"
==> 2023-06-13T18:23:15+02:00: Monitoring deployment "1d76cdff"
  ✓ Deployment "1d76cdff" successful
    
    2023-06-13T18:23:26+02:00
    ID          = 1d76cdff
    Job ID      = core-d53
    Job Version = 4
    Status      = successful
    Description = Deployment completed successfully
    
    Deployed
    Task Group   Desired  Placed  Healthy  Unhealthy  Progress Deadline
    D53          1        1       1        0          2023-06-13T18:33:25+02:00
    gitea-dummy  1        1       1        0          2023-06-13T18:33:26+02:00
</pre>

# consul put key

Run:
<pre>
   export SSH_USER=root; export ROOT_PASS=dummy
   export KEY=secrets/d53/gandi_api_key
   export VALUE=xyz12
   ./consul_put_key staging node1
</pre>

Output:

<pre>
   - set CONSUL_HTTP_ADDR=https://localhost:8501
   - set CONSUL_CACERT=/var/lib/consul/pki/consul-ca.crt
   - set CONSUL_CLIENT_CERT=/var/lib/consul/pki/consul-client.crt
   - set CONSUL_CLIENT_KEY=/var/lib/consul/pki/consul-client.key
   - run consul kv put secrets/d53/gandi_api_key xyz12
   Success! Data written to: secrets/d53/gandi_api_key
   removed '/tmp/deploytool_askpass_81625ea27317e1b565801393'
</pre>