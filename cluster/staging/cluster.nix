{ config, pkgs, ... } @ args:

{
  bring-out.clusterName = "staging";

  # The IP range to use for the Wireguard overlay of this cluster
  bring-out.clusterPrefix = "10.183.0.0/16";

  bring-out.clusterNodes = {
    "node1" = {
      siteName = "sa1";
      publicKey = "VvXT0fPDfWsHxumZaVShpS33dJQbdpJ1E79ZbCBJP49=";
      address = "10.183.1.1";
      endpoint = "77.207.15.215:33731";
    };
    "node2" = {
      siteName = "sa1";
      publicKey = "ooTkBJGmzrRBOAjUcdH9G0JekipqSMoaYQdB6IHnzi0=";
      address = "10.183.1.2";
      endpoint = "77.207.15.215:33732";
    };
  };

  # Bootstrap IPs for Consul cluster,
  # these are IPs on the Wireguard overlay
  services.consul.extraConfig.retry_join = [
    "10.183.1.1"  # concombre
    #"10.183.2.1"  # dahlia
    #"10.183.3.1"  # df-ykl
  ];

  bring-out.adminAccounts = {
    hernad = [
      # Keys for accessing nodes from outside
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0xP+KKZzsiYdP84jJWPUbppag5ldMl3evYtyh01CZ+Us3xIPPCtApmAGvFsjfgg3mJIPen+B1kHmmc4QaZNbbgF5J2f10eH7WH8b2JazyJsZo2S4eObtH4J2gqstFgFxWeZOG/nGDi9Q1JqVrF0ubtK0Mu5f4dSBQ4YYh3fsuj351CA7snF+KcIJ9uLCAJUYezX9LIyhNd7fDpKPuMsHiUCwsTSji0l5kT4xlZ4OoOE+B1fmZ0vFP3gfah+YXQXv4eUbjt79kMdgCIvG6gh6x7Xm5RbE/LdAAYNnevWHv7gDjQKuyakKQp/lEdr6K5fSJNNJ5PB6uvE8/NT95rEP/hr7vE2N5qlMRyozQfZbYp6o1pD6vKSohTK8cLkfNcfwDXRyWvl2vOvgLYv5u2E+OR/MoCUybcfEmwnthRPAA+jXYrMyLTL5ZzeP8UBST6zTkjB2aU/G2AUQW2nKre5isAxjWUo1T0gzBQKTlP5N5vaGWxPVL/xZsJDfARgbIeik= hernad@dev"
    ];
    bjasko = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0xP+KKZzsiYdP84jJWPUbppag5ldMl3evYtyh01CZ+Us3xIPPCtApmAGvFsjfgg3mJIPen+B1kHmmc4QaZNbbgF5J2f10eH7WH8b2JazyJsZo2S4eObtH4J2gqstFgFxWeZOG/nGDi9Q1JqVrF0ubtK0Mu5f4dSBQ4YYh3fsuj351CA7snF+KcIJ9uLCAJUYezX9LIyhNd7fDpKPuMsHiUCwsTSji0l5kT4xlZ4OoOE+B1fmZ0vFP3gfah+YXQXv4eUbjt79kMdgCIvG6gh6x7Xm5RbE/LdAAYNnevWHv7gDjQKuyakKQp/lEdr6K5fSJNNJ5PB6uvE8/NT95rEP/hr7vE2N5qlMRyozQfZbYp6o1pD6vKSohTK8cLkfNcfwDXRyWvl2vOvgLYv5u2E+OR/MoCUybcfEmwnthRPAA+jXYrMyLTL5ZzeP8UBST6zTkjB2aU/G2AUQW2nKre5isAxjWUo1T0gzBQKTlP5N5vaGWxPVL/xZsJDfARgbIeik= hernad@dev"
    ];
  };

  # For Garage external communication
  networking.firewall.allowedTCPPorts = [ 3901 ];

  # All prod nodes were deployed on the same version.
  # This could be put in individual node .nix files if we deploy
  # newer nodes on a different system version, OR we can bump this
  # regularly cluster-wide
  system.stateVersion = "21.05";
}