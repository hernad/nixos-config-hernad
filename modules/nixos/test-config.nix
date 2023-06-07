{config, pkgs, lib, ... }:

with lib;
let

config = {
        systemd.services.test-txt-config = {
            description = "test txt config";
            script = ''
                cp ${pkgs.test-txt}/test/test.txt /var/lib/libvirtd/images/    
            '';

            serviceConfig = {
                Type = "oneshot";
                #RuntimeDirectoryPreserve = "yes";
                #LogsDirectory = subDirs [ "qemu" ];
                #RuntimeDirectory = subDirs [ "nix-emulators" "nix-helpers" "nix-ovmf" ];
                #StateDirectory = subDirs [ "dnsmasq" ];
            };
        };
}