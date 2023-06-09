{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.miniupnpd-nft;
  configFile = pkgs.writeText "miniupnpd.conf" ''
    ext_ifname=${cfg.externalInterface}
    enable_natpmp=${if cfg.natpmp then "yes" else "no"}
    enable_upnp=${if cfg.upnp then "yes" else "no"}

    ${concatMapStrings (range: ''
      listening_ip=${range}
    '') cfg.internalIPs}

    ${cfg.appendConfig}
  '';
in
{
  options = {
    services.miniupnpd-nft = {
      enable = mkEnableOption (lib.mdDoc "MiniUPnP nft daemon");

      externalInterface = mkOption {
        type = types.str;
        description = lib.mdDoc ''
          Name of the external interface.
        '';
      };

      internalIPs = mkOption {
        type = types.listOf types.str;
        example = [ "192.168.1.1/24" ];
        description = lib.mdDoc ''
          The IP address ranges to listen on.
        '';
      };

      natpmp = mkEnableOption (lib.mdDoc "NAT-PMP support");

      upnp = mkOption {
        default = true;
        type = types.bool;
        description = lib.mdDoc ''
          Whether to enable UPNP support.
        '';
      };

      appendConfig = mkOption {
        type = types.lines;
        default = "";
        description = lib.mdDoc ''
          Configuration lines appended to the MiniUPnP config.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    networking.firewall.extraCommands = ''
      ${pkgs.bash}/bin/bash -x ${pkgs.miniupnpd-nft}/etc/miniupnpd/iptables_init.sh -i ${cfg.externalInterface}
    '';

    networking.firewall.extraStopCommands = ''
      ${pkgs.bash}/bin/bash -x ${pkgs.miniupnpd-nft}/etc/miniupnpd/iptables_removeall.sh -i ${cfg.externalInterface}
    '';

    systemd.services.miniupnpd = {
      description = "MiniUPnP daemon nft";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.miniupnpd-nft}/bin/miniupnpd -f ${configFile}";
        PIDFile = "/run/miniupnpd.pid";
        Type = "forking";
      };
    };
  };
}