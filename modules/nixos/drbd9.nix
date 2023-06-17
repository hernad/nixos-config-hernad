# Support for DRBD v9, the Distributed Replicated Block Device.

{ config, 
  lib, 
  pkgs,
  ... 
}:

with lib;

let 
  cfg = config.services.drbd9; 
  kernel_version = pkgs.linuxPackages.kernel.modDirVersion;

  #drbd9-utils = pkgs.callPackage ../../pkgs/drbd9-utils {};
  #drbd9 = pkgs.callPackage ../../pkgs/drbd9 {};
in
{

  ###### interface

  options = {

    services.drbd9.enable = mkOption {
      default = false;
      type = types.bool;
      description = lib.mdDoc ''
        Whether to enable support for DRBD, the Distributed Replicated
        Block Device.
      '';
    };

    services.drbd9.config = mkOption {
      default = "";
      type = types.lines;
      description = lib.mdDoc ''
        Contents of the {file}`drbd.conf` configuration file.
      '';
    };

  };


  ###### implementation

  config = mkIf cfg.enable {

    environment.systemPackages = [ pkgs.drbd9-utils ];
    services.udev.packages = [ pkgs.drbd9-utils ];


    #boot.kernelModules = [ "drbd" ];

    #boot.extraModprobeConfig =
    #  ''ExecStart = "${drbd9-utils}/bin/drbdadm up all";
    #    options drbd usermode_helper=/run/current-system/sw/bin/drbdadm
    #  '';

    environment.etc."drbd.conf" =
      { source = pkgs.writeText "drbd.conf" cfg.config; };

    systemd.services.drbd9 = {
      after = [ "systemd-udev.settle.service" "network.target" ];
      wants = [ "systemd-udev.settle.service" ];
      wantedBy = [ "multi-user.target" ];
      path = [
            pkgs.kmod
            pkgs.drbd9-utils
      ];
      serviceConfig = {
        ExecStartPre = [
             "${pkgs.kmod}/bin/modprobe lru_cache"
             "${pkgs.kmod}/bin/modprobe libcrc32c"
             "-${pkgs.kmod}/bin/insmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd.ko"
             "-${pkgs.kmod}/bin/insmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd_transport_tcp.ko"
        ];
        ExecStart = "-${pkgs.drbd9-utils}/bin/drbdadm up all";
        ExecStop = "-${pkgs.drbd9-utils}/bin/drbdadm down all";
        ExecStopPost =  [
            "-${pkgs.kmod}/bin/rmmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd_transport_tcp.ko"
            "-${pkgs.kmod}/bin/rmmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd.ko"
        ];
      };
    };
  };
}
