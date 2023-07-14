{ pkgs, inputs, ... }: 

let
    lan10DnsServers = "192.168.168.10, 192.168.169.10";
    lanInterface = "enp2s0";
    lan10Interface = "enp4s0";

    wanInterface = "enp1s0";
    wgInterface = "wgcgnat";
    
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

    wireguard.interfaces = {
          wgcgnat = {
            ips = [ "10.100.0.2/24" ];
            privateKeyFile = "/root/.wireguard/wg0.private.key";
            
            # https://github.com/mochman/Bypass_CGNAT/blob/main/Wireguard%20Configs/Local%20Server/wg0.conf
            #postSetup = ''
            #    ${pkgs.iptables}/bin/iptables -t nat -A PREROUTING -p tcp --dport 8123 -j DNAT --to-destination 192.168.168.150:8123
            #    ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -p tcp --dport 8123 -j MASQUERADE
            #'';
            #postShutdown = ''
            #    ${pkgs.iptables}/bin/iptables -t nat -D PREROUTING -p tcp --dport 8123 -j DNAT --to-destination 192.168.168.150:8123
            #    ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -p tcp --dport 8123 -j MASQUERADE
            #'';
            allowedIPsAsRoutes = false;
            peers = [
      
               {
                  publicKey = "sucaAlxoWAzJrzz7GTWv3niKqdeXOAPlNOJjh10883Q=";
                  # ako prolaze public lan adrese mora se sve dopustiti
                  allowedIPs = [ "0.0.0.0/0" ];
                  #allowedIPs = [ "10.100.0.1/32" ];
                  # ora1
                  endpoint = "193.123.37.206:55107";
                  # Send keepalives every 25 seconds. Important to keep NAT tables alive.
                  persistentKeepalive = 25;
              }
            ];
            
          };
    };


    nftables = 
    {
      enable = true;
      ruleset = ''
        table ip filter {
          
          # https://github.com/miniupnp/miniupnp/blob/master/miniupnpd/netfilter_nft/README.md
          # miniupnpd

          # allow multicast
          # https://gist.github.com/juliojsb/00e3bb086fd4e0472dbe

          # https://github.com/miniupnp/miniupnp/issues/590

          # iptables-legacy -t nat -L -n -v


          chain input {
            type filter hook input priority 0; 
            policy drop;

            iifname { "${lanInterface}", "${lan10Interface}" } udp dport mdns accept comment "allow mDNS"
            iifname { "${lanInterface}", "${lan10Interface}" } udp dport 1900 accept comment "allo IGP"

            #iifname { "enp2s0", "lan", "wg0" } accept comment "Allow local and wg network to access the router"
            #iifname "enp1s0" udp dport 5000 counter accept comment "Allow UDP 5000 for Wireguard"

            iifname { "${lanInterface}", "${lan10Interface}", "${wgInterface}" } accept comment "Allow local network to access the router"
            
            iifname { "${wanInterface}", "${wgInterface}"  } ct state { established, related } accept comment "Allow established traffic"
            iifname { "${wanInterface}", "${wgInterface}" } icmp type { echo-request, destination-unreachable, time-exceeded, 156 } counter accept comment "Allow select ICMP"            
            iifname { "${wanInterface}" } counter drop comment "Drop all other unsolicited traffic from wan"
            
            
            #iifname {"${lanInterface}", "${lan10Interface} } ip saddr { 10.13.93.11 } udp dport { mdns, llmnr } counter accept comment "multicast for media devices, printers"
            
            pkttype {broadcast, multicast} accept
          
            # https://github.com/miniupnp/miniupnp/issues/397
            #ip protocol icmp counter packets 3 bytes 156 accept
		        ip protocol igmp counter packets 0 bytes 0 accept comment "accept IGMP"

            counter comment "total unfiltered input packets"
            log            # simple detail goes into the log
            log flags all  # extra details go into the log
            log flags all prefix "GOTCHA!: " # parseable keyword
            log flags all counter  # redundant but example

          }
          chain forward {
            type filter hook forward priority filter; 
            policy drop;

            iifname { "${lanInterface}", "${lan10Interface}", "${wgInterface}"} oifname { "${wanInterface}" } accept comment "Allow trusted LAN to WAN"
            iifname { "${wanInterface}", "${wgInterface}" } oifname { "${lanInterface}", "${lan10Interface}", "${wgInterface}" } ct state established, related accept comment "Allow established back to LANs"
            
            iifname { "${lanInterface}" } oifname { "${lan10Interface}" } accept comment "Allow lan -> lan10"
            iifname { "${lan10Interface}" } oifname { "${lanInterface}" } ct state established, related accept comment "Allow established lan10 back to lan"
            
            iifname { "${lanInterface}" } oifname { "${wgInterface}" } accept comment "Allow lan -> wireguard"
            iifname { "${wgInterface}" } oifname { "${lanInterface}" } ct state established, related accept comment "Allow established wireguard back to lan"
            
            iifname { "${lan10Interface}" } oifname { "${wgInterface}" } accept comment "Allow lan10 -> wireguard"
            iifname { "${wgInterface}" } oifname { "${lan10Interface}" } ct state established, related accept comment "Allow established wireguard back to lan10"
            
            iifname { "${wgInterface}" } oifname { "${lanInterface}" } accept comment "Allow wireguard -> lan"
            iifname { "${lanInterface}" } oifname { "${wgInterface}" } ct state established, related accept comment "Allow established lan to wireguard"
            

            #iifname { "lan", "wg0" } ip daddr 192.168.1.0/24 counter accept comment "Allow trusted LAN/WG to Mgmt (default)"
            #iifname { "lan", "hazmat", "wg0" } oifname { "iot" } counter accept comment "Allow trusted LAN to IoT"
            #iifname { "iot" } oifname { "lan", "hazmat", "wg0" } ct state { established, related } counter accept comment "Allow established back to LANs"

            #iifname { "lan", "wg0" } ip daddr 192.168.1.0/24 counter accept comment "Allow trusted LAN/WG to  Mgmt (default)"
            #ip saddr 192.168.1.0/24 oifname { "lan", "wg0" } ct state { established, related } counter accept comment "Allow established back to LAN/WG"

            #iifname { "lan", "wg0" } oifname { "lan", "wg0" } counter accept comment "Allow lan/Wireguard bi-directionaly"
 
            #ip saddr 10.13.93.50 ip daddr 10.13.84.20 tcp dport 22 counter accept comment "allow ssh from home assistant to agent for backup"

            pkttype {broadcast, multicast} accept

          }

        }

        # IPv4-Packet --> table "ip"  --> table "inet" --> further checks

        table inet filter {
          #chain input {
          #   # https://tldp.org/HOWTO/Linux+IPv6-HOWTO/ch18s05.html
          #   type filter hook input priority 0;
		      #   ct state established,related counter packets 307 bytes 31974 accept
		      #   counter packets 6 bytes 528 mark 0x00000100 accept
		      #   tcp dport ssh ct state new tcp flags & (syn | ack) == syn log prefix "inet/input/accept: " meta mark set 0x00000100 counter packets 3 bytes 200 accept
		      #   log prefix "inet/input/reject: " counter packets 0 bytes 0 reject
          #}

          chain forward {
            #type filter hook forward priority filter; policy drop;
            type filter hook forward priority 0;
            policy drop;

            jump miniupnpd

            iifname { "${lanInterface}" } oifname { "${wgInterface}" } accept comment "Allow lan -> wireguard"
            iifname { "${wgInterface}" } oifname { "${lanInterface}" } ct state established, related accept comment "Allow established wireguard back to lan"
            
            iifname { "${lan10Interface}" } oifname { "${wgInterface}" } accept comment "Allow lan10 -> wireguard"
            iifname { "${wgInterface}" } oifname { "${lan10Interface}" } ct state established, related accept comment "Allow established wireguard back to lan10"
            
            
          }

          chain miniupnpd {
            #iif "enp1s0" th dport 22 @nh,128,32 0xa00630a @nh,72,8 0x6 accept
          }

          chain prerouting {
            type nat hook prerouting priority -100;
            policy accept;

            #type nat hook prerouting priority dstnat; policy accept;
            jump prerouting_miniupnpd

          }

          chain postrouting {
            #type nat hook postrouting priority srcnat; policy accept;
            type nat hook postrouting priority 100;
            policy accept;

            jump postrouting_miniupnpd

            # 10.100.0.1 - ora1 public internet vps
            
            # snat ne radi iako promijeni source paket
            # kada se forwarduje unutar lan ili lan10 mora biti paket iz te mreze
            ip saddr { 10.100.0.1, 192.168.168.0/24 } oifname "${lanInterface}" snat to 192.168.168.106
            ip saddr { 10.100.0.1, 10.0.99.0/24 } oifname "${lan10Interface}" snat to 10.0.99.254

            # mora da se napravi masquerading ili snat kada sa ovih interfejsa dajemo odgovor wireguard-u
            #oifname { "${lanInterface}", "${lan10Interface}" } masquerade
     
          }

          chain prerouting_miniupnpd {
            #iif "enp1s0" @nh,72,8 0x6 th dport 2222 dnat ip to 10.0.99.10:22
          }

          chain postrouting_miniupnpd {
          }
        }

        table ip nat {

          chain postrouting {
            type nat hook postrouting priority 100;
            oifname "${wanInterface}" masquerade

            # masquerade wireguard - pravi probleme u samoj wireguard konekciji
            # ne raditi oifname "${wgInterface}" masquerade

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


# [nix-shell:~]# nft add rule inet filter  postrouting oifname "wgcgnat" masquerade

#  [nix-shell:~]# nft add rule ip filter input iifname "wgcgnat" icmp type { echo-request, destination-unreachable, time-exceeded, 156 } accept 

# [nix-shell:~]# nft add rule inet filter forward iifname "wgcgnat" icmp type { echo-request, destination-unreachable, time-exceeded, 156 } accept 

# debug IGD
# [node12]# upnpc -a 192.168.168.150 22 8123 TCP
# upnpc : miniupnpc library test client, version .
#  (c) 2005-2022 Thomas Bernard.
# Go to http://miniupnp.free.fr/ or https://miniupnp.tuxfamily.org/
# for more information.
# List of UPNP devices found on the network :
#  desc: http://10.0.99.254:39065/rootDesc.xml
#  st: urn:schemas-upnp-org:device:InternetGatewayDevice:1
# 
# Found valid IGD : http://10.0.99.254:39065/ctl/IPConn
# Local LAN ip address : 10.0.99.10
# ExternalIPAddress = 193.123.37.206
# InternalIP:Port = 192.168.168.150:22
# external 193.123.37.206:8123 TCP is redirected to internal 192.168.168.150:22 (duration=0)

# [router]# tcpdump -i enp2s0 -nn 'host !192.168.168.167 and port 22'

  
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

  # https://github.com/miniupnp/miniupnp/blob/master/miniupnpd/miniupnpd.conf

  # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/tools/networking/miniupnpd/default.nix#L42

  services.miniupnpd-nft = {
    enable = true;
    natpmp = true;
    #externalInterface = "${wanInterface}"; # WAN
    externalInterface = "${wgInterface}"; # WAN
    internalIPs = [ 
      #"${lanInterface}"
      #"${lan10Interface}"
      "10.0.99.254"
    ]; # LAN

    #ext_ip=193.123.37.206
    #ext_ip=10.100.0.1

    appendConfig = ''
      ext_ip=193.123.37.206
    '';

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

