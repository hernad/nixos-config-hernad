{config, pkgs, lib, ...}:

# https://discourse.nixos.org/t/how-to-start-a-daemon-properly-in-nixos/14019

# https://nixos.wiki/wiki/NixOps/Virtualization

# https://gist.github.com/dejanr/7fba2c6c4df6482307e8bb46cb2ad8a8


# pogledati ovo!
# https://ww.telent.net/2017/10/20/nixos_again_declarative_vms_with_qemu
# https://github.com/telent/nixos-configs

# https://ww.telent.net/2023/6/2/turning_the_nftables
let
  cfg = config.libvirtGuests;

in {


   options = {
     libvirtGuests = {
      enable = mkEnableOption "libvirtGuests enable";
      guests = mkOption {
        type = types.listOf types.attrs;
        default = [];
      };
      hostNic = mkOption {
        description = "host nic virtual machine";
        type = types.str;
      };

     }

   };


    config = (mkIf cfg.enable {
        systemd.services = lib.mapAttrs' (name: guest: lib.nameValuePair "libvirtd-guest-${name}" {
        after = [ "libvirtd.service" ];
        requires = [ "libvirtd.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = "yes";
        };
        script =
            let
            xml = pkgs.writeText "libvirt-guest-${name}.xml"
                ''
                <domain type="kvm">
                    <name>${name}</name>
                    <uuid>UUID</uuid>
                    <os>
                    <type>hvm</type>
                    </os>
                    <memory unit="GiB">${guest.memory}</memory>
                    <devices>
                    <disk type="volume">
                        <source volume="guest-${name}"/>
                        <target dev="vda" bus="virtio"/>
                    </disk>
                    <graphics type="spice" autoport="yes"/>
                    <input type="keyboard" bus="usb"/>
                    <interface type="direct">
                        <source dev="${hostNic}" mode="bridge"/>
                        <mac address="${guest.mac}"/>
                        <model type="virtio"/>
                    </interface>
                    </devices>
                    <features>
                    <acpi/>
                    </features>
                </domain>
                '';
            in
            ''
                uuid="$(${pkgs.libvirt}/bin/virsh domuuid '${name}' || true)"
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
        }) guests;
    });

}