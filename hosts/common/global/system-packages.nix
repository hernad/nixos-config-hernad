{ config, lib, pkgs, ... }:
let

in
{

  environment.systemPackages = with pkgs; [ 
    htop
    iotop
    nmon
    jnettop
    tmux
    vim
    fio
    iperf3
    traceroute
    speedtest-cli
    hernad-util-scripts
    #khelloworld
  ] ++ (
    if config.virtualisation.libvirtd.enable then [
        drbd9-utils
        installer-iso  # build iso, result =>  /nix/store 
    ] else [

    ]
  );

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}