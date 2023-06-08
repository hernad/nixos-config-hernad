{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  
  #sops-nix has to run after NixOS creates users (in order to specify what users own a secret.) 
  # This means that it's not possible to set users.users.<name>.passwordFile to any secrets managed by sops-nix.
  # To work around this issue, it's possible to set neededForUsers = true in a secret. 
  #This will cause the secret to be decrypted to /run/secrets-for-users instead of 
  #/run/secrets before NixOS creates users. 
  #As users are not created yet, it's not possible to set an owner for these secrets.

  sops.secrets.hernad-password = {
    sopsFile = ../../../../secrets/user-secrets-${config.networking.hostName}.yaml;
    neededForUsers = true;
    #mode = "0440";
    #owner = config.users.users.hernad.name;
    #group = config.users.users.hernad.group;
  };

  users.users.hernad = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
    ];

    #openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/misterio/ssh.pub) ];
    
    passwordFile = config.sops.secrets.hernad-password.path;
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.hernad = import ../../../../home-manager/hernad/${config.networking.hostName}.nix;

  #services.geoclue2.enable = true;
  #security.pam.services = { swaylock = { }; };

  # Persist entire home
  environment.persistence = {
    "/persist".directories = [ "/home/hernad" ];
  };

}