let
  common = import ./common.nix;
  pkgs = import common.pkgsSrc {};
  python-with-my-packages = pkgs.python3.withPackages (p: with p; [
    minio
  ]);
in
  pkgs.stdenv.mkDerivation {
    name = "backup-psql";
    src = pkgs.lib.sourceFilesBySuffices ./. [ ".py" ];

    buildInputs = [
      python-with-my-packages
      pkgs.age
      pkgs.postgresql_14
    ];

    buildPhase = ''
      cat > backup-psql <<EOF
      #!${pkgs.bash}/bin/bash

      export PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
      export PATH=${python-with-my-packages}/bin:${pkgs.age}/bin:${pkgs.postgresql_14}/bin

      ${python-with-my-packages}/bin/python3 $out/lib/backup-psql.py
      EOF

      chmod +x backup-psql
    '';

    installPhase = ''
      mkdir -p $out/{bin,lib}
      cp *.py $out/lib/backup-psql.py
      cp backup-psql $out/bin/backup-psql
    '';
  }

