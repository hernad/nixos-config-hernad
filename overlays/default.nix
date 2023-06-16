# This file defines overlays
{ inputs, self, nixos-generators, nixpkgs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { 
    inherit self nixpkgs nixos-generators; 
    pkgs = final; 
  };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    
    };


    # https://www.reddit.com/r/NixOS/comments/428xja/help_overriding_a_kernel_module/

      #nixpkgs.config.packageOverrides = pkgs: rec {
      #    linuxPackages.e1000e = pkgs.linuxPackages.e1000e.overrideDerivation (attrs: {
      #    name = "e1000e-3.3.1-${config.boot.kernelPackages.kernel.version}";
      #
      #    src = fetchurl {
      #    url = "mirror://sourceforge/e1000/e1000e-3.3.1.tar.gz";
      #    sha256 = "07hg6xxqgqshnys1qs9wbl9qr7d4ixdkd1y1fj27cg6bn8s2n797";
      #};
  
      
      
  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
