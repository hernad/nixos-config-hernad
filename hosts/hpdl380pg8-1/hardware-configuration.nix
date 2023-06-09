{
  #imports = [
  #  ../common/optional/ephemeral-btrfs.nix
  #  ../common/optional/encrypted-root.nix
  #];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "kvm-intel" ];
    };
    loader = {
       grub.device = "/dev/sdc";

    #  systemd-boot = {
    #    enable = true;
    #    consoleMode = "max";
    #  };
    #  efi.canTouchEfiVariables = true;
    };
  };

 fileSystems."/" = { device = "/dev/disk/by-uuid/bf6c0464-cc93-4e89-b686-7b0f3891c63a";
      fsType = "ext4";
  };

  swapDevices =
    [ 
      { device = "/dev/disk/by-uuid/fc250fb2-e4e6-4c55-b8c6-79ea0c46f04c"; }
    ];



  };


  #swapDevices = [{
  #  device = "/swap/swapfile";
  #  size = 8196;
  #}];

  nixpkgs.hostPlatform.system = "x86_64-linux";
  #hardware.cpu.amd.updateMicrocode = true;
}