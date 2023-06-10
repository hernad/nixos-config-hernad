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
  ] ++ (
    if config.virtualisation.libvirtd.enable then [
        installer-iso  # build iso, result =>  /nix/store 
    ] else [

    ]
  );

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}