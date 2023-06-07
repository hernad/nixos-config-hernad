{ config, lib, pkgs, ... }:
let

in
{

  environment.systemPackages = with pkgs; [ 
    htop
    vim
    fio
    installer-iso  # build iso, result =>  /nix/store 
  ];

  #environment.persistence = {
  #  "/persist".directories = [ "/var/lib/headscale" ];
  #};
}