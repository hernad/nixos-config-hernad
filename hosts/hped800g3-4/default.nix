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
    hostName = "hped800g3-4";
    defaultGateway = "192.168.168.251";

    # test phase
    firewall.enable = false;

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10" 
    ];
    #dhcpd.enable = false;
    useDHCP = true;

    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/

    interfaces."enp1s0" = {
       macAddress = "24:1c:04:f3:73:47";
       mtu = 9000;
    };

    bridges = {
       "br0" = {
          interfaces = [ "eno1" ];
       };

       "br10" = {
          interfaces = [ "enp1s0" ];
          rstp = true;
       };
    };

    interfaces.br0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4 = {
        addresses = [{
          address = "192.168.168.109";
          prefixLength = 24;
        }];
      };
    };

    interfaces.br10 = {
      useDHCP = false;
      wakeOnLan.enable = false;
      mtu = 9000;
      ipv4 = {
        addresses = [{
          address = "10.0.99.4";
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


    # ethernet 10g intel 8086:10fb
    pciIDs = "1cc1:5766";
    libvirtUsers = [ "hernad" ];
  };

  testConfig.enable = true;

  libvirtGuests = {
    enable = true;
    guests = {
      guest1 = {
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
        pci1enable = false;
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

        bridge2enable = true;
        hostBridge2 = "br10";
        mac2 = "52:54:00:14:1f:22";
        mtu2 = "9000";
        vhostConfig2 = true;
      };

      guest2 = {
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

        bridge2enable = false;
        hostBridge2 = "br10";
        mac2 = "52:54:00:14:7e:12";
        mtu2 = "9000";
        vhostConfig2 = true;
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
