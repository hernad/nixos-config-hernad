{ config, pkgs, ... }:

{
  imports =
    [
      ./remote-unlock.nix
    ];

  bring-out.remoteUnlock = {
    networkInterface = "eno1";
    staticIP = "192.168.168.134/24";
    defaultGateway = "192.168.168.251";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 20;
  boot.loader.efi.canTouchEfiVariables = true;

  bring-out.hostName = "node1";
  #deuxfleurs.staticIPv6.address = "2001:910:1204:1::22";

  system.stateVersion = "23.05";
}