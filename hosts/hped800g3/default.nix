{ pkgs, config, inputs, outputs, ... }: {
  imports = [
    ./hardware-configuration.nix

  ]; 

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;

 
  environment.systemPackages = with pkgs; [
    drbd9
    zfs 
  ];


  #++ (builtins.attrValues outputs.nixosModules);

  #home-manager.extraSpecialArgs = { inherit inputs outputs; };

  #nixpkgs = {
  #  overlays = builtins.attrValues outputs.overlays;
  #  config = {
  #    allowUnfree = true;
  #  };
  #};

  #environment.enableAllTerminfo = true;

  #hardware.enableRedistributableFirmware = true;
  #networking.domain = "m7.rs";

  # Increase open file limit for sudoers
  #security.pam.loginLimits = [
  #  {
  #    domain = "@wheel";
  #    item = "nofile";
  #    type = "soft";
  #    value = "524288";
  #  }
  #  {
  #    domain = "@wheel";
  #    item = "nofile";
  #    type = "hard";
  #    value = "1048576";
  #  }
  #];
}