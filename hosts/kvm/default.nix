{ inputs, outputs, ... }: {
  imports = [
    #./hardware-configuration.nix
  ];

  virtualisation.libvirtd.enable = false;
  
}