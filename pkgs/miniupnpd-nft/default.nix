{ pkgs, 
  lib,
  stdenv ? pkgs.stdenv,
  makeWrapper ? pkgs.makeWrapper,
  fetchurl ? pkgs.fetchurl,  
  iptables-legacy ? pkgs.iptables-legacy, 
  libuuid ? pkgs.libuuid, 
  openssl ? pkgs.openssl, 
  pkg-config ? pkgs.pkg-config, 
  which ? pkgs.which, 
  iproute2 ? pkgs.iproute2, 
  gnused ? pkgs.gnused, 
  coreutils ? pkgs.coreutils, 
  gawk ? pkgs.gawk, 
  libmnl ? pkgs.libmnl,
  libnftnl ? pkgs.libnftnl,

  #nixosTests
}:

let
  scriptBinEnv = lib.makeBinPath [ which iproute2 iptables-legacy gnused coreutils gawk libmnl libnftnl ];
in
stdenv.mkDerivation rec {
  pname = "miniupnpd-nft";
  version = "2.3.3";

  src = fetchurl {
    url = "https://miniupnp.tuxfamily.org/files/miniupnpd-${version}.tar.gz";
    sha256 = "sha256-b9cBn5Nv+IxB58gi9G8QtRvXLWZZePZYZIPedbMMNr8=";
  };

  buildInputs = [ iptables-legacy libuuid openssl libmnl libnftnl];
  nativeBuildInputs= [ pkg-config makeWrapper ];

  configurePhase =  ''
     ./configure --firewall=nftables
  '';


   buildPhase = ''
       make
   '';

  # ./configure is not a standard configure file, errors with:
  # Option not recognized : --prefix=
  dontAddPrefix = true;

  installFlags = [ "PREFIX=$(out)" "INSTALLPREFIX=$(out)" ];

  postFixup = ''
    #chmod +x $out/etc/miniupnpd/ip{,6}tables_{init,removeall}.sh
    for script in $out/etc/miniupnpd/*.sh
    do
      wrapProgram $script --set PATH '${scriptBinEnv}:$PATH'
    done
  '';

  #passthru.tests = {
  #  bittorrent-integration = nixosTests.bittorrent;
  #  inherit (nixosTests) upnp;
  #};

  meta = with lib; {
    homepage = "https://miniupnp.tuxfamily.org/";
    description = "A daemon that implements the UPnP Internet Gateway Device (IGD) specification nftables";
    platforms = platforms.linux;
    license = licenses.bsd3;
  };
}