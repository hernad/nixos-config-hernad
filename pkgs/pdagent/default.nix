{pkgs, ...}:

with pkgs;

buildGoModule {
    pname = "pdagent";
    version = "0.1.7";

    # https://github.com/PagerDuty/go-pdagent.git
    src = fetchFromGitHub {
        owner = "PagerDuty";
        repo = "go-pdagent";
        rev = "3a8c0f2";
        sha256 = "sha256-SKfB3SWptR6PqvVREvaw7IasHM0ZzlT8Z/hh1lrpYr0=";
    };

    # https://kalbas.it/2019/03/17/announcing-the-new-golang-infrastructure-buildgomodule/
    vendorSha256 = "sha256-hPT/LVFF4i9gU1HvdvGsWqKa4YYlKG/HK5zHFj6683Q=";

     meta =  {
        maintainers = ["hernad@bring.out.ba"];
     };

}



#  environment.systemPackages = with pkgs; [
#    callPackage buildGoModule
#rec {
#  pname = "pet";
#  version = "0.3.4";
#
#  src = fetchFromGitHub {
#    owner = "knqyf263";
#    repo = "pet";
#    rev = "v${version}";
#    sha256 = "0m2fzpqxk7hrbxsgqplkg7h2p7gv6s1miymv3gvw0cz039skag0s";
#  };
#
#  vendorSha256 = "1879j77k96684wi554rkjxydrj8g3hpp0kvxz03sd8dmwr3lh83j";
#
#  runVend = true;
#
#  meta = with lib; {
#    description = "Simple command-line snippet manager, written in Go";
#    homepage = "https://github.com/knqyf263/pet";
#    license = licenses.mit;
#    maintainers = with maintainers; [ kalbasit ];
#    platforms = platforms.linux ++ platforms.darwin;
#  };
#} {}
#];