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
  
    #head -c4 /dev/urandom | od -A none -t x4
    hostId = "f6174120";



    extraHosts =
    ''
    10.0.99.3 hped800g3-3
    '';

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

    vlans = {
      lan10 = {
        interface = "enp1s0";
        id = 2000;
      };
    };

    interfaces = {
        lan10.mtu = 9000;
    };

    #interfaces."enp1s0" = {
    #   macAddress = "24:1c:04:f3:73:47";
    #   mtu = 9000;
    #};

    bridges = {
       "br0" = {
          interfaces = [ "eno1" ];
       };

       "br10" = {
          interfaces = [ "lan10" ];
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

  services.drbd = import ../drbd.nix;
  

  testConfig.enable = true;

  libvirtGuests = {
    enable = true;
    guests = {
      guest1 = {
        osInfo = "http://nixos.org/nixos/22.11";
        efi = false;
        currentMemory = "4194304"; #4GB
        memory = "8388608";
      
        diskSize = "40";
        vcpu = "4";
        CDROM = true;
        #pciDomain = "0x0100";

        # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+
        pci1 = {
          enable = false;
          bus = "0x01";
          slot = "0x0";
          function = "0x0";
        };

        pci2 = {
          enable = false;
          bus = "0x00";
          slot = "0x0";
          function = "0x0";
        };

        pci3 = {
          enable = false;
          bus = "0x00";
          slot = "0x0";
          function = "0x0";
        };

        #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co.
        #pci2enable = true;
        #pciBus2 = "0x02";
        #pciSlot2 = "0x0";

        #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co
        #pci3enable = true;
        #pciBus3 = "0x03";
        #pciSlot3 = "0x0";

        net1 = {
          enable = true;
          mac = "52:54:00:14:1f:20";
          hostBridge = "br0";
          mtu = "1500";
          vhostConfig = false;
        };

        net2 = {
          enable = true;
          hostBridge = "br10";
          mac = "52:54:00:14:1f:22";
          mtu = "9000";
          vhostConfig = true;
        };

        net3 = {
          enable = false;
          hostBridge = "br00";
          mac = "00:00:00:00:00:00";
          mtu = "1500";
          vhostConfig = false;
        };

      };

      

      node2 = {
        osInfo = "http://nixos.org/nixos/22.11";
        efi = true;
        currentMemory = "4194304"; #4GB
        memory = "8388608";
        diskSize = "40";
        vcpu = "4";
        #CDROM = true;
        CDROM = false;

        #pciDomain = "0x0100";

        # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+
        pci1 = {
          enable = false;
          bus = "0x01";
          slot = "0x0";
          function = "0x0";
        };

        #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co.
        pci2 = {
          enable = false;
          bus = "0x02";
          slot = "0x0";
          function = "0x0";
        };

        #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co
        pci3 = { 
          enable = false;
          bus = "0x03";
          slot = "0x0";
          function = "0x0";
        };

        net1 = {
          enable = true;
          mac = "52:54:09:13:5b:02";
          hostBridge = "br0";
          mtu = "1500";
          vhostConfig = false;
        };

        net2 = {
          enable = true;
          mac = "52:54:09:13:5b:04";
          hostBridge = "br10";
          mtu = "9000";
          vhostConfig = true;
        };

        net3 = {
          enable = false;
          mac = "52:54:09:13:5b:05";
          hostBridge = "br00";
          mtu = "1500";
          vhostConfig = false;
        };
  
      };

      node3 = {
        osInfo = "http://nixos.org/nixos/22.11";
        efi = true;
        currentMemory = "4194304"; #4GB
        memory = "8388608";
        diskSize = "40";
        vcpu = "4";
        #CDROM = true;
        CDROM = false;

        #pciDomain = "0x0100";

        # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+
        pci1 = {
          enable = false;
          bus = "0x01";
          slot = "0x0";
          function = "0x0";
        };

        #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co.
        pci2 = {
          enable = false;
          bus = "0x02";
          slot = "0x0";
          function = "0x0";
        };

        #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co
        pci3 = { 
          enable = false;
          bus = "0x03";
          slot = "0x0";
          function = "0x0";
        };

        net1 = {
          enable = true;
          mac = "52:54:09:13:6c:02";
          hostBridge = "br0";
          mtu = "1500";
          vhostConfig = false;
        };

        net2 = {
          enable = true;
          mac = "52:54:09:13:6c:04";
          hostBridge = "br10";
          mtu = "9000";
          vhostConfig = true;
        };

        net3 = {
          enable = false;
          mac = "52:54:09:13:6c:05";
          hostBridge = "br00";
          mtu = "1500";
          vhostConfig = false;
        };
  
      };

    };
  };



  system.stateVersion = "23.05";
}
