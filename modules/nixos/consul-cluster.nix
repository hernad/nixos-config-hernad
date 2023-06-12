{ config, pkgs, ... }:

let
  cfg = config.consul-cluster;
in
  with builtins;
  with pkgs.lib;
{
  options.consul-cluster = with types; {
    # Parameters for individual nodes
    hostName = mkOption {
      description = "Node name";
      type = str;
    };
    staticIPv4.address = mkOption {
      description = "IP address (with prefix length) of this node on the local network interface";
      type = nullOr str;
      default = null;
    };
    staticIPv6.address = mkOption {
      description = "Static public IPv6 address of this node";
      type = nullOr str;
    };
    isRaftServer = mkOption {
      description = "Make this node a RAFT server for the Nomad and Consul deployments";
      type = bool;
      default = false;
    };

    # Parameters that generally vary between sites
    siteName = mkOption {
      description = "Site (availability zone) on which this node is deployed";
      type = str;
    };
    staticIPv4.defaultGateway = mkOption {
      description = "IPv4 address of the default route on the local network interface";
      type = nullOr str;
      default = null;
    };
    staticIPv4.prefixLength = mkOption {
      description = "IPv4 prefix length for LAN addresses, only used with static configuration";
      type = int;
      default = 24;
    };
    staticIPv6.defaultGateway = mkOption {
      description = ''
        IPv6 address of the default route on the local network interface.
        IPv6 Router Advertisements (RA) will be totally disabled if this is set.
      '';
      type = nullOr str;
      default = null;
    };
    staticIPv6.prefixLength = mkOption {
      description = "IPv6 prefix length, used only when router advertisements are disabled.";
      type = int;
      default = 64;
    };

    publicIPv4 = mkOption {
      description = "Public IPv4 through which this node is accessible (possibly after port opening using DiploNAT), for domain names that are updated by D53";
      type = nullOr str;
      default = null;
    };
    cnameTarget = mkOption {
      description = "DNS CNAME target to use for services hosted in this site, for domain names that are updated by D53";
      type = nullOr str;
      default = null;
    };

    # Parameters common to all nodes
    clusterName = mkOption {
      description = "Name of this consul-cluster deployment";
      type = str;
    };
    clusterPrefix = mkOption {
      description = "IP address prefix (and length) for the Wireguard overlay network";
      type = str;
    };
    clusterNodes = mkOption {
      description = "Nodes that are part of the cluster";
      type = attrsOf (submodule {
        options = {
          siteName = mkOption {
            type = nullOr str;
            description = "Site where the node is located";
            default = null;
          };
          address = mkOption {
            type = str;
            description = "IP Address in the Wireguard network";
          };
          publicKey = mkOption {
            type = str;
            description = "Public key";
          };
          endpoint = mkOption {
            type = nullOr str;
            default = null;
            description = "Wireguard endpoint on the public Internet";
          };
        };
      });
    };
    adminAccounts = mkOption {
      description = "List of users having an admin account on cluster nodes, maps user names to a list of authorized SSH keys";
      type = attrsOf (listOf str);
    };
    bootstrap = mkOption {
      description = "Whether to enable bootstrapping for Nomad and Consul";
      type = bool;
      default = false;
    };

    # Options that generally stay to their default value
    wireguardPort = mkOption {
      description = "Port for incoming Wireguard VPN connections";
      type = port;
      default = 33799;
    };
    wgautomeshPort = mkOption {
      description = "Gossip port for wgautomesh";
      type = port;
      default = 1666;
    };
  };

  imports = [
      ./consul-wgautomesh.nix
    ];

  config =
    let
      clusterNodeCfg = getAttr cfg.hostName cfg.clusterNodes;
      clusterAddress = clusterNodeCfg.address;
      node_meta = {
        "site" = cfg.siteName;
      } //
      (if cfg.staticIPv6.address != null
        then { "public_ipv6" = cfg.staticIPv6.address; }
        else {}) //
      (if cfg.publicIPv4 != null
        then { "public_ipv4" = cfg.publicIPv4; }
        else {}) //
      (if cfg.cnameTarget != null
        then { "cname_target" = cfg.cnameTarget; }
        else {});
    in
  {
    networking.hostName = cfg.hostName;

    # Configure admin accounts on all nodes
    users.users = mapAttrs (name: publicKeys: {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = publicKeys;
    }) cfg.adminAccounts;

    # Configure network interfaces
    networking.useDHCP = false;
    networking.useNetworkd = true;
    systemd.network.networks."10-uplink" =
      let
        # IPv4 configuration is obtained by DHCP by default,
        # unless a static v4 address and default gateway are given
        noDHCP = cfg.staticIPv4.address != null && cfg.staticIPv4.defaultGateway != null;
        # IPv6 configuration is obtained through router advertisements (RA),
        # possibly using a static token to ensure a static IPv6,
        # unless a static v6 address and default gateway are given,
        # in which case RAs are disabled entirely
        noRA = cfg.staticIPv6.address != null && cfg.staticIPv6.defaultGateway != null;
        staticV6 = cfg.staticIPv6.address != null;
      in
      {
        matchConfig.Name = "en* eth*";

        address =
          optional noDHCP "${cfg.staticIPv4.address}/${toString cfg.staticIPv4.prefixLength}"
          ++ optional noRA "${cfg.staticIPv6.address}/${toString cfg.staticIPv6.prefixLength}";

        routes =
          optional noDHCP {
            routeConfig = {
              Gateway = cfg.staticIPv4.defaultGateway;
              # GatewayOnLink - Takes a boolean. If set to true, the kernel does not have to check if the gateway is reachable directly by the current machine (i.e., attached to the local network), so that we can insert the route in the kernel table without it being complained about. Defaults to "no".
              GatewayOnLink = true;
            };
          } ++ optional noRA {
            routeConfig = {
              Gateway = cfg.staticIPv6.defaultGateway;
              GatewayOnLink = true;
            };
          };

        # Dynamic IPv4: enable DHCP but not for DNS servers
        networkConfig.DHCP = mkIf (!noDHCP) "ipv4";
        dhcpV4Config.UseDNS = mkIf (!noDHCP) false;

        # Dynamic IPv6: only fetch default route, use static
        # address and no DNS servers
        ipv6AcceptRAConfig.Token = mkIf (!noRA && staticV6) "static:${cfg.staticIPv6.address}";
        ipv6AcceptRAConfig.UseDNS = mkIf (!noRA) false;

        # Static IPv6: disable all router advertisements and
        # link-local addresses
        networkConfig.IPv6AcceptRA = mkIf noRA false;
        networkConfig.LinkLocalAddressing = mkIf noRA "no";
      };

    # Configure Unbound as a central DNS server for everything
    # - is its own recursor (applies DNSSec) for everything,
    #   no need to declare an outside nameserver
    # - redirects to Consul queries under .consul
    services.unbound = {
      enable = true;
      settings = {
        server = {
          interface = [ "127.0.0.1" "172.17.0.1" ];
          domain-insecure = [ "consul." ];
          local-zone = [ "consul. nodefault" ];
          log-servfail = true;
    	  verbosity = 1;
          log-queries = true;
          use-syslog = false;
          logfile = "/dev/stdout";
          access-control = [
            "127.0.0.0/8 allow"
            "172.17.0.0/16 allow"
            "192.168.0.0/16 allow"
            "${cfg.clusterPrefix} allow"
          ];
        };
        stub-zone = [
          # Forward .consul queries to Consul daemon
          {
            name = "consul.";
            stub-addr = "${clusterAddress}@8600";
            stub-no-cache = true;
            stub-tcp-upstream = false;
            stub-tls-upstream = false;
          }
        ];
      };
      resolveLocalQueries = true;
    };
    services.resolved.enable = false;

    # Configure Wireguard VPN between all nodes
    networking.wireguard.interfaces.wg0 = {
      ips = [ "${clusterAddress}/16" ];
      listenPort = cfg.wireguardPort;
      privateKeyFile = "/var/lib/consul-cluster/wireguard-keys/private";
      mtu = 1420;
    };
    services.wgautomesh = {
      enable = true;
      interface = "wg0";
      gossipPort = cfg.wgautomeshPort;
      gossipSecretFile = "/var/lib/wgautomesh/gossip_secret";
      persistFile = "/var/lib/wgautomesh/state";
      upnpForwardPublicPort =
        if clusterNodeCfg.endpoint != null then
          strings.toInt (lists.last (split ":" clusterNodeCfg.endpoint))
        else null;
      peers = attrValues (mapAttrs (hostname: { publicKey, endpoint, address, ... }: {
        inherit address endpoint;
        pubkey = publicKey;
      }) cfg.clusterNodes);
    };
    # Old code for wg-quick, we can use this as a fallback if we fail to make wgautomesh work
    # systemd.services."wg-quick-wg0".after = [ "unbound.service" ];
    # networking.wg-quick.interfaces.wg0 = {
    #   address = [ "${clusterAddress}/16" ];
    #   listenPort = cfg.wireguardPort;
    #   privateKeyFile = "/var/lib/consul-cluster/wireguard-keys/private";
    #   mtu = 1420;
    #   peers = map ({ publicKey, endpoint, address, ... }: {
    #     inherit publicKey endpoint;
    #     allowedIPs = [ "${address}/32" ];
    #     persistentKeepalive = 25;
    # };

    system.activationScripts.generate_df_wg_key = ''
      if [ ! -f /var/lib/consul-cluster/wireguard-keys/private ]; then
        mkdir -p /var/lib/consul-cluster/wireguard-keys
        (umask 077; ${pkgs.wireguard-tools}/bin/wg genkey > /var/lib/consul-cluster/wireguard-keys/private)
        echo "New Wireguard key was generated."
        echo "This node's Wireguard public key is: $(${pkgs.wireguard-tools}/bin/wg pubkey < /var/lib/consul-cluster/wireguard-keys/private)"
      fi
    '';

    # Configure /etc/hosts to link all hostnames to their Wireguard IP
    networking.extraHosts = concatStringsSep "\n" (attrValues (mapAttrs
      (hostname: { address, ...}: "${address} ${hostname}")
      cfg.clusterNodes));

    # Enable Hashicorp Consul & Nomad
    services.consul.enable = true;
    systemd.services.consul.after = [ "wg-quick-wg0.service" ];
    services.consul.extraConfig =
      (if cfg.isRaftServer
      then { server = true; }
        // (if cfg.bootstrap then { bootstrap_expect = 3; } else {})
      else {}) //
    {
      inherit node_meta;
      datacenter = cfg.clusterName;
      ui_config = {
        enabled = true;
      };
      bind_addr = "${clusterAddress}";

      addresses = {
        https = "0.0.0.0";
        dns = "0.0.0.0";
      };
      ports = {
        http = -1;
        https = 8501;
      };
      performance = {
        rpc_hold_timeout = "70s";
      };

      ca_file = "/var/lib/consul/pki/consul-ca.crt";
      cert_file = "/var/lib/consul/pki/consul.crt";
      key_file = "/var/lib/consul/pki/consul.key";
      verify_incoming = true;
      verify_outgoing = true;
      verify_server_hostname = true;
    };

    services.nomad.enable = true;
    systemd.services.nomad.after = [ "wg-quick-wg0.service" ];
    services.nomad.package = pkgs.nomad_1_4;
    services.nomad.extraPackages = [
      pkgs.glibc
      pkgs.zstd
    ];
    services.nomad.settings =
      (if cfg.isRaftServer
      then {
          server = { enabled = true; }
            // (if cfg.bootstrap then { bootstrap_expect = 3; } else {});
      } else {}) //
    {
      region = cfg.clusterName;
      datacenter = cfg.siteName;
      advertise = {
        rpc = "${clusterAddress}";
        http = "${clusterAddress}";
        serf = "${clusterAddress}";
      };
      consul = {
        address = "localhost:8501";
        ca_file = "/var/lib/nomad/pki/consul.crt";
        cert_file = "/var/lib/nomad/pki/consul-client.crt";
        key_file = "/var/lib/nomad/pki/consul-client.key";
        ssl = true;
        checks_use_advertise = true;
      };
      client = {
        enabled = true;
        network_interface = "wg0";
        meta = node_meta;
      };
      telemetry = {
        publish_allocation_metrics = true;
        publish_node_metrics = true;
        prometheus_metrics = true;
      };
      tls = {
        http = true;
        rpc = true;
        ca_file = "/var/lib/nomad/pki/nomad-ca.crt";
        cert_file = "/var/lib/nomad/pki/nomad.crt";
        key_file = "/var/lib/nomad/pki/nomad.key";
        verify_server_hostname = true;
        verify_https_client = true;
      };
      plugin = [
        {
          docker = [
            {
              config = [
                {
                  volumes.enabled = true;
                  allow_privileged = true;
                }
              ];
            }
          ];
        }
      ];
    };

    # ---- Firewall config ----

    # Open ports in the firewall.
    networking.firewall = {
      enable = true;

      allowedTCPPorts = [
        # Allow anyone to connect on SSH port
        (head ({ openssh.ports = [22]; } // config.services).openssh.ports)
      ];

      allowedUDPPorts = [
        # Allow peers to connect to Wireguard
        cfg.wireguardPort
      ];

      # Allow specific hosts access to specific things in the cluster
      extraCommands = ''
        # Allow UDP packets comming from port 1900 from a local address,
        # these are necessary for UPnP/IGD
        iptables -A INPUT -s 192.168.0.0/16 -p udp --sport 1900 -j ACCEPT

        # Allow docker containers to access all ports
        iptables -A INPUT -s 172.17.0.0/16 -j ACCEPT

        # Allow other nodes on VPN to access all ports
        iptables -A INPUT -s ${cfg.clusterPrefix} -j ACCEPT
      '';

      # When stopping firewall, delete all rules that were configured manually above
      extraStopCommands = ''
        iptables -D INPUT -s 192.168.0.0/16 -p udp --sport 1900 -j ACCEPT
        iptables -D INPUT -s 172.17.0.0/16 -j ACCEPT
        iptables -D INPUT -s ${cfg.clusterPrefix} -j ACCEPT
      '';
    };
  };
}
