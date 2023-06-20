# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

#{ pkgs ? (import ../nixpkgs.nix) { } }: {
#  # example = pkgs.callPackage ./example { };
#}


{ self, nixos-generators, nixpkgs, pkgs }:
let
  #flakeTime = self.sourceInfo.lastModified;
  #iso-images = import ./images/iso-images.nix { inherit pkgs ; };
  lib = nixpkgs.lib;
in
  
{
  #authelia-bin = pkgs.callPackage ./authelia-bin.nix { };
  hernad-util-scripts = import ./hernad-util-scripts { inherit pkgs; };

  #update-ci-workflow = pkgs.callPackage ./update-ci-workflow { inherit self; };
  #scan-ci-host-keys = pkgs.callPackage ./scan-ci-host-keys { inherit self; };

  #ci-import-and-tag-docker = pkgs.callPackage ./ci-import-and-tag-docker { };
  installer-iso = pkgs.callPackage ./images/installer-iso { inherit self pkgs; };

  test-txt = import ./test-txt.nix { inherit pkgs; };
   
  drbd9 = import ./drbd9 { inherit pkgs; };
  drbd9-utils = import ./drbd9-utils { inherit pkgs; };

  pdagent = import ./pdagent { inherit pkgs; };

  nomad-driver-nix2 = import ./nomad-driver-nix2  { inherit pkgs; };
}