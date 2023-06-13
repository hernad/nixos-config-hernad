# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... } @ args:

# Configuration local for this cluster node (hostname, IP, etc)
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include generic Deuxfleurs module
      ./bring-out.nix
      # Configuration for this deployment (a cluster)
      ./cluster.nix
      # Configuration local for this Deuxfleurs site (set of nodes)
      ./site.nix
      # Configuration local for this cluster node (hostname, IP, etc)
      ./node.nix
    ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  # Set your time zone.
  time.timeZone = "Europe/Sarajevo";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "sun12x22";
    keyMap = "fr";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 262144;
  };

  services.journald.extraConfig = ''
SystemMaxUse=1G
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nmap
    bind
    inetutils
    pciutils
    vim
    tmux
    ncdu
    iotop
    jnettop
    nethogs
    wget
    htop
    smartmontools
    links2
    git
    rclone
    docker-compose
    wireguard-tools
  ];

  programs.vim.defaultEditor = true;

  # Enable network time
  services.ntp.enable = false;
  services.timesyncd.enable = true;

  # Enable the OpenSSH daemon and disable password login.
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;

  virtualisation.docker = {
    enable = true;
    extraOptions = "--config-file=${pkgs.writeText "daemon.json" (builtins.toJSON {
      dns = [ "172.17.0.1" ];
    })}";
  };

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
}

