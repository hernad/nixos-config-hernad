{
  #imports = [
  #  ../common/optional/ephemeral-btrfs.nix
  #  ../common/optional/encrypted-root.nix
  #];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "kvm-intel" ];
    };
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  };


  swapDevices = [{
    device = "/dev/disk/by-label/swap";
  }];

  
  nixpkgs.hostPlatform.system = "x86_64-linux";
  #hardware.cpu.amd.updateMicrocode = true;
}