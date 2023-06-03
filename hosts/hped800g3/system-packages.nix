{ config, lib, pkgs, ... }:
let

in
{


  environment.systemPackages = with pkgs; [ 
    htop
    vim
  ];

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}