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
                description = "test txt config";
                script = ''
                    cp ${pkgs.test-txt}/test /var/lib/libvirt/images/    
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