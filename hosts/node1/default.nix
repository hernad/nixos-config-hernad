{ pkgs, inputs, ... }: 

let
    #lan10DnsServers = "192.168.168.10, 192.168.169.10";
    #lanInterface = "enp2s0";
    #wanInterface = "enp1s0";
    #lan10Interface = "enp4s0";
in {
  imports = [
    ./hardware-configuration.nix
    ../kvm
    ../common/global/kvm.nix
    ../common/users/hernad
  ];


  boot.kernel.sysctl = {
    "vm.max_map_count" = 262144;
  };

  services.journald.extraConfig = ''
  SystemMaxUse=1G
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #environment.systemPackages = with pkgs; [
  #  pciutils 
  #  tcpdump
  #];

  # router
  #boot.kernel.sysctl = {
  #  "net.ipv4.conf.all.forwarding" = true;
  #};

  networking = {
    hostName = "node1";
    # telemach T1 router - router
    defaultGateway = "10.0.99.254";

    # test phase
    #firewall.enable = false;
    firewall.allowedTCPPorts = [ 5201 ];
    # https://unix.stackexchange.com/questions/19060/fedora-firewall-with-upnp
    # https://gist.github.com/mvadu/44c55b05d4614cf07d9833e0b44bf27a

    firewall.allowedUDPPortRanges = [
      { from = 1024; to = 65535; } 
    ];

    #[root@node1:~]# ip route add default via 192.168.168.106
    #[root@node1:~]# nix-shell -p miniupnpc 
    #
    #[nix-shell:~]# upnpc -l
    #upnpc : miniupnpc library test client, version .
    # (c) 2005-2022 Thomas Bernard.
    #Go to http://miniupnp.free.fr/ or https://miniupnp.tuxfamily.org/
    #for more information.
    #List of UPNP devices found on the network :
    # desc: http://192.168.168.106:34093/rootDesc.xml
    # st: urn:schemas-upnp-org:device:InternetGatewayDevice:1
    #
    #Found valid IGD : http://192.168.168.106:34093/ctl/IPConn
    #Local LAN ip address : 192.168.168.134
    #Connection Type : IP_Routed
    #Status : Connected, uptime=776s, LastConnectionError : ERROR_NONE
    #  Time started : Thu Jul 13 15:05:12 2023
    #MaxBitRateDown : 4200000 bps (4.2 Mbps)   MaxBitRateUp 4200000 bps (4.2 Mbps)
    #ExternalIPAddress = 77.78.203.115
    # i protocol exPort->inAddr:inPort description remoteHost leaseTime
    #GetGenericPortMappingEntry() returned 713 (SpecifiedArrayIndexInvalid)

    # ovo ne pije vode - unbound preuzima u consul clusteru
    #nameservers = [ 
    #    "192.168.168.10" 
    #    "192.168.169.10"
    #];

    #dhcpd.enable = false;
    useDHCP = false;

    # https://dev.jmgilman.com/networking/concepts/switching/spanning_tree/

    interfaces = {
      # lan10 10.0.99.0/24
      "enp1s0" = {
         mtu = 9000;
      };
      # lan 168 mreza
      "enp2s0" = {
         mtu = 1500;
      };
    };


    interfaces.enp1s0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4 = {
        
        addresses = [{
          address = "10.0.99.10";
          prefixLength = 24;
        }];
      };
    };

    interfaces.enp2s0 = {
      useDHCP = false;
      wakeOnLan.enable = false;
      ipv4 = {
        addresses = [{
          address = "192.168.168.134";
          prefixLength = 24;
        }];
      };
    };

    
  };

  #testConfig.enable = false;

  consulCluster = {
    enable = true;
    adminAccounts = {
      hernad = [
        # Keys for accessing nodes from outside
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0xP+KKZzsiYdP84jJWPUbppag5ldMl3evYtyh01CZ+Us3xIPPCtApmAGvFsjfgg3mJIPen+B1kHmmc4QaZNbbgF5J2f10eH7WH8b2JazyJsZo2S4eObtH4J2gqstFgFxWeZOG/nGDi9Q1JqVrF0ubtK0Mu5f4dSBQ4YYh3fsuj351CA7snF+KcIJ9uLCAJUYezX9LIyhNd7fDpKPuMsHiUCwsTSji0l5kT4xlZ4OoOE+B1fmZ0vFP3gfah+YXQXv4eUbjt79kMdgCIvG6gh6x7Xm5RbE/LdAAYNnevWHv7gDjQKuyakKQp/lEdr6K5fSJNNJ5PB6uvE8/NT95rEP/hr7vE2N5qlMRyozQfZbYp6o1pD6vKSohTK8cLkfNcfwDXRyWvl2vOvgLYv5u2E+OR/MoCUybcfEmwnthRPAA+jXYrMyLTL5ZzeP8UBST6zTkjB2aU/G2AUQW2nKre5isAxjWUo1T0gzBQKTlP5N5vaGWxPVL/xZsJDfARgbIeik= hernad@dev"
      ];
      bjasko = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0xP+KKZzsiYdP84jJWPUbppag5ldMl3evYtyh01CZ+Us3xIPPCtApmAGvFsjfgg3mJIPen+B1kHmmc4QaZNbbgF5J2f10eH7WH8b2JazyJsZo2S4eObtH4J2gqstFgFxWeZOG/nGDi9Q1JqVrF0ubtK0Mu5f4dSBQ4YYh3fsuj351CA7snF+KcIJ9uLCAJUYezX9LIyhNd7fDpKPuMsHiUCwsTSji0l5kT4xlZ4OoOE+B1fmZ0vFP3gfah+YXQXv4eUbjt79kMdgCIvG6gh6x7Xm5RbE/LdAAYNnevWHv7gDjQKuyakKQp/lEdr6K5fSJNNJ5PB6uvE8/NT95rEP/hr7vE2N5qlMRyozQfZbYp6o1pD6vKSohTK8cLkfNcfwDXRyWvl2vOvgLYv5u2E+OR/MoCUybcfEmwnthRPAA+jXYrMyLTL5ZzeP8UBST6zTkjB2aU/G2AUQW2nKre5isAxjWUo1T0gzBQKTlP5N5vaGWxPVL/xZsJDfARgbIeik= hernad@dev"
      ];
    };
    bootstrap = true;
    cnameTarget = "jedan.bring-out.me.";

    hostName = "node1";
    staticIPv4.address = "10.0.99.10";
    #staticIPv6.address = "2a02:a03f:6510:5102:6e4b:90ff:fe3b:e86c";
    isRaftServer = true;

    clusterName = "staging";
    siteName = "sa1";

    # The IP range to use for the Wireguard overlay of this cluster
    clusterPrefix = "10.183.0.0/16";

    clusterNodes = import ../cluster.nix;
    
  };

  services.consul.extraConfig.start_join = [ 
    "10.183.1.2"
    "10.183.1.3"
  ];

  system.stateVersion = "23.05";
}

