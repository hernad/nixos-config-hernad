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
        # nameValuePair :: String -> Any -> AttrSet
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

            bootBios = !value.efi;
            bootEfi = value.efi;

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

            xml_pci1 = ''
            <hostdev mode="subsystem" type="pci" managed="yes">
            <source>
                <address domain="0x0000" bus="${value.pci1.bus}" slot="${value.pci1.slot}" function="${value.pci1.function}"/>
            </source>
            </hostdev>
            '';

            xml_pci2 = ''
            <hostdev mode="subsystem" type="pci" managed="yes">
            <source>
                <address domain="0x0000" bus="${value.pci2.bus}" slot="${value.pci2.slot}" function="${value.pci2.function}"/>
            </source>
            </hostdev>
            '';

            xml_pci3 = ''
            <hostdev mode="subsystem" type="pci" managed="yes">
            <source>
                <address domain="0x0000" bus="${value.pci3.bus}" slot="${value.pci3.slot}" function="${value.pci3.function}"/>
            </source>
            </hostdev>
            '';

            # https://forums.unraid.net/topic/101283-what-is-the-difference-between-virtio-and-virtio-net/
            # https://insujang.github.io/2021-03-15/virtio-and-vhost-architecture-part-2/
            # https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm
            # https://joshrosso.com/c/vm-networks/


            # https://libvirt.org/formatdomain.html#setting-nic-driver-specific-options

            # https://serverfault.com/questions/1076615/loading-a-kvm-guest-with-static-ip-using-xml-file
            #<ip address="${value.ip2.address}" prefix="${value.ip2.prefix}" gateway="${value.ip2.gateway}" />

            # hped800g3 hostovi:
            # ovo podesenje vhost drivera dalo je znacajne rezultate - puno manje retry-a
            # bilo je cca 16000, sada 3000; zato treba parametar vhostConfig2 = enable;

            # hpdl380pg8 host ovo podesenje vhosta daje losije rezultate - zato ga treba iskljuciti!
            xml_vhost_config = ''
                 <driver name="vhost" txmode="iothread" ioeventfd="on" event_idx="off" queues="${value.vcpu}" rx_queue_size="256" tx_queue_size="256">
                      <host csum="off" gso="off" tso4="off" tso6="off" ecn="off" ufo="off" mrg_rxbuf="off"/>
                      <guest csum="off" tso4="off" tso6="off" ecn="off" ufo="off"/>
                    </driver>
            '';

            xml_bridge2 = ''
              <interface type="bridge">
                    <source bridge="${value.net2.hostBridge}"/>
                    <mac address="${value.net2.mac}"/>
                    <model type="virtio"/>
                    ${optionalString value.net2.vhostConfig xml_vhost_config}" 
                    <mtu size="${value.net2.mtu}"/>
               </interface>
            '';

            xml_bridge3 = ''
              <interface type="bridge">
                    <source bridge="${value.net3.hostBridge}"/>
                    <mac address="${value.net3.mac}"/>
                    <model type="virtio"/>
                    ${optionalString value.net3.vhostConfig xml_vhost_config}" 
                    <mtu size="${value.net3.mtu}"/>
               </interface>
            '';

            xml_efi = ''
              <os>
               <type arch="x86_64" machine="q35">hvm</type>
               <loader readonly="yes" type="pflash">/run/libvirt/nix-ovmf/OVMF_CODE.fd</loader>
               <!--
               <boot dev="hd"/>
               -->
              </os>
            ''; 

            xml_bios = ''
              <os>
                <type arch="x86_64" machine="pc-q35">hvm</type>
              </os>
            '';

            # https://nixos.org/manual/nix/stable/language/operators.html

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
                    ${optionalString bootBios xml_bios}
                    ${optionalString bootEfi xml_efi}
                    <memory unit="KiB">${value.memory}</memory>
                    <currentMemory unit="KiB">${value.currentMemory}</currentMemory>
                    <on_poweroff>destroy</on_poweroff>
                    <on_reboot>restart</on_reboot>
                    <on_crash>destroy</on_crash>

                    <devices>

                    <!-- qemu guest agent -->
                    <channel type="unix">
                    <target type="virtio" name="org.qemu.guest_agent.0"/>
                    <address type="virtio-serial" controller="0" bus="0" port="1"/>
                    </channel>

                    <disk type='file' device='disk'>
                        <driver name='qemu' type='qcow2' discard='unmap'/>
                        <source file='/var/lib/libvirt/images/${name}.qcow2'/>
                        <target dev='vda' bus='virtio'/>
                        <boot order='2'/>
                        <address type='pci' domain='0x0000' bus='0x05' slot='0x00' function='0x0'/>
                    </disk>

                    ${optionalString value.CDROM xml_cdrom} 
                    ${optionalString value.pci1.enable xml_pci1}
                    ${optionalString value.pci2.enable xml_pci2}
                    ${optionalString value.pci3.enable xml_pci3}
                    
                    <graphics type='spice' autoport='yes'>
                         <listen type='address'/>
                         <image compression='off'/>
                    </graphics>

                    <input type="keyboard" bus="usb"/>

                    <interface type="bridge">
                        <source bridge="${value.net1.hostBridge}"/>
                        <mac address="${value.net1.mac}"/>
                        <model type="virtio"/>
                        <address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
                    </interface>

                    ${optionalString value.net2.enable xml_bridge2}
                    ${optionalString value.net3.enable xml_bridge3}
  
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
        }) (filterAttrs (n: v: v.enable ) cfg.guests);
    });

}