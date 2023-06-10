{ inputs, outputs, ... }: {
  imports = [
    #./hardware-configuration.nix
  ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "usbhid" "sr_mod" "virtio_blk" ];

  virtualisation.libvirtd.enable = false;
  
}