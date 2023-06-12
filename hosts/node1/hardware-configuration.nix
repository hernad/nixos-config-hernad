{
  #imports = [
  #  ../common/optional/ephemeral-btrfs.nix
  #  ../common/optional/encrypted-root.nix
  #];

  boot = {
    
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];



  nixpkgs.hostPlatform.system = "x86_64-linux";
  #hardware.cpu.amd.updateMicrocode = true;
}