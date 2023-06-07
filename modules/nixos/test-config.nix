{config, pkgs, lib, ... }:

with lib;
let
   cfg = config.testConfig; 
in
{

   options.testConfig = {
      enable = mkEnableOption "test config";

   };

   config = (mkIf cfg.enable {
            systemd.services.test-txt-config = {
                enable = true;
                description = "test txt config 2";
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