{ pkgs, inputs, ... }: {
  imports = [
    ../kvm
    ../common/global
    ../common/users/hernad

  ];

  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # router
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
  };

  networking = {
    hostName = "router";
    # telemach T1 router
    defaultGateway = "192.168.254.1";

    # test phase
    firewall.enable = false;

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10"
    ];
    #dhcpd.enable = false;
    useDHCP = true;

    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/

    interfaces = {
      # T1
      "enp1s0" = {
         mtu = 1500;
      };
      # lan mreza
      "enp2s0" = {
         mtu = 1500;
      };
    };

 
    interfaces.enp1s0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4 = {
        # Telemach T1 
        addresses = [{
          address = "192.168.254.10";
          prefixLength = 24;
        }];
      };
    };

    interfaces.enp2s0 = {
      useDHCP = false;
      wakeOnLan.enable = false;
      ipv4 = {
        addresses = [{
          address = "192.168.168.106";
          prefixLength = 24;
        }];
      };
    };
  };

  nftables = 
  let
    lanInterface = "enp2s0";
    wanInterface = "enp1s0";
  in
  {
      enable = true;
      ruleset = ''
        table ip filter {
          chain input {
            type filter hook input priority 0; policy drop;
            iifname { "${lanInterface}" } accept comment "Allow local network to access the router"
            iifname { "${wanInterface}" } ct state { established, related } accept comment "Allow established traffic"
            iifname { "${wanInterface}" } icmp type { echo-request, destination-unreachable, time-exceeded } counter accept comment "Allow select ICMP"
            iifname { "${wanInterface}" } counter drop comment "Drop all other unsolicited traffic from wan"
          }
          chain forward {
            type filter hook forward priority filter; policy drop;
            iifname { "${lanInterface}" } oifname { "${wanInterface}" } accept comment "Allow trusted LAN to WAN"
            iifname { "${wanInterface}" } oifname { "${lanInterface}" } ct state established, related accept comment "Allow established back to LANs"
          }
        }

        table ip nat {
          chain postrouting {
            type nat hook postrouting priority 100; policy accept;
            oifname "${wanInterface}" masquerade
          } 
        }

        table ip6 filter {
	        chain input {
            type filter hook input priority 0; policy drop;
          }
          chain forward {
            type filter hook forward priority 0; policy drop;
          }
        }
      '';
    };
  };

  testConfig.enable = false;


  system.stateVersion = "23.05";
}
