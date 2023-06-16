savedcmd_/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o := gcc -Wp,-MMD,/home/hernad/nix/kernel/build-drbd/drbd/.drbd_interval.o.d -nostdinc -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-headers -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include -I./arch/x86/include/generated -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include -I./include -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi -I./include/generated/uapi -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler-version.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kconfig.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -funsigned-char -std=gnu11 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=16 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-kernel-compat -DCONFIG_DRBD_FAULT_INJECTION  -DMODULE  -DKBUILD_BASENAME='"drbd_interval"' -DKBUILD_MODNAME='"drbd"' -D__KBUILD_MODNAME=kmod_drbd -c -o /home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o /home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.c  

source_/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o := /home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.c

deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o := \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/bug.h \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/X86_32) \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stringify.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/objtool.h \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/FRAME_POINTER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/types.h \
  arch/x86/include/generated/uapi/asm/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/int-ll64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/int-ll64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/bitsperlong.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitsperlong.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/bitsperlong.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stddef.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/stddef.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/posix_types_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/asm.h \
    $(wildcard include/config/KPROBES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/extable_fixup_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
    $(wildcard include/config/SMP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
  arch/x86/include/generated/asm/rwonce.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/rwonce.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/once_lite.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stdarg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/init.h \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
    $(wildcard include/config/STRICT_KERNEL_RWX) \
    $(wildcard include/config/STRICT_MODULE_RWX) \
    $(wildcard include/config/LTO_CLANG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/build_bug.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kern_levels.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/TRIM_UNUSED_KSYMS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/RETHUNK) \
    $(wildcard include/config/SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
    $(wildcard include/config/X86_64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ratelimit_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/bits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/param.h \
  arch/x86/include/generated/uapi/asm/param.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/param.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/spinlock_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/qrwlock_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/byteorder.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/generic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dynamic_debug.h \
    $(wildcard include/config/JUMP_LABEL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/nops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree_augmented.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/container_of.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcupdate.h \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cmpxchg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpufeatures.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/X86_MINIMUM_CPU_FAMILY) \
    $(wildcard include/config/MATH_EMULATION) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/X86_CMPXCHG64) \
    $(wildcard include/config/X86_CMOV) \
    $(wildcard include/config/X86_P6_NOP) \
    $(wildcard include/config/MATOM) \
    $(wildcard include/config/PARAVIRT_XXL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/X86_UMIP) \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_5LEVEL) \
    $(wildcard include/config/PAGE_TABLE_ISOLATION) \
    $(wildcard include/config/CPU_UNRET_ENTRY) \
    $(wildcard include/config/CALL_DEPTH_TRACKING) \
    $(wildcard include/config/INTEL_IOMMU_SVM) \
    $(wildcard include/config/X86_SGX) \
    $(wildcard include/config/XEN_PV) \
    $(wildcard include/config/INTEL_TDX_GUEST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cmpxchg_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/rmwcc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/barrier.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/barrier.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/atomic64_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-long.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-instrumented.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instrumented.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kmsan-checks.h \
    $(wildcard include/config/KMSAN) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/typecheck.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/VM86) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/processor-flags.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mem_encrypt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/bootparam.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/screen_info.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/screen_info.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/apm_bios.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/apm_bios.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/ioctl.h \
  arch/x86/include/generated/uapi/asm/ioctl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/ioctl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/ioctl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/edd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/edd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ist.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ist.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/video/edid.h \
    $(wildcard include/config/X86) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/video/edid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/CPU_IBPB_ENTRY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/static_key.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/msr-index.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/unwind_hints.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/orc_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/X86_64_SMP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/align.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/limits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/limits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/limits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bitops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/kernel.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sysinfo.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/generic-non-atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/bitops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/sched.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/arch_hweight.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/const_hweight.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-lock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/le.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kstrtox.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/math.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/div64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/div64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/minmax.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instruction_pointer.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/current.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/GEN-for-each-reg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/segment.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/PGTABLE_LEVELS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/desc_defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PROC_FS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/DYNAMIC_MEMORY_LAYOUT) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bitmap.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/find.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/errno.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/errno.h \
  arch/x86/include/generated/uapi/asm/errno.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/errno.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/errno-base.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/string.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/string.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fortify-string.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/numa.h \
    $(wildcard include/config/NODES_SHIFT) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/frame.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/list.h \
    $(wildcard include/config/DEBUG_LIST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/preempt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/HARDENED_USERCOPY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/restart_block.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/time64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/math64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/time64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/time.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/time_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/COMPAT) \
    $(wildcard include/config/IA32_EMULATION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/page.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/range.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pfn.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/getorder.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/X86_FEATURE_NAMES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/math_emu.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ptrace.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ptrace.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ptrace-abi.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/proto.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ldt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/sigcontext.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpuid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/msr.h \
    $(wildcard include/config/TRACEPOINTS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpumask.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/msr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/shared/msr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/tracepoint-defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/special_insns.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/fpu/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vmxfeatures.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vdso/processor.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/personality.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/personality.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/err.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bottom_half.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/smp_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/smp.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/DEBUG_NMI_SELFTEST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcutree.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.h \

/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o: $(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o)

$(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.o):
