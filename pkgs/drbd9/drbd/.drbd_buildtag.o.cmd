savedcmd_/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o := gcc -Wp,-MMD,/home/hernad/nix/kernel/build-drbd/drbd/.drbd_buildtag.o.d -nostdinc -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-headers -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include -I./arch/x86/include/generated -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include -I./include -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi -I./include/generated/uapi -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler-version.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kconfig.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -funsigned-char -std=gnu11 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=16 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-kernel-compat -DCONFIG_DRBD_FAULT_INJECTION  -DMODULE  -DKBUILD_BASENAME='"drbd_buildtag"' -DKBUILD_MODNAME='"drbd"' -D__KBUILD_MODNAME=kmod_drbd -c -o /home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o /home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.c  

source_/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o := /home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.c

deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o := \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_IS_GCC) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler_attributes.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler-gcc.h \
    $(wildcard include/config/RETPOLINE) \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/linux/drbd.h \
  arch/x86/include/generated/uapi/asm/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/int-ll64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/int-ll64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/bitsperlong.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64BIT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/bitsperlong.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stddef.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/stddef.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/posix_types_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/byteorder.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
  arch/x86/include/generated/asm/rwonce.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/rwonce.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/generic.h \
  /home/hernad/nix/kernel/build-drbd/drbd/linux/drbd_config.h \

/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o: $(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o)

$(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_buildtag.o):
