let
  common = import ./common.nix;
  app = import ./default.nix;
  pkgs = import common.pkgsSrc {};
in
  pkgs.dockerTools.buildImage {
    name = "superboum/backup-psql-docker";
    config = {
      Cmd = [ "${app}/bin/backup-psql" ];
    };
 }
