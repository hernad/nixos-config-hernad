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


    interfaces."enp4s0" = {
       mtu = 9000;
    };
    
    interfaces."lan10" = {
        mtu = 9000;
    };


    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/


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
      router = import ./kvm_router.nix;
      router2 = import ./kvm_router2.nix;
    };
  };


  system.stateVersion = "23.05";
}
