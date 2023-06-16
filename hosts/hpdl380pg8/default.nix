{ inputs, outputs, ... }: {
  imports = [
    #./hardware-configuration.nix
  ];

  boot.extraModulePackages = [ drbd9.out ];

  # when you put a module inside boot.extraModulePackages, 
  # it is used to make the modules available to modprobe, but it will not load them automatically 
  # (modprobe will search for module

  boot.kernelModules = ["drbd" ];
}

#[root@hped800g3-4:~]# cat /run/booted-system/kernel-modules/lib/modules/6.1.31/modules.order  | grep drbd
#kernel/drivers/block/drbd/drbd.ko

