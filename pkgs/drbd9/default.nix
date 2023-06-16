{
  pkgs,
  coccinelle ? pkgs.coccinelle,
  curl ? pkgs.curl,
  kernel ? pkgs.linuxPackages_6_3.kernel
}:
with pkgs;
stdenv.mkDerivation rec {
  pname = "drbd";
  version = "9.2.4";

  __noChroot = true;

  KERNEL = kernel.dev;
  KERNEL_VERSION = kernel.modDirVersion;
  #DESTDIR = "$out";

  buildInputs = [ 
      kernel.dev 
      curl 
      pahole
      coccinelle 
      git
  ];

  src = ./drbd;

  #configurePhase = ''
  #  cmake .
  #'';

  #buildPhase = ''
  #  make
  #'';

  installPhase = ''
    mkdir -p $out/
    #pwd
    #find .
    mv ./drbd.ko $out/
  '';

  # Initially, nix-shell was designed to enter a package’s build environment for debugging purpose.
  # However, nix-shell can also be used to enter an custom environment defined
  # by the mkShell function.

  shellHook = ''
     echo KERNEL = $KERNEL
     echo KERNEL_VERSION = $KERNEL_VERSION
     #echo DESTDIR = $DESTDIR
  '';
}