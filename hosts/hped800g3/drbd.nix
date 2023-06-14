{
    enable = true;
    config = ''
      
      resource r0 {
          
          volume 0 {
	          device    "/dev/drbd";
	          disk      "/dev/nvme0n1";
	          meta-disk internal;
          }

          net {
	          cram-hmac-alg sha1;
	          shared-secret "drbdhped34";
          }
       
          options {
            auto-promote no;
          }

          on "hped800g3-3" {
            address   10.0.99.3:7777;
            node-id   0;
          }

          on "hped800g3-4" {
            address   10.0.99.4:7777;
            node-id   1;
          }

          connection {
	          host      "hped800g3-3"  port 7000;
	          host      "hped800g3-4"    port 7000;
	          net {
			        protocol C;
	          }
          }

        }
    '';
}