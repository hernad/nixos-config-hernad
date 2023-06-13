{
    clusterNodes."node1" = {
      siteName = "sa1";
      publicKey = "YEW6NWaa9eHmXAxVwLedAOH0zPICR21JlHmC2VVi6n0=";
      address = "10.183.1.1";
      endpoint = "10.0.99.10:33799"; 
    };

    clusterNodes."node2" = {
      siteName = "sa1";
      publicKey = "nHfxdSExo2cVUVbwZWM+wnLUrfMxrZiFJTtskTPPcG8=";
      address = "10.183.1.2";
      endpoint = "10.0.99.11:33799"; 
    };

    # New Wireguard key was generated.
    # This node's Wireguard public key is: 9kuzKR41MvQgXYL15xMzaUn8k2hutZtZjYbjwSdaXnk=

    clusterNodes."node3" = {
      siteName = "sa1";
      publicKey = "9kuzKR41MvQgXYL15xMzaUn8k2hutZtZjYbjwSdaXnk=";
      address = "10.183.1.3";
      endpoint = "10.0.99.12:33799"; 
    };
}