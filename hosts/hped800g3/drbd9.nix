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
        }

        volume 0 {
            device  minor 1;
            disk    /dev/nvme0n1;
            meta-disk internal;
        }

        #disk {
        #    resync-rate 1000M;
        #}
        on "hped800g3-3" {
            node-id 0;
            address 10.0.99.3:7789;
        }
        on "hped800g3-4" {
            node-id 1;
            address 10.0.99.4:7789;
        }

        connection {
	      host "hped800g3-3"  port 7789;
	      host "hped800g3-4"  port 7789;
	      net {
			protocol C;
          }  
	    }

      }


    '';
}