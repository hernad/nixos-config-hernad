{ config, lib, pkgs, ... }:
let

in
{

  environment.systemPackages = with pkgs; [ 
    htop
    tmux
    vim
    fio
    iperf3
    traceroute
    speedtest-cli
    hernad-util-scripts
  ];

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}