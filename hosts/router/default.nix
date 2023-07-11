{ pkgs, inputs, ... }: 

let
    lan10DnsServers = "192.168.168.10, 192.168.169.10";
    lanInterface = "enp2s0";
    wanInterface = "enp1s0";
    lan10Interface = "enp4s0";
in {
  imports = [
    ./hardware-configuration.nix
    ../kvm
    ../common/global/kvm.nix
    ../common/users/hernad
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    pciutils 
    tcpdump
    iptables
  ];

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
    
    useDHCP = false;

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
      "enp4s0" = {
         mtu = 9000;
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

    # 10G SPF+
    interfaces.enp4s0 = {
      useDHCP = false;
      wakeOnLan.enable = false;
      ipv4 = {
        addresses = [{
          address = "10.0.99.254";
          prefixLength = 24;
        }];
      };
    };

    nftables = 
    {
      enable = true;
      ruleset = ''
        table ip filter {
          chain input {
            #iifname { "enp2s0", "lan", "wg0" } accept comment "Allow local and wg network to access the router"
            #iifname "enp1s0" udp dport 5000 counter accept comment "Allow UDP 5000 for Wireguard"

            type filter hook input priority 0; policy drop;
            iifname { "${lanInterface}", "${lan10Interface}" } accept comment "Allow local network to access the router"
            iifname { "${wanInterface}" } ct state { established, related } accept comment "Allow established traffic"
            iifname { "${wanInterface}" } icmp type { echo-request, destination-unreachable, time-exceeded } counter accept comment "Allow select ICMP"
            iifname { "${wanInterface}" } counter drop comment "Drop all other unsolicited traffic from wan"
            #iifname {"${lanInterface}", "${lan10Interface} } ip saddr { 10.13.93.11 } udp dport { mdns, llmnr } counter accept comment "multicast for media devices, printers"

          
          }
          chain forward {
            type filter hook forward priority filter; policy drop;
            iifname { "${lanInterface}", "${lan10Interface}"} oifname { "${wanInterface}" } accept comment "Allow trusted LAN to WAN"
            iifname { "${wanInterface}" } oifname { "${lanInterface}", "${lan10Interface}" } ct state established, related accept comment "Allow established back to LANs"
            
            iifname { "${lanInterface}" } oifname { "${lan10Interface}" } accept comment "Allow lan -> lan10"
            iifname { "${lan10Interface}" } oifname { "${lanInterface}" } ct state established, related accept comment "Allow established lan10 back to lan"
            
            #iifname { "lan", "wg0" } ip daddr 192.168.1.0/24 counter accept comment "Allow trusted LAN/WG to Mgmt (default)"
            #iifname { "lan", "hazmat", "wg0" } oifname { "iot" } counter accept comment "Allow trusted LAN to IoT"
            #iifname { "iot" } oifname { "lan", "hazmat", "wg0" } ct state { established, related } counter accept comment "Allow established back to LANs"

            #iifname { "lan", "wg0" } ip daddr 192.168.1.0/24 counter accept comment "Allow trusted LAN/WG to Mgmt (default)"
            #ip saddr 192.168.1.0/24 oifname { "lan", "wg0" } ct state { established, related } counter accept comment "Allow established back to LAN/WG"

            #iifname { "lan", "wg0" } oifname { "lan", "wg0" } counter accept comment "Allow lan/Wireguard bi-directionaly"
 
            #ip saddr 10.13.93.50 ip daddr 10.13.84.20 tcp dport 22 counter accept comment "allow ssh from home assistant to agent for backup"

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

  
  
  #services.dhcpd4 = {
  #  enable = true;
  #  interfaces = [ "${lan10Interface}" ];
  #  extraConfig = ''
  #    subnet 10.0.99.0 netmask 255.255.255.0 {
  #      option routers 10.0.99.254;
  #      option domain-name-servers ${lan10DnsServers};
  #      option subnet-mask 255.255.255.0;
  #      interface enp2s0;
  #      range 10.0.99.1 10.0.99.253;
  #    }
  #  '';
  #};

  # the following new units were started: kea-dhcp4-server.service

  services.kea.dhcp4 = {
    enable = true;
    settings = {
        interfaces-config = {
          interfaces = [
            "${lan10Interface}"
          ];
        };
        lease-database = {
          name = "/var/lib/kea/dhcpd4.leases";
          persist = true;
          type = "memfile";
        };
        rebind-timer = 2000;
        renew-timer = 1000;
        subnet4 = [
          {
            pools = [
              {
                pool = "10.0.99.1 - 10.0.99.244";
              }
            ];
            subnet = "10.0.99.0/24";
          }
        ];
        valid-lifetime = 4000;
    };
  };


  services.miniupnpd = {
    enable = true;
    externalInterface = "${wanInterface}"; # WAN
    internalIPs = [ 
      "${lanInterface}"
      "${lan10Interface}"
    ]; # LAN
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    reflector = true;
    interfaces = [
      "${lanInterface}"
      "${lan10Interface}"
    ];
  };

  testConfig.enable = false;

  system.stateVersion = "23.05";
}


#[root@router:~]# nft list tables
#table ip filter
#table ip nat
#table ip6 filter
#
#[root@router:~]# nft list table ip filter
#table ip filter {
#	chain input {
#		type filter hook input priority filter; policy drop;
#		iifname "enp2s0" accept comment "Allow local network to access the router"
#		iifname "enp1s0" ct state { established, related } accept comment "Allow established traffic"
#		iifname "enp1s0" icmp type { destination-unreachable, echo-request, time-exceeded } counter packets 1 bytes 56 accept comment "Allow select ICMP"
#		iifname "enp1s0" counter packets 56 bytes 4340 drop comment "Drop all other unsolicited traffic from wan"
#	}
#
#	chain forward {
#		type filter hook forward priority filter; policy drop;
#		iifname "enp2s0" oifname "enp1s0" accept comment "Allow trusted LAN to WAN"
#		iifname "enp1s0" oifname "enp2s0" ct state established,related accept comment "Allow established back to LANs"
#	}
#}
#
#[root@router:~]# nft list table ip nat
#table ip nat {
#	chain postrouting {
#		type nat hook postrouting priority srcnat; policy accept;
#		oifname "enp1s0" masquerade
#	}
#}

