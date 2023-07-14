{
        enable = true;
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
           mac = "52:54:00:01:1f:31";
           mtu = "1500";
           vhostConfig = false;
        };

        net2 = {
          enable = true;
          hostBridge = "brt2";
          mac = "52:54:00:01:1f:33";
          mtu = "1500";
          vhostConfig = false;
        };

        net3 = {
          enable = true;
          hostBridge = "br10";
          mac = "52:4f:00:01:25:44";
          mtu = "9000";
          vhostConfig = false;
        };


};