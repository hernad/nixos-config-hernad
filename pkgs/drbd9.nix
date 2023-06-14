# https://blog.prag.dev/building-kernel-modules-on-nixos

{ stdenv
, fetchpatch
, nukeReferences
, linuxPackages
, kernel ? linuxPackages.kernel
, version
}:

stdenv.mkDerivation {
  name = "drbd-${version}-module-${kernel.modDirVersion}";
  inherit version;

  buildInputs = [ nukeReferences ];

  kernel = kernel.dev;
  kernelVersion = kernel.modDirVersion;

  # https://pkg.linbit.com/

  src = fetchurl {
    url = "https://pkg.linbit.com//downloads/drbd/9/drbd-9.2.4.tar.gz";
    sha256 = "1l99kcrb0j85wxxmrdihpx9bk1a4sdi7wlp5m1x5l24k8ck1m5cf";
  };

  patches = [
    #(fetchpatch {
    #  name = "fix-get_user_pages-and-mmap_lock.patch";
    #  url = "https://aur.archlinux.org/cgit/aur.git/plain/02-fix-get_user_pages-and-mmap_lock.patch?h=decklink&id=8f19ef584c0603105415160d2ba4e8dfa47495ce";
    #  sha256 = "08m4qwrk0vg8rix59y591bjih95d2wp6bmm1p37nyfvhi2n9jw2m";
    #})
    #(fetchpatch {
    #  name = "fix-have_unlocked_ioctl.patch";
    #  url = "https://aur.archlinux.org/cgit/aur.git/plain/03-fix-have_unlocked_ioctl.patch?h=decklink&id=8f19ef584c0603105415160d2ba4e8dfa47495ce";
    #  sha256 = "0j9p62qa4mc6ir2v4fzrdapdrvi1dabrjrx1c295pwa3vmsi1x4f";
    #})
  ];

  postUnpack = ''
    cd */usr/src
    sourceRoot="$(pwd -P)"
  '';

  buildPhase = ''
    cd $sourceRoot/drbd*/
    # missing some "touch" commands, make sure they exist for build.
    touch .bmd-support.o.cmd
    make -C $kernel/lib/modules/$kernelVersion/build modules "M=$(pwd -P)"

    cd $sourceRoot/blackmagic-io-''${version}*/
    # missing some "touch" commands, make sure they exist for build.
    touch .blackmagic.o.cmd
    make -C $kernel/lib/modules/$kernelVersion/build modules "M=$(pwd -P)"

    cd $sourceRoot
  '';

  installPhase = ''
    mkdir -p $out/lib/modules/$kernelVersion/misc
    for x in $(find . -name '*.ko'); do
      nuke-refs $x
      cp $x $out/lib/modules/$kernelVersion/misc/
    done
  '';

  meta.platforms = [ "x86_64-linux" ];
}