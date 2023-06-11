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
    hostName = "guest31";
    # telemach T1 router
    defaultGateway = "10.0.99.254";

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

  
   
  testConfig.enable = false;

  system.stateVersion = "23.05";
}

