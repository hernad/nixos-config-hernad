{config, pkgs, lib, ...}:

# https://discourse.nixos.org/t/how-to-start-a-daemon-properly-in-nixos/14019

# https://nixos.wiki/wiki/NixOps/Virtualization

# https://gist.github.com/dejanr/7fba2c6c4df6482307e8bb46cb2ad8a8


# pogledati ovo!
# https://ww.telent.net/2017/10/20/nixos_again_declarative_vms_with_qemu
# https://github.com/telent/nixos-configs

# https://ww.telent.net/2023/6/2/turning_the_nftables
with lib;

let
  cfg = config.libvirtGuests;


in {


   options = {
     libvirtGuests = {
      enable = mkEnableOption "libvirtGuests enable";
      guests = mkOption {
        type = types.attrs;
        default = [];
      };
     };

   };


    #nameValuePair "some" 6
    #   => { name = "some"; value = 6; }

    #Example:
    #   mapAttrs (name: value: name + "-" + value)
    #      { x = "foo"; y = "bar"; }
    #   => { x = "x-foo"; y = "y-bar"; }



    config = (mkIf cfg.enable {
        systemd.services = mapAttrs' (name: value: nameValuePair "libvirtd-guest-${name}" {
        after = [ "libvirtd.service" ];
        requires = [ "libvirtd.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = "yes";
        };

        #Type: optionalString :: bool -> string -> string

        script =
            let
            xml_cdrom = ''
                    <disk type="file" device="cdrom">
                            <driver name="qemu" type="raw"/>
                            <source file="/var/lib/libvirt/images/nixos.iso"/>
                            <target dev="sda" bus="sata"/>
                            <readonly/>
                            <boot order="1"/>
                            <address type="drive" controller="0" bus="0" target="0" unit="0"/>
                    </disk>
            '';

            xml = pkgs.writeText "libvirt-guest-${name}.xml"
                ''
                <domain type="kvm">
                    <name>${name}</name>
                    <uuid>UUID</uuid>
                    <metadata>
                        <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
                        <libosinfo:os id="${value.osInfo}"/>
                        </libosinfo:libosinfo>
                    </metadata>
                    <memoryBacking>
                        <source type='memfd'/>
                        <access mode='shared'/>
                    </memoryBacking>
                    <vcpu placement='static'>${value.vcpu}</vcpu>

                    <os>
                    <type arch='x86_64' machine='pc-q35-7.2'>hvm</type>
                    </os>
                    <memory unit="KiB">${value.memory}</memory>
                    <currentMemory unit="KiB">${value.currentMemory}</currentMemory>
                    <on_poweroff>destroy</on_poweroff>
                    <on_reboot>restart</on_reboot>
                    <on_crash>destroy</on_crash>


                    <devices>

                    <disk type='file' device='disk'>
                        <driver name='qemu' type='qcow2' discard='unmap'/>
                        <source file='/var/lib/libvirt/images/${name}.qcow2'/>
                        <target dev='vda' bus='virtio'/>
                        <boot order='2'/>
                        <address type='pci' domain='0x0000' bus='0x05' slot='0x00' function='0x0'/>
                    </disk>

                    ${optionalString value.CDROM xml_cdrom}"  

                    <graphics type='spice' autoport='yes'>
                         <listen type='address'/>
                         <image compression='off'/>
                    </graphics>


                    <input type="keyboard" bus="usb"/>

                    <interface type="bridge">
                        <source bridge="${value.hostNic}"/>
                        <mac address="${value.mac}"/>
                        <model type="virtio"/>
                        <address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
                    </interface>

                    <rng model='virtio'>
                        <backend model='random'>/dev/urandom</backend>
                        <address type='pci' domain='0x0000' bus='0x07' slot='0x00' function='0x0'/>
                    </rng>

                    <memballoon model="virtio">
                        <address type="pci" domain="0x0000" bus="0x03" slot="0x00" function="0x0"/>
                    </memballoon>

                    </devices>
                    <features>
                    <acpi/>
                    </features>
                </domain>
                '';
            in
            ''
                FILE="$(ls ${pkgs.installer-iso}/iso/nixos-*-x86_64-linux.iso)"
                iso="$(${pkgs.coreutils}/bin/basename $FILE)"
                if [ ! -f /var/lib/libvirt/images/nixos.iso ]; then
                   cp $FILE /var/lib/libvirt/images/nixos.iso
                fi 

                uuid="$(${pkgs.libvirt}/bin/virsh domuuid '${name}' || true)"
                if [ -z "$uuid" ]; then
                   uuid="$(${pkgs.util-linux}/bin/uuidgen)"
                fi 
                FILE=/var/lib/libvirt/images/${name}.qcow2
                if [ ! -f $FILE ] ; then
                  ${pkgs.qemu}/bin/qemu-img create -f qcow2 $FILE ${value.diskSize}G
                fi
                ${pkgs.libvirt}/bin/virsh define <(sed "s/UUID/$uuid/" '${xml}')
                ${pkgs.libvirt}/bin/virsh start '${name}'
            '';
        preStop =
            ''
            ${pkgs.libvirt}/bin/virsh shutdown '${name}'
            let "timeout = $(date +%s) + 10"
            while [ "$(${pkgs.libvirt}/bin/virsh list --name | grep --count '^${name}$')" -gt 0 ]; do
                if [ "$(date +%s)" -ge "$timeout" ]; then
                # Meh, we warned it...
                ${pkgs.libvirt}/bin/virsh destroy '${name}'
                else
                # The machine is still running, let's give it some time to shut down
                sleep 0.5
                fi
            done
            '';
        }) cfg.guests;
    });

}