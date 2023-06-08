{ pkgs, inputs, ... }: {
  imports = [
    #inputs.hardware.nixosModules.common-cpu-amd
    #inputs.hardware.nixosModules.common-gpu-amd
    #inputs.hardware.nixosModules.common-pc-ssd

    ../hped800g3
    ../common/global
    ../common/users/hernad

  ];

  networking = {
    hostName = "hped800g3-3";
    defaultGateway = "192.168.168.251";

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10" 
    ];
    #dhcpd.enable = false;
    useDHCP = true;

    # test phase
    firewall.enable = false;

    bridges = {
       "br0" = {
          interfaces = [ "eno1" ];
       };
    };

    interfaces.br0 = {
      useDHCP = false;
      wakeOnLan.enable = true;

      # network-addresses-eno1.service

      ipv4 = {
        addresses = [{
          address = "192.168.168.108";
          prefixLength = 24;
        }];
      };

    };
  };

  pciPassthrough = {
    enable = true;
    cpuType = "intel";
    
    # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection [8086:10fb] (rev 01)

    #IOMMU Group 9:
    #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co., Ltd. ADATA XPG GAMMIXS1 1L Media [1cc1:5766] (rev 01)
    #IOMMU Group 10:
    #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co., Ltd. ADATA XPG GAMMIXS1 1L Media [1cc1:5766] (rev 01)



    pciIDs = "1cc1:5766,8086:10fb";
    libvirtUsers = [ "hernad" ];
  };

  testConfig.enable = true;

  libvirtGuests = {
    enable = true;
    guests = {
      guest31 = {
        osInfo = "http://nixos.org/nixos/22.11";
        currentMemory = "4194304"; #4GB
        memory = "8388608";
        mac = "52:54:00:14:1f:20";
        hostNic = "br0";
        diskSize = "40";
        vcpu = "4";
        CDROM = true;
        #pciDomain = "0x0100";

        # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+
        pci1enable = true;
        pciBus1 = "0x01";
        pciSlot1 = "0x0";

        #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co.
        pci2enable = true;
        pciBus2 = "0x02";
        pciSlot2 = "0x0";

        #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co
        pci3enable = true;
        pciBus3 = "0x03";
        pciSlot3 = "0x0";
      };
      guest32 = {
        osInfo = "http://nixos.org/nixos/22.11";
        currentMemory= "2097152"; #2GB
        memory = "8388608";  #8GB
        mac = "52:54:00:14:7e:10";
        hostNic = "br0";
        diskSize = "30";
        vcpu = "2";
        CDROM = false;
        pci1enable = false;
        #pciDomain = "0x0000";
        pciBus1 = "0x00";
        pciSlot1 = "0x0";

        pci2enable = false;
        pciBus2 = "0x00";
        pciSlot2 = "0x0";

        pci3enable = false;
        pciBus3 = "0x00";
        pciSlot3 = "0x0";
        
      };
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
