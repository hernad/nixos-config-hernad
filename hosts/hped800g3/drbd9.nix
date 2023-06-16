{
    enable = true;
    config = ''

      global {
                usage-count yes;
                udev-always-use-vnr;
      }

      resource r0 {

        net {
            cram-hmac-alg sha1;
            shared-secret "hped800g334";
            protocol C;
        }
        disk {
            resync-rate 1000M;
        }
        on "hped800g3-3" {
            volume 0 {
                device    minor 1;
                disk      /dev/nvme0n1;
                meta-disk internal;
            }
            address 10.0.99.3:7789;
        }
        on "hped800g3-4" {
            volume 0 {
                device    minor 1;
                disk      /dev/nvme0n1;
                meta-disk internal;    
            }
            address 10.0.99.4:7789;
        }

      }


    '';
}