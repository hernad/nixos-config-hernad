# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
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
    
  ] ++ (if virtualisation.libvirtd.enable then [ 
    ./system-packages.nix
    ./libvirtd.nix
  ] else [
    ./system-packages-kvm.nix  
  ])  ++ (builtins.attrValues outputs.nixosModules);
 

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  environment.enableAllTerminfo = true;

  hardware.enableRedistributableFirmware = true;
  #networking.domain = "m7.rs";

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
