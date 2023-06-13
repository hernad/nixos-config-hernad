{
  pkgs ? import <nixpkgs> {}
}:
pkgs.buildGoModule rec {
  pname = "nomad-driver-nix2";
  version = "0.1.0";

  src = builtins.fetchGit {
    url = "https://git.deuxfleurs.fr/Deuxfleurs/nomad-driver-nix2";
    rev = "59aba7607507193587be7c24229dc71066e3ae87";
  };

  vendorSha256 = "sha256-EQdTxVOBRYQjg7kAB+pFJYcNwk0zlsjjJxM+EO/cK84=";

  postInstall = ''
    mv $out/bin/nomad-driver-nix2 $out/bin/nix2
  '';

  meta = with pkgs.lib; {
    description = "Nomad driver to run Nix jobs";
    homepage = "https://git.deuxfleurs.fr/Deuxfleurs/nomad-driver-nix2";
    license = licenses.mpl20;
    platforms = platforms.linux;
  };
}
