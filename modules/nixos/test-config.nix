{config, pkgs, lib, ... }:

with lib;
let
   cfg = config.testConfig; 
in
{

   options.testConfig = {
      enable = mkEnableOption "test config";

   };


    #[root@hped800g3-4:~]# systemctl status test-txt-config
    #○ test-txt-config.service - test txt config
    #     Loaded: loaded (/etc/systemd/system/test-txt-config.service; enabled; preset: enabled)
    #     Active: inactive (dead) since Wed 2023-06-07 15:40:44 CEST; 37s ago
    #    Process: 2652 ExecStart=/nix/store/1kzz7qdv0zr23bzibm72ic9angdsf2dq-unit-script-test-txt-config-start/bin/test-txt-config-start (code=e>
    #   Main PID: 2652 (code=exited, status=0/SUCCESS)
    #         IP: 0B in, 0B out
    #        CPU: 4ms
    #
    #Jun 07 15:40:44 hped800g3-4 systemd[1]: Starting test txt config...
    #Jun 07 15:40:44 hped800g3-4 systemd[1]: test-txt-config.service: Deactivated successfully.
    #Jun 07 15:40:44 hped800g3-4 systemd[1]: Finished test txt config.


   config = (mkIf cfg.enable {
            systemd.services.test-txt-config = {
                enable = true;
                description = "test txt config ";
                wantedBy = [ "multi-user.target" ];
                script = ''
                    cp ${pkgs.test-txt}/test/test.txt /var/lib/libvirt/images/    
                '';

                serviceConfig = {
                    Type = "oneshot";
                    #RuntimeDirectoryPreserve = "yes";
                    #LogsDirectory = subDirs [ "qemu" ];
                    #RuntimeDirectory = subDirs [ "nix-emulators" "nix-helpers" "nix-ovmf" ];
                    #StateDirectory = subDirs [ "dnsmasq" ];
                };
            };
    });
}