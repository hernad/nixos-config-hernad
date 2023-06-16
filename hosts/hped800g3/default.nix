{ pkgs, config, inputs, outputs, ... }: {
  imports = [
    ./hardware-configuration.nix

  ]; 

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;

  # https://nixos.wiki/wiki/Linux_kernel

  # https://discourse.nixos.org/t/make-custom-kernel-build-with-custom-configuration/17464

  # override linux_6_1
  #boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1.override {
  #  argsOverride = rec {
  #    src = pkgs.fetchurl {
  #          url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
  #          sha256 = "sha256-sm98vL+AMe/EnxHyNvNy/DSk/V/GrTFRuJPRqgOO1gM=";
  #    };
  #    version = "6.1.34";
  #    modDirVersion = "6.1.34";
  #    };
  #});

 
  environment.systemPackages = with pkgs; [
    #drbd9
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