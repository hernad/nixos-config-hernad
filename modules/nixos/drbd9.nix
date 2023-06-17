# Support for DRBD v9, the Distributed Replicated Block Device.

{ config, 
  lib, 
  pkgs,
  ... 
}:

with lib;

let 
<<<<<<< HEAD
  cfg = config.services.drbd9; 
  kernel_version = pkgs.linuxPackages.kernel.modDirVersion;

  #drbd9-utils = pkgs.callPackage ../../pkgs/drbd9-utils {};
  #drbd9 = pkgs.callPackage ../../pkgs/drbd9 {};
=======
  cfg = config.drbd9;
  cfgService = config.services.drbd9;
  kernel_version = pkgs.linuxPackages.kernel.modDirVersion;

  kpkgs = config.boot.kernelPackages;
  #modulePackages = map (m: kpkgs.${m}) modules;
  modulePackages = [ pkgs.drbd9 ];

  modules = [ "drbd" "drbd_transport_tcp" "drbd_tranport_rma" ];
  kernelModuleConfig = mkIf cfg.enable {
       boot.extraModulePackages = modulePackages;
       boot.kernelModules = modules;
       boot.extraModprobeConfig =
       ''
        options drbd usermode_helper=${pkgs.drbd9-utils}/bin/drbdadm
       '';
       services.udev.packages = modulePackages;
  };

>>>>>>> cache
in
{

  options = {

    drbd9.enable = mkOption {
        default = false;
        defaultText = literalExpression "enable drbd9";
        example = true;
        description = lib.mdDoc "Whether to make the drbd9 out-of-tree kernel modules available";
        type = types.bool;
    };

    services.drbd9 = {
      config = mkOption {
         default = "";
         type = types.lines;
         description = lib.mdDoc ''
           Contents of the {file}`drbd.conf` configuration file.
         '';
      };
    };

  };


  ###### implementation

  config = mkMerge [
    
    kernelModuleConfig

<<<<<<< HEAD
    environment.systemPackages = [ pkgs.drbd9-utils ];
    services.udev.packages = [ pkgs.drbd9-utils ];
=======
    (mkIf cfg.enable {
>>>>>>> cache

    environment.systemPackages = [ pkgs.drbd9-utils ];
    services.udev.packages = [ pkgs.drbd9-utils ];

    #boot.kernelModules = [ "drbd" ];

    #boot.extraModprobeConfig =
    #  ''ExecStart = "${drbd9-utils}/bin/drbdadm up all";
    #    options drbd usermode_helper=/run/current-system/sw/bin/drbdadm
    #  '';

    environment.etc."drbd.conf" =
      { source = pkgs.writeText "drbd.conf" cfgService.config; };

<<<<<<< HEAD
    #systemd.services.drbd9 = {
    #  after = [ "systemd-udev.settle.service" "network.target" ];
    #  wants = [ "systemd-udev.settle.service" ];
    #  wantedBy = [ "multi-user.target" ];
    #  path = [
    #        pkgs.kmod
    #        pkgs.drbd9-utils
    #  ];
    #  serviceConfig = {
    #    ExecStartPre = [
    #         "${pkgs.kmod}/bin/modprobe lru_cache"
    #         "${pkgs.kmod}/bin/modprobe libcrc32c"
    #         "-${pkgs.kmod}/bin/insmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd.ko"
    #         "-${pkgs.kmod}/bin/insmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd_transport_tcp.ko"
    #    ];
    #    ExecStart = "-${pkgs.drbd9-utils}/bin/drbdadm up all";
    #    ExecStop = "-${pkgs.drbd9-utils}/bin/drbdadm down all";
    #    ExecStopPost =  [
    #        "-${pkgs.kmod}/bin/rmmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd_transport_tcp.ko"
    #        "-${pkgs.kmod}/bin/rmmod ${pkgs.drbd9.out}/lib/modules/${kernel_version}/updates/drbd.ko"
    #    ];
    #  };
    #};
  };
=======
    systemd.services.drbd9 = {
      after = [ "systemd-udev.settle.service" "network.target" ];
      wants = [ "systemd-udev.settle.service" ];
      wantedBy = [ "multi-user.target" ];
      path = [
            pkgs.kmod
            pkgs.drbd9-utils
      ];
      serviceConfig = {
        Type = "forking";
        ExecStart = "${pkgs.drbd9-utils}/bin/drbdadm up all";
        ExecStop = "${pkgs.drbd9-utils}/bin/drbdadm down all";
        RemainAfterExit = true;
      };
    };
  }) ];
>>>>>>> cache
}
