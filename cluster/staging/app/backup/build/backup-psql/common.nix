{
  pkgsSrc = fetchTarball {
    # Latest commit on https://github.com/NixOS/nixpkgs/tree/nixos-21.11
    # As of 2022-04-15
    url ="https://github.com/NixOS/nixpkgs/archive/2f06b87f64bc06229e05045853e0876666e1b023.tar.gz";
    sha256 = "sha256:1d7zg96xw4qsqh7c89pgha9wkq3rbi9as3k3d88jlxy2z0ns0cy2";
  };
}
