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
    hostName = "hped800g3-3";
    defaultGateway = "192.168.168.251";

    nameservers = [ 
        "192.168.168.10" 
        "192.168.169.10" 
    ];
    #dhcpd.enable = false;
    useDHCP = true;

    # test phase
    firewall.enable = false;

    interfaces."enp1s0" = {
       macAddress = "24:1c:04:f3:73:77";
       mtu = 9000;
    };

    #[root@hped800g3-3:~]# iperf3 -p 5001 -c 10.0.99.4
    #Connecting to host 10.0.99.4, port 5001
    #[  5] local 10.0.99.3 port 50874 connected to 10.0.99.4 port 5001
    #[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
    #[  5]   0.00-1.00   sec   323 KBytes  2.65 Mbits/sec    3   8.74 KBytes       
    #[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   8.74 KBytes       
    #[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   8.74 KBytes 

    # https://www.reddit.com/r/networking/comments/d15bj6/10g_home_lab_experiment_iperf3_how_many_retries/


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

      # network-addresses-eno1.service

      ipv4 = {
        addresses = [{
          address = "192.168.168.108";
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
          address = "10.0.99.3";
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
    #pciIDs = "1cc1:5766,8086:10fb";
    pciIDs = "1cc1:5766";

    libvirtUsers = [ "hernad" ];
  };

  testConfig.enable = true;

  libvirtGuests = {
    enable = true;
    guests = {
      guest31 = {
        osInfo = "http://nixos.org/nixos/22.11";
        currentMemory = "4194304"; #4GB
        memory = "8388608";
        mac = "52:54:00:13:1f:02";
        hostNic = "br0";
        diskSize = "40";
        vcpu = "4";
        CDROM = true;
        #pciDomain = "0x0100";

        # 01:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+
        pci1enable = false;
        pciBus1 = "0x01";
        pciSlot1 = "0x0";

        #	02:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co.
        pci2enable = true;
        pciBus2 = "0x02";
        pciSlot2 = "0x0";

        #	03:00.0 Non-Volatile memory controller [0108]: ADATA Technology Co
        pci3enable = true;
        pciBus3 = "0x03";
        pciSlot3 = "0x0";

        bridge2enable = true;
        hostBridge2 = "br10";
        mac2 = "52:54:00:13:1f:04";
        mtu2 = "9000";
        ip2 = {
          address = "10.0.99.13";
          prefix = "24";
          gateway = "10.0.99.3";
        };
      };

      guest32 = {
        osInfo = "http://nixos.org/nixos/22.11";
        currentMemory= "2097152"; #2GB
        memory = "8388608";  #8GB
        mac = "52:53:00:13:7e:01";
        hostNic = "br0";
        diskSize = "30";
        vcpu = "2";
        CDROM = false;
        pci1enable = false;
        #pciDomain = "0x0000";
        pciBus1 = "0x00";
        pciSlot1 = "0x0";

        pci2enable = false;
        pciBus2 = "0x00";
        pciSlot2 = "0x0";

        pci3enable = false;
        pciBus3 = "0x00";
        pciSlot3 = "0x0";

        bridge2enable = true;
        hostBridge2 = "br10";
        mac2 = "52:53:00:13:7e:03";
        mtu2 = "9000";
        ip2 = {
          address = "10.0.99.23";
          prefix = "24";
          gateway = "10.0.99.3";
        };
        
      };
    };
  };


  #boot = {
  #  kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  #  binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  #};

  #programs = {
  #  adb.enable = true;
  #  dconf.enable = true;
  #  kdeconnect.enable = true;
  #};

  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #};

  #hardware = {
  #  opengl = {
  #    enable = true;
  #    extraPackages = with pkgs; [ amdvlk ];
  #    driSupport = true;
  #    driSupport32Bit = true;
  #  };
  #  openrgb.enable = true;
  #  opentabletdriver.enable = true;
  #};

  system.stateVersion = "23.05";
}
