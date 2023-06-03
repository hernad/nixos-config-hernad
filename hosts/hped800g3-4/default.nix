{ pkgs, inputs, ... }: {
  imports = [
    #inputs.hardware.nixosModules.common-cpu-amd
    #inputs.hardware.nixosModules.common-gpu-amd
    #inputs.hardware.nixosModules.common-pc-ssd

    ../hped800g3

  ];

  networking = {
    hostName = "hped800g3-4";
    defaultGateway = "192.168.168.251";

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10" 
    ];
    #dhcpd.enable = false;
    useDHCP = true;
    interfaces.eno1 = {
      useDHCP = false;
      wakeOnLan.enable = true;

      ipv4 = {
        addresses = [{
          address = "192.168.168.109";
          prefixLength = 24;
        }];
      };

      
      
      #ipv6 = {
      #  addresses = [{
      #    address = "2804:14d:8084:a484::2";
      #    prefixLength = 64;
      #  }];
      #};
    };
  };

  #boot = {
  #  kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  #  binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  #};

  #programs = {
  #  adb.enable = true;
  #  dconf.enable = true;
  #  kdeconnect.enable = true;
  #};

  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #};

  #hardware = {
  #  opengl = {
  #    enable = true;
  #    extraPackages = with pkgs; [ amdvlk ];
  #    driSupport = true;
  #    driSupport32Bit = true;
  #  };
  #  openrgb.enable = true;
  #  opentabletdriver.enable = true;
  #};

  system.stateVersion = "23.05";
}