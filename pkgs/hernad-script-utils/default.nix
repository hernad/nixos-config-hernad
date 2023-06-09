{
  pkgs,
  ...
}:
with pkgs;
  pkgs.stdenv.mkDerivation rec {
    version = "1.0.0";
    name = "hernad-script-utils-${version}";

    buildInputs = [bashInteractive coreutils pciutils];

    #buildInputs = [bashInteractive btrfs-progs openssh makeWrapper coreutils pv hostname];

    src = ./.;

    installPhase = ''
      runHook preInstall
      for scpt in $(ls ${./scripts}); do
        install -D ${./scripts}/$scpt $out/scripts/$scpt
        ${pkgs.shellcheck}/bin/shellcheck $out/scripts/$scpt
      done
      for scpt in $out/scripts/*; do
          local sname=$(basename "$scpt")
          makeWrapper "$scpt" "$out/bin/$sname" --prefix PATH ":" \
          "${bashInteractive}/bin:${coreutils}/bin:${pciutils}/bin:$out/bin"
      done
      runHook postInstall
    '';

    meta = {
      description = "hernad util scripts";
      license = "MIT";
      platforms = pkgs.lib.platforms.linux;
    };
  }