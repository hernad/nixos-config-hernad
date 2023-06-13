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
    # telemach T1 router
    defaultGateway = "192.168.168.251";

    # test phase
    #firewall.enable = false;

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10"
    ];
    #dhcpd.enable = false;
    useDHCP = true;

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


    hostName = "node1";
    staticIPv4.address = "192.168.168.134";
    #staticIPv6.address = "2a02:a03f:6510:5102:6e4b:90ff:fe3b:e86c";
    isRaftServer = true;

    clusterName = "staging";
    siteName = "sa1";

    # The IP range to use for the Wireguard overlay of this cluster
    clusterPrefix = "10.183.0.0/16";

    clusterNodes."node1" = {
      siteName = "sa1";
      publicKey = "YEW6NWaa9eHmXAxVwLedAOH0zPICR21JlHmC2VVi6n0=";
      address = "10.183.1.1";
      endpoint = "192.168.168.134:33799"; 
    };

    clusterNodes."node2" = {
      siteName = "sa1";
      publicKey = "nHfxdSExo2cVUVbwZWM+wnLUrfMxrZiFJTtskTPPcG8=";
      address = "10.183.1.2";
      endpoint = "192.168.168.89:33799"; 
    };

    # New Wireguard key was generated.
    # This node's Wireguard public key is: 9kuzKR41MvQgXYL15xMzaUn8k2hutZtZjYbjwSdaXnk=

    clusterNodes."node3" = {
      siteName = "sa1";
      publicKey = "9kuzKR41MvQgXYL15xMzaUn8k2hutZtZjYbjwSdaXnk=";
      address = "10.183.1.3";
      endpoint = "192.168.168.91:33799"; 
    };

  };

  services.consul.extraConfig.start_join = [ 
    "10.183.1.2"
    "10.183.1.3"
  ];

  system.stateVersion = "23.05";
}

