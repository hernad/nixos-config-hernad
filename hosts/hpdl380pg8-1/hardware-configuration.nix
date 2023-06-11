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
       grub.device = "/dev/disk/by-id/ata-TS240GSSD220S_H659880480";
                      
    #  systemd-boot = {
    #    enable = true;
    #    consoleMode = "max";
    #  };
    #  efi.canTouchEfiVariables = true;
    };
  };

 fileSystems."/" = { 
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ 
      { 
        device = "/dev/disk/by-label/swap"; 
      }
  ];



  #swapDevices = [{
  #  device = "/swap/swapfile";
  #  size = 8196;
  #}];

  nixpkgs.hostPlatform.system = "x86_64-linux";
  #hardware.cpu.amd.updateMicrocode = true;
}