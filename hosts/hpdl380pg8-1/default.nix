{ pkgs, inputs, ... }: {
  imports = [
    ../hpdl380pg8
    ../common/global
    ../common/users/hernad
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "hpdl380pg8-1";
    defaultGateway = "192.168.168.251";

    # test phase
    firewall.enable = false;

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10" 
    ];
    #dhcpd.enable = false;
    useDHCP = true;

    vlans = {
      lan10 = {
        # 10G SFP+
        interface = "enp4s0";
        id = 2000;
      };
    };

    interfaces = {
        lan10.mtu = 9000;
    };


    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/

    #interfaces."enp4s0" = {
       #macAddress = "24:1c:04:f3:73:47";
    #   mtu = 9000;
    #};

    bridges = {
       "br0" = {
          interfaces = [ "eno2" ];
       };
       "br10" = {
          interfaces = [ "lan10" ];
          rstp = true;
       };
       "brt1" = {
          interfaces = [ "t1" ];
          rstp = true;
       };
       "brt2" = {
          interfaces = [ "t2" ];
          rstp = true;
       };
    };

    vlans = {
      t1 = {
        interface = "eno2";
        id = 1001;
      };

      t2 = {
        interface = "eno2";
        id = 1002;
      };
    };

    interfaces.br0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4 = {
        addresses = [{
          address = "192.168.168.107";
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
          address = "10.0.99.1";
          prefixLength = 24;
        }];
      };
    };


  };

  pciPassthrough = {
    enable = true;
    cpuType = "intel";
    
    # ethernet 10g intel 8086:10fb
    pciIDs = "1cc1:5766";
    libvirtUsers = [ "hernad" ];
  };

  #testConfig.enable = true;

  libvirtGuests = {
    enable = true;
    guests = {
      router = {
        osInfo = "http://nixos.org/nixos/22.11";
        efi = true;
        currentMemory = "4194304"; #4GB
        memory = "4194304";
        diskSize = "40";
        vcpu = "4";
        #CDROM = true;
        CDROM = false;
        #pciDomain = "0x0100";

        pci1 = {
           enable = false;
           bus = "0x01";
           slot = "0x0";
           function = "0x0";
        };

        pci2 = {
           enable = false;
           bus = "0x02";
           slot = "0x0";
           function = "0x0";
        };

        pci3 = {
          enable = false;
          bus = "0x03";
          slot = "0x0";
          function = "0x0";
        };

        net1 = {
           enable = true;
           hostBridge = "br0";
           mac = "52:54:00:01:1e:20";
           mtu = "1500";
           vhostConfig = false;
        };

        net2 = {
          enable = true;
          hostBridge = "brt1";
          mac = "52:54:00:01:1e:22";
          mtu = "1500";
          vhostConfig = false;
        };

        net3 = {
          enable = true;
          hostBridge = "br10";
          mac = "52:4f:00:01:20:22";
          mtu = "9000";
          vhostConfig = false;
        };


      };
    };
  };


  system.stateVersion = "23.05";
}
