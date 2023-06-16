{
  pkgs,
  coccinelle ? pkgs.coccinelle,
  curl ? pkgs.curl,
  #kernel ? pkgs.linuxPackages_6_3.kernel
  kernel ? pkgs.linuxPackages.kernel
}:
with pkgs;
stdenv.mkDerivation rec {
  pname = "drbd9";
  version = "9.2.4";

  #__noChroot = true;

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

  nativeBuildInputs = kernel.moduleBuildDependencies;

  src = ./drbd;

  #configurePhase = ''
  #  cmake .
  #'';

  #buildPhase = ''
  #  make
  #'';

  # /home/hernad/nix/nixpkgs/pkgs/applications/virtualization/virtualbox/guest-additions/default.nix

   # https://discourse.nixos.org/t/load-automatically-kernel-module-and-deal-with-parameters/9200/2

   # /home/hernad/nix/nixpkgs/pkgs/os-specific/linux/new-lg4ff/default.nix

  #installPhase = ''
  #  
  #  #mkdir -p $out/lib/modules/${KERNEL_VERSION}/extra/drbd9
  #  mkdir -p $out/
  #  xz drbd.ko
  #  mv drbd.ko.xz $out
  #  #/lib/modules/${KERNEL_VERSION}/extra/drbd9/
  #
  #'';

  # https://nixos.wiki/wiki/Linux_kernel

  # https://blog.thalheim.io/2022/12/17/hacking-on-kernel-modules-in-nixos/

  # https://github.com/Mic92/uptime_hack/


  hardeningDisable = [ "pic" "format" ];
  makeFlags = [
    "KERNEL=${kernel.dev}"
    "KERNEL_VERSION=${kernel.modDirVersion}"
    "KERNELRELEASE=${kernel.modDirVersion}"                                 # 3
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"    # 4
    "INSTALL_MOD_PATH=$(out)"                                               # 5
    "DESTDIR=$(out)"
  ];

  
  # Initially, nix-shell was designed to enter a package’s build environment for debugging purpose.
  # However, nix-shell can also be used to enter an custom environment defined
  # by the mkShell function.

  shellHook = ''
     echo KERNEL = $KERNEL
     echo KERNEL_VERSION = $KERNEL_VERSION
     #echo DESTDIR = $DESTDIR
  '';

  meta = with lib; {
    description = "A kernel module to create drbd v9 block device";
    homepage = "https://github.com/LINBIT/drbd";
    license = licenses.gpl2;
    #maintainers = [ maintainers.makefu ];
    platforms = platforms.linux;
  };
}


#[root@hped800g3-4:~]# ls /nix/store/*drbd-9.2.4/
#drbd.ko


# ls -l /run/current-system/kernel-modules/lib/modules/6.1.31/extra/zfs/zfs.ko.xz

# ls /run/current-system/kernel-modules/lib/modules/6.1.31/extra/
# avl  icp  lua  nvpair  spl  unicode  zcommon  zfs  zstd


#[root@hped800g3-4:~]# modinfo drbd
#filename:       /run/booted-system/kernel-modules/lib/modules/6.1.31/kernel/drivers/block/drbd/drbd.ko.xz
#alias:          block-major-147-*
#license:        GPL
#version:        8.4.11



#[root@hped800g3-4:~]# 
# drbdadm down r0
# systemctl stop sys-devices-virtual-block-drbd1.device
# rmmod drbd

