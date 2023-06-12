# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./init.nix
    ./sops.nix
    #./acme.nix
    #./auto-upgrade.nix
    #./system-packages.nix
    ./fish.nix
    ./locale.nix
    #./nix.nix
    ./openssh.nix
    ./optin-persistence.nix
    #./podman.nix
    #./ssh-serve-store.nix
    #./steam-hardware.nix
    #./systemd-initrd.nix
    #./tailscale.nix
    ./libvirtd.nix
    ./system-packages.nix 
  ] ++ (builtins.attrValues outputs.nixosModules);
 
  # Turn on this option if you want to enable all the firmware with a license allowing redistribution.
  hardware.enableRedistributableFirmware = true;

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };


}
