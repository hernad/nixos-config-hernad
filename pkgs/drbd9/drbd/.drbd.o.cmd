savedcmd_/home/hernad/nix/kernel/build-drbd/drbd/drbd.o := ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments   -r -o /home/hernad/nix/kernel/build-drbd/drbd/drbd.o @/home/hernad/nix/kernel/build-drbd/drbd/drbd.mod  ; ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module /home/hernad/nix/kernel/build-drbd/drbd/drbd.o

/home/hernad/nix/kernel/build-drbd/drbd/drbd.o: $(wildcard ./tools/objtool/objtool)
