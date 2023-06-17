{
    config = ''

      global {
                usage-count yes;
                udev-always-use-vnr;
      }

      resource r0 {

        #net {
        #    cram-hmac-alg sha1;
        #    shared-secret "hped800g334";
        #}
        
        # https://serverfault.com/questions/740311/drbd-terrible-sync-performance-on-10gige
        net {
<<<<<<< HEAD
            cram-hmac-alg sha1;
            shared-secret "hped800g334";
=======
          # max-epoch-size          20000;
          max-buffers             36k;
          sndbuf-size            1024k ;
          rcvbuf-size            2048k;
          #allow-two-primaries yes;
          # drbdadm net-options --protocol=C --allow-two-primaries <resource>
          # To end temporary dual-primary mode, run the same command as above but with --allow-two-primaries=no (and your desired replication protocol, if applicable).

          #sha1, md5, and crc32c
          verify-alg sha1;

>>>>>>> cache
        }

        volume 0 {
            device  minor 1;
            disk    /dev/nvme0n1;
            meta-disk internal;
<<<<<<< HEAD
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
=======
        }

        #c-max-rate
        # Set c-max-rate to 100% (or slightly more) than what your hardware can handle.
        # For example: if you know your network is capable of 10Gb/s, 
        # but your disk throughput is only 800MiB/s, then set this value to 800M.

        #disk {
        #    c-max-rate 3000M;
        #}

        # https://serverfault.com/questions/740311/drbd-terrible-sync-performance-on-10gige
        disk {
          on-io-error detach;
          no-disk-flushes ;
          no-disk-barrier;
          c-plan-ahead 0;
          c-fill-target 24M;
          c-min-rate 80M;
          c-max-rate 750M;
        }

        on "hped800g3-3" {
            node-id 0;
        }
        on "hped800g3-4" {
            node-id 1;
        }

        connection {
            host "hped800g3-3" address 10.0.99.3:7789;
            host "hped800g3-4" address 10.0.99.4:7789;
            net {
               protocol C;
            }
        }

        #connection {
        #    host "hped800g3-3" address 192.168.168.108:7789;
        #    host "hped800g3-4" address 192.168.168.109:7789;
        #    net {
        #       protocol C;
        #    }
        #}
>>>>>>> cache

      }


    '';
}