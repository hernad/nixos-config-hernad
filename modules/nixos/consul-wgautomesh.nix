let
  wgautomesh = builtins.fetchTarball {
    url = "https://git.deuxfleurs.fr/attachments/ce203833-1ae7-43d4-9bf4-b49b560c9f4b";
    sha256 = "sha256:1kc990s7xkwff53vs6c3slg7ljsyr9xz1i13j61ivfj6djyh8rmj";
  };
in

{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.services.wgautomesh;
in
  with builtins;
  {
    options.services.wgautomesh = {
      enable = mkEnableOption "wgautomesh";
      logLevel = mkOption {
        type = types.enum [ "trace" "debug" "info" "warn" "error" ];
        default = "info";
        description = "wgautomesh log level (trace/debug/info/warn/error)";
      };
      interface = mkOption {
        type = types.str;
        description = "Wireguard interface to manage";
      };
      gossipPort = mkOption {
        type = types.port;
        description = "wgautomesh gossip port";
      };
      gossipSecretFile = mkOption {
        type = types.nullOr types.str;
        description = "File containing the gossip secret encryption key";
      };
      persistFile = mkOption {
        type = types.nullOr types.str;
        description = "Path where to persist known peer addresses";
      };
      lanDiscovery = mkOption {
        type = types.bool;
        default = true;
        description = "Enable discovery using LAN broadcast";
      };
      openFirewall = mkOption {
        type = types.bool;
        default = true;
        description = "Automatically open gossip port in firewall";
      };
      upnpForwardPublicPort = mkOption {
        type = types.nullOr types.port;
        default = null;
        description = "Public port number to try to redirect to this machine using UPnP IGD";
      };
      peers = mkOption {
        type = types.listOf (types.submodule {
          options = {
            pubkey = mkOption {
              type = types.str;
              description = "Wireguard public key";
            };
            address = mkOption {
              type = types.str;
              description = "Wireguard peer address";
            };
            endpoint = mkOption {
              type = types.nullOr types.str;
              description = "bootstrap endpoint";
            };
          };
        });
        description = "wgautomesh peer list";
      };
    };

    config = mkIf cfg.enable ( 
    let
      peerDefs = map (peer:
        let endpointDef = if peer.endpoint == null then ""
        else ''endpoint = "${peer.endpoint}"'';
        in
        ''
          [[peers]]
          pubkey = "${peer.pubkey}"
          address = "${peer.address}"
          ${endpointDef}
        '') cfg.peers;
      extraDefs = (if cfg.lanDiscovery then ["lan_discovery = true"] else [])
        ++ (if (cfg.gossipSecretFile != null)
          then [''gossip_secret_file = "${cfg.gossipSecretFile}"''] else [])
        ++ (if (cfg.persistFile != null)
          then [''persist_file = "${cfg.persistFile}"''] else [])
        ++ (if (cfg.upnpForwardPublicPort != null)
          then [''upnp_forward_external_port = ${toString cfg.upnpForwardPublicPort}''] else []);
      configfile = pkgs.writeText "wgautomesh.toml" ''
        interface = "${cfg.interface}"
        gossip_port = ${toString cfg.gossipPort}
        ${concatStringsSep "\n" extraDefs}

        ${concatStringsSep "\n" peerDefs}
        '';
    in {
      systemd.services.wgautomesh = {
        enable = true;
        path = [ pkgs.wireguard-tools ];
        environment = {
          RUST_LOG = "wgautomesh=${cfg.logLevel}";
        };
        description = "wgautomesh";
        serviceConfig = {
          Type = "simple";

          ExecStart = "${wgautomesh}/bin/wgautomesh ${configfile}";
          Restart = "always";
          RestartSec = "30";

          ExecStartPre = [ "+${pkgs.coreutils}/bin/chown wgautomesh /var/lib/wgautomesh/gossip_secret" ];

          DynamicUser = true;
          User = "wgautomesh";
          StateDirectory = "wgautomesh";
          StateDirectoryMode = "0700";
          AmbientCapabilities = "CAP_NET_ADMIN";
          CapabilityBoundingSet = "CAP_NET_ADMIN";
        };
        wantedBy = [ "multi-user.target" ];
      };
      networking.firewall.allowedUDPPorts = mkIf cfg.openFirewall [ cfg.gossipPort ];
    });
  }
  
