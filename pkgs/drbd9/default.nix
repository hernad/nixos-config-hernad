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

 
  hardeningDisable = [ "pic" "format" ];
  makeFlags = [
    "KERNEL=${kernel.dev}"
    "KERNEL_VERSION=${kernel.modDirVersion}"
    "KERNELRELEASE=${kernel.modDirVersion}"                                 # 3
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"    # 4
    "INSTALL_MOD_PATH=$(out)"                                               # 5
    "DESTDIR=$(out)"
  ];

  installPhase = ''
    install -m 755   -d $out/lib/modules/${kernel.modDirVersion}/extra/
    install -m 644 *.ko $out/lib/modules/${kernel.modDirVersion}/extra/
  '';

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
    maintainers = [ "hernad@bring.out.ba" ];
    platforms = [ "x86_64-linux" "i686-linux" ];
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

# [root@hped800g3-3:~]# modinfo drbd
# filename:       /run/booted-system/kernel-modules/lib/modules/6.1.31/extra/drbd.ko
# alias:          block-major-147-*
# license:        GPL
# version:        9.2.4
# description:    drbd - Distributed Replicated Block Device v9.2.4
# author:         Philipp Reisner <phil@linbit.com>, Lars Ellenberg <lars@linbit.com>
# srcversion:     B45FF4CEF8E390239ACCE74
# depends:        lru_cache,dax,libcrc32c
# retpoline:      Y
# name:           drbd
# vermagic:       6.1.31 SMP preempt mod_unload 
# parm:           enable_faults:int
# parm:           fault_rate:int
# parm:           fault_count:int
# parm:           fault_devs:int
# parm:           disable_sendpage:bool
# parm:           allow_oos:DONT USE! (bool)
# parm:           minor_count:Approximate number of drbd devices (1U-255U) (uint)
# parm:           usermode_helper:string
# parm:           protocol_version_min:drbd_protocol_version
# parm:           strict_names:restrict resource and connection names to ascii alnum and a subset of punct (drbd_strict_names)
