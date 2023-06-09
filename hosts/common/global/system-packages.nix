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
    installer-iso  # build iso, result =>  /nix/store 
  ];

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}