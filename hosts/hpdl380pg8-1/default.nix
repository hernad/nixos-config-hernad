{ pkgs, inputs, ... }: {
  imports = [
    ../hpdl380pg8
    ../common/global
    ../common/users/hernad
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

    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/

    interfaces."enp1s0" = {
       #macAddress = "24:1c:04:f3:73:47";
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
        currentMemory = "4194304"; #4GB
        memory = "4194304";
        mac = "52:54:00:01:1e:20";
        hostNic = "br0";
        diskSize = "40";
        vcpu = "4";
        CDROM = true;
        #pciDomain = "0x0100";

        pci1enable = false;
        pciBus1 = "0x01";
        pciSlot1 = "0x0";

        pci2enable = false;
        pciBus2 = "0x02";
        pciSlot2 = "0x0";

        pci3enable = false;
        pciBus3 = "0x03";
        pciSlot3 = "0x0";

        bridge2enable = true;
        hostBridge2 = "br10";
        mac2 = "52:54:00:01:1e:22";
        mtu2 = "9000";
        ip2 = {
          address = "10.0.99.14";
          prefix = "24";
          gateway = "10.0.99.3";
        };
      };
    };
  };


  system.stateVersion = "23.05";
}
