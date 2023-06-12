{ config, pkgs, ... }:


let
  cfg = config.bring-out.remoteUnlock;
in
  with builtins;
  with pkgs.lib;
{
  options.bring-out.remoteUnlock = {
    networkInterface = mkOption {
      description = "Network interface to configure with static IP";
      type = types.str;
    };
    staticIP = mkOption {
      description = "IP address (with prefix length) of this node on the local network interface";
      type = types.str;
    };
    defaultGateway = mkOption {
      description = "IP address of default gateway";
      type = types.str;
    };
  };

  config = {
    #boot.initrd.availableKernelModules = [ "pps_core" "ptp" "e1000e" ];
    boot.initrd.network.enable = true;
    boot.initrd.network.ssh = {
      enable = true;
      port = 222;
      authorizedKeys = concatLists (mapAttrsToList (name: user: user) config.bring-out.adminAccounts);
      hostKeys = [ "/var/lib/bring-out/remote-unlock/ssh_host_ed25519_key" ];
    };
    boot.initrd.network.postCommands = ''
      ip addr add ${cfg.staticIP} dev ${cfg.networkInterface}
      ip link set dev ${cfg.networkInterface} up
      ip route add default via ${cfg.defaultGateway} dev ${cfg.networkInterface}
      ip a
      ip route
      ping -c 4 ${cfg.defaultGateway}
      echo 'echo run cryptsetup-askpass to unlock drives' >> /root/.profile
    '';
  };
}