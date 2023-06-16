# Support for DRBD, the Distributed Replicated Block Device.

{ config, lib, pkgs, ... }:

with lib;

let cfg = config.services.drbd9; in

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

    environment.systemPackages = [ pkgs.drbd9 ];

    services.udev.packages = [ pkgs.drbd9 ];

    boot.kernelModules = [ "drbd" ];

    boot.extraModprobeConfig =
      ''
        options drbd usermode_helper=/run/current-system/sw/bin/drbdadm
      '';

    environment.etc."drbd.conf" =
      { source = pkgs.writeText "drbd.conf" cfg.config; };

    systemd.services.drbd9 = {
      after = [ "systemd-udev.settle.service" "network.target" ];
      wants = [ "systemd-udev.settle.service" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.drbd}/bin/drbdadm up all";
        ExecStop = "${pkgs.drbd}/bin/drbdadm down all";
      };
    };
  };
}
