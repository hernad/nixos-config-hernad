{config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    virtmanager
    qemu
    OVMF
  ];

   # https://gist.github.com/techhazard/1be07805081a4d7a51c527e452b87b26

   boot.kernelParams = [ "intel_iommu=on" ]
   boot.kernelModules = [ "kvm-intel", "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
   virtualisation.libvirtd.enable = true;
   
   virtualisation.libvirtd.qemuVerbatimConfig = ''
    nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
   '';

   # https://github.com/WhittlesJr/nixos-shared/blob/master/pciPassthrough.nix

}
