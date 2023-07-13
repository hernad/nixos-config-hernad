# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  pciPassthrough = import ./pciPassthrough.nix;
  testConfig = import ./test-config.nix;
  libvirtGuests = import ./libvirt-guests.nix;
  consulCluster = import ./consul-cluster.nix;
  drbd9 = import ./drbd9.nix;
  miniupnpd-nft = import ./miniupnpd-nft.nix;
}
