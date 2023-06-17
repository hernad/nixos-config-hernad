# Support for DRBD v9, the Distributed Replicated Block Device.

{ config, 
  lib, 
  pkgs,
  ... 
}:

with lib;

let 
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

    (mkIf cfg.enable {

    environment.systemPackages = [ pkgs.drbd9-utils ];
    services.udev.packages = [ pkgs.drbd9-utils ];

    #boot.kernelModules = [ "drbd" ];

    #boot.extraModprobeConfig =
    #  ''ExecStart = "${drbd9-utils}/bin/drbdadm up all";
    #    options drbd usermode_helper=/run/current-system/sw/bin/drbdadm
    #  '';

    environment.etc."drbd.conf" =
      { source = pkgs.writeText "drbd.conf" cfgService.config; };

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
}
