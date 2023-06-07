# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

#{ pkgs ? (import ../nixpkgs.nix) { } }: {
#  # example = pkgs.callPackage ./example { };
#}


{ self, nixos-generators, nixpkgs, pkgs }:
let
  #flakeTime = self.sourceInfo.lastModified;
  iso-images = import ./images/iso-images.nix { inherit pkgs; };
in iso-images // {
  #authelia-bin = pkgs.callPackage ./authelia-bin.nix { };

  #update-ci-workflow = pkgs.callPackage ./update-ci-workflow { inherit self; };
  #scan-ci-host-keys = pkgs.callPackage ./scan-ci-host-keys { inherit self; };

  #ci-import-and-tag-docker = pkgs.callPackage ./ci-import-and-tag-docker { };
  installer-iso = pkgs.callPackage ./images/installer-iso { inherit self; };

  test-txt = import ./test-txt.nix { inherit pkgs; };

  #ifd3f-infra-scripts = pkgs.callPackage ./../../scripts { };

  # https://ianthehenry.com/posts/how-to-learn-nix/builders/
  # There’s another function called linkFarm, undocumented in the manual, which operates like symlinkJoin, but provides a different output structure.
  #* linkFarm is instead used to create a simple derivation with symlinks to
  #* other derivations.  A derivation created with linkFarm is often used in CI
  #* as a easy way to build multiple derivations at once.


  #internal-libvirt-images = pkgs.linkFarm "internal-libvirt-images" [{
  #  name = "centos-8.qcow2";
  #  path = iso-images.centos-8-cloud-qcow2;
  #}];

  #win10hotplug = pkgs.callPackage ./win10hotplug { };

  #push-vault-secrets = with pkgs;
  #  writeScriptBin "push-vault-secrets" ''
  #    set -o xtrace
  #    ${vault-push-approles self}/bin/vault-push-approles &&
  #      ${vault-push-approle-envs self}/bin/vault-push-approle-envs
  #  '';
}