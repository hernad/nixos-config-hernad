savedcmd_/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o := gcc -Wp,-MMD,/home/hernad/nix/kernel/build-drbd/drbd/.drbd_debugfs.o.d -nostdinc -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-headers -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include -I./arch/x86/include/generated -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include -I./include -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi -I./include/generated/uapi -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler-version.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kconfig.h -include /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=/nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -funsigned-char -std=gnu11 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=16 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -I/home/hernad/nix/kernel/build-drbd/drbd -I/home/hernad/nix/kernel/build-drbd/drbd/drbd-kernel-compat -DCONFIG_DRBD_FAULT_INJECTION  -DMODULE  -DKBUILD_BASENAME='"drbd_debugfs"' -DKBUILD_MODNAME='"drbd"' -D__KBUILD_MODNAME=kmod_drbd -c -o /home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o /home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.c  

source_/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o := /home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.c

deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o := \
    $(wildcard include/config/DRBD_TIMING_STATS) \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/MMU) \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stdarg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/align.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/const.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/limits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/limits.h \
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
    $(wildcard include/config/X86_32) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/posix_types_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/posix_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/limits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stringify.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/TRIM_UNUSED_KSYMS) \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/RETHUNK) \
    $(wildcard include/config/SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
    $(wildcard include/config/X86_64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/container_of.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/build_bug.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bitops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/bits.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/typecheck.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/kernel.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sysinfo.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/generic-non-atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/barrier.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/asm.h \
    $(wildcard include/config/KPROBES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/extable_fixup_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/nops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/barrier.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/X86_CMOV) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/rmwcc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/sched.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/arch_hweight.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpufeatures.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/X86_MINIMUM_CPU_FAMILY) \
    $(wildcard include/config/MATH_EMULATION) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/X86_CMPXCHG64) \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/const_hweight.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instrumented.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kmsan-checks.h \
    $(wildcard include/config/KMSAN) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/instrumented-lock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/le.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/byteorder.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/byteorder/little_endian.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/swab.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/byteorder/generic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kstrtox.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/math.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/div64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/div64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/minmax.h \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/init.h \
    $(wildcard include/config/STRICT_KERNEL_RWX) \
    $(wildcard include/config/STRICT_MODULE_RWX) \
    $(wildcard include/config/LTO_CLANG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kern_levels.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ratelimit_types.h \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/once_lite.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dynamic_debug.h \
    $(wildcard include/config/JUMP_LABEL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instruction_pointer.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/module.h \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/ARCH_WANTS_MODULES_DATA_IN_VMALLOC) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/list.h \
    $(wildcard include/config/DEBUG_LIST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stat.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/stat.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/stat.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/math64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/time64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/time64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/time.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/time_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/time32.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/timex.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/timex.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/processor-flags.h \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/math_emu.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/segment.h \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ptrace.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ptrace-abi.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/desc_defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PROC_FS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/DEBUG_ENTRY) \
    $(wildcard include/config/CPU_IBPB_ENTRY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/static_key.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/msr-index.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/unwind_hints.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/orc_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/X86_64_SMP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/current.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/GEN-for-each-reg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/proto.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/ldt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/sigcontext.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpuid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/string.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fortify-string.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/atomic.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cmpxchg.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cmpxchg_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/atomic64_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-long.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/atomic/atomic-instrumented.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/numa.h \
    $(wildcard include/config/NODES_SHIFT) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/frame.h \
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
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/msr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpumask.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/msr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/shared/msr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/tracepoint-defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/special_insns.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/irqflags.h \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/irqflags.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/fpu/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vmxfeatures.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vdso/processor.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/personality.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/personality.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/err.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/tsc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/X86_FEATURE_NAMES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/time32.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/time.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/highuid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/buildid.h \
    $(wildcard include/config/CRASH_CORE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/IOMMU_SVA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/LRU_GEN) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mm_types_task.h \
    $(wildcard include/config/SPLIT_PTLOCK_CPUS) \
    $(wildcard include/config/ARCH_ENABLE_SPLIT_PMD_PTLOCK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/tlbbatch.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/auxvec.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/auxvec.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/auxvec.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kref.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/spinlock.h \
    $(wildcard include/config/PREEMPTION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/preempt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/HARDENED_USERCOPY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/restart_block.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/COMPAT) \
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
  arch/x86/include/generated/asm/mmiowb.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/spinlock_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rwlock_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/spinlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/qspinlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/qspinlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/qrwlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/qrwlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rwlock.h \
    $(wildcard include/config/PREEMPT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/refcount.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcupdate.h \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcutree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/osq_lock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/completion.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/swait.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/wait.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/wait.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/uprobes.h \
    $(wildcard include/config/UPROBES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/uprobes.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/notifier.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mutex.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_MUTEXES) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/debug_locks.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ktime.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/jiffies.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/vdso/ktime.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/clocksource_ids.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcu_segcblist.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/srcutree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/seqlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu_counter.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu.h \
    $(wildcard include/config/NEED_PER_CPU_EMBED_FIRST_CHUNK) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kmod.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/umh.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/gfp.h \
    $(wildcard include/config/HIGHMEM) \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/PM_SLEEP) \
    $(wildcard include/config/CONTIG_ALLOC) \
    $(wildcard include/config/CMA) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/list_nulls.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/nodemask.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/random.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/irqnr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/irqnr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/prandom.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/once.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/page-flags.h \
    $(wildcard include/config/ARCH_USES_PG_UNCACHED) \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_X) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/local_lock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/local_lock_internal.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/memory_hotplug.h \
    $(wildcard include/config/HAVE_ARCH_NODEDATA_EXTENSION) \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mmzone.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mmzone_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/arch_topology.h \
    $(wildcard include/config/ACPI_CPPC_LIB) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/topology.h \
    $(wildcard include/config/SCHED_MC_PRIO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/EISA) \
    $(wildcard include/config/X86_MPPARSE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/mpspec_def.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/x86_init.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/apicdef.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/topology.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sysctl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/elf.h \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/user.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/user_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/fsgsbase.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vdso.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/elf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/elf-em.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sysfs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/idr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/radix-tree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/mm.h \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/CPU_SUP_INTEL) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/ARCH_TASK_STRUCT_ON_STACK) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/DEBUG_RSEQ) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sched.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sem.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sem.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ipc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rhashtable-types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/ipc.h \
  arch/x86/include/generated/uapi/asm/ipcbuf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/ipcbuf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/sembuf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/shm.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/shm.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/hugetlb_encode.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/shmbuf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/shmbuf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/shmparam.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kmsan_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/plist.h \
    $(wildcard include/config/DEBUG_PLIST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/hrtimer_defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/timerqueue.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/seccomp.h \
    $(wildcard include/config/SECCOMP) \
    $(wildcard include/config/HAVE_ARCH_SECCOMP_FILTER) \
    $(wildcard include/config/SECCOMP_FILTER) \
    $(wildcard include/config/CHECKPOINT_RESTORE) \
    $(wildcard include/config/SECCOMP_CACHE_DEBUG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/seccomp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/seccomp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/unistd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/unistd.h \
  arch/x86/include/generated/uapi/asm/unistd_64.h \
  arch/x86/include/generated/asm/unistd_64_x32.h \
  arch/x86/include/generated/asm/unistd_32_ia32.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/ia32_unistd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/seccomp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/unistd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/resource.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/resource.h \
  arch/x86/include/generated/uapi/asm/resource.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/resource.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/resource.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/latencytop.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/prio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/signal.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/signal.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/signal.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/signal-defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/siginfo.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/siginfo.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/syscall_user_dispatch.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/posix-timers.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/rseq.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kcsan.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  arch/x86/include/generated/asm/kmap_size.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/sync_core.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ioasid.h \
    $(wildcard include/config/IOASID) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kobject_ns.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/IA64) \
    $(wildcard include/config/PPC64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rbtree_latch.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/error-injection.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/error-injection.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/module.h \
    $(wildcard include/config/UNWINDER_ORC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
    $(wildcard include/config/MODULES_USE_ELF_REL) \
    $(wildcard include/config/MODULES_USE_ELF_RELA) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/debugfs.h \
    $(wildcard include/config/DEBUG_FS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fs.h \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/wait_bit.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kdev_t.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/kdev_t.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dcache.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rculist_bl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/list_bl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bit_spinlock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/path.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/list_lru.h \
    $(wildcard include/config/MEMCG_KMEM) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/capability.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/capability.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/semaphore.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/fcntl.h \
  arch/x86/include/generated/uapi/asm/fcntl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/fcntl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/openat2.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/migrate_mode.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu-rwsem.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcuwait.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/jobctl.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
    $(wildcard include/config/CC_HAS_ASM_GOTO_TIED_OUTPUT) \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
    $(wildcard include/config/X86_INTEL_USERCOPY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/smap.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/uaccess_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cred.h \
    $(wildcard include/config/DEBUG_CREDENTIALS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ratelimit.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/rcu_sync.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/delayed_call.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/uuid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/uuid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/errseq.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ioprio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/rt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/ioprio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fs_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mount.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mnt_idmapping.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/slab.h \
    $(wildcard include/config/DEBUG_SLAB) \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLAB) \
    $(wildcard include/config/SLUB) \
    $(wildcard include/config/SLOB) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/overflow.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/percpu-refcount.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
    $(wildcard include/config/KASAN_INLINE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kasan-enabled.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/fs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/dqblk_xfs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dqblk_v1.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dqblk_v2.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dqblk_qtree.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/projid.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/quota.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/seq_file.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/string_helpers.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ctype.h \
  include/generated/utsrelease.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_int.h \
    $(wildcard include/config/DRBD_FAULT_INJECTION) \
    $(wildcard include/config/DEV_DAX_PMEM) \
    $(wildcard include/config/LBDAF) \
    $(wildcard include/config/LBD) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/crypto/hash.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/crypto.h \
    $(wildcard include/config/CRYPTO_STATS) \
  include/generated/uapi/linux/version.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/major.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/blkdev.h \
    $(wildcard include/config/BLOCK_HOLDER_DEPRECATED) \
    $(wildcard include/config/BLK_DEV_INTEGRITY) \
    $(wildcard include/config/BLK_DEV_ZONED) \
    $(wildcard include/config/CDROM) \
    $(wildcard include/config/PM) \
    $(wildcard include/config/BLK_INLINE_ENCRYPTION) \
    $(wildcard include/config/BLK_DEV_THROTTLING) \
    $(wildcard include/config/BLK_RQ_ALLOC_TIME) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/blk_types.h \
    $(wildcard include/config/FAIL_MAKE_REQUEST) \
    $(wildcard include/config/BLK_CGROUP_IOCOST) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bvec.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/highmem.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cacheflush.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/cacheflush.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mm.h \
    $(wildcard include/config/HAVE_ARCH_MMAP_RND_BITS) \
    $(wildcard include/config/HAVE_ARCH_MMAP_RND_COMPAT_BITS) \
    $(wildcard include/config/ARCH_USES_HIGH_VMA_FLAGS) \
    $(wildcard include/config/ARCH_HAS_PKEYS) \
    $(wildcard include/config/PPC) \
    $(wildcard include/config/PARISC) \
    $(wildcard include/config/SPARC64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/ARM64_MTE) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_MINOR) \
    $(wildcard include/config/SHMEM) \
    $(wildcard include/config/MIGRATION) \
    $(wildcard include/config/ARCH_HAS_PTE_SPECIAL) \
    $(wildcard include/config/ARCH_HAS_PTE_DEVMAP) \
    $(wildcard include/config/DEBUG_VM_RB) \
    $(wildcard include/config/PAGE_POISONING) \
    $(wildcard include/config/INIT_ON_ALLOC_DEFAULT_ON) \
    $(wildcard include/config/INIT_ON_FREE_DEFAULT_ON) \
    $(wildcard include/config/DEBUG_PAGEALLOC) \
    $(wildcard include/config/ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
    $(wildcard include/config/HUGETLBFS) \
    $(wildcard include/config/MAPPING_DIRTY_HELPERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mmap_lock.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/page_ext.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stacktrace.h \
    $(wildcard include/config/ARCH_STACKWALK) \
    $(wildcard include/config/STACKTRACE) \
    $(wildcard include/config/HAVE_RELIABLE_STACKTRACE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/stackdepot.h \
    $(wildcard include/config/STACKDEPOT_ALWAYS_INIT) \
    $(wildcard include/config/STACKDEPOT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/page_ref.h \
    $(wildcard include/config/DEBUG_PAGE_REF) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sizes.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pgtable.h \
    $(wildcard include/config/HIGHPTE) \
    $(wildcard include/config/ARCH_HAS_NONLEAF_PMD_YOUNG) \
    $(wildcard include/config/GUP_GET_PXX_LOW_HIGH) \
    $(wildcard include/config/HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) \
    $(wildcard include/config/HAVE_ARCH_SOFT_DIRTY) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
    $(wildcard include/config/HAVE_ARCH_HUGE_VMAP) \
    $(wildcard include/config/X86_ESPFIX64) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/DEBUG_WX) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pkru.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/fpu/api.h \
    $(wildcard include/config/X86_DEBUG_FPU) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/coco.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/pgtable_uffd.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/page_table_check.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/PROVIDE_OHCI1394_DMA_INIT) \
    $(wildcard include/config/X86_IO_APIC) \
    $(wildcard include/config/PCI_MMCONFIG) \
    $(wildcard include/config/ACPI_APEI_GHES) \
    $(wildcard include/config/INTEL_TXT) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/uapi/asm/vsyscall.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/fixmap.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable-invert.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/memremap.h \
    $(wildcard include/config/DEVICE_PRIVATE) \
    $(wildcard include/config/PCI_P2PDMA) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ioport.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/huge_mm.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/coredump.h \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/vmstat.h \
    $(wildcard include/config/VM_EVENT_COUNTERS) \
    $(wildcard include/config/DEBUG_TLBFLUSH) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/vm_event_item.h \
    $(wildcard include/config/MEMORY_BALLOON) \
    $(wildcard include/config/BALLOON_COMPACTION) \
    $(wildcard include/config/ZSWAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/cacheflush.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kmsan.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dma-direction.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/hardirq.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/context_tracking_state.h \
    $(wildcard include/config/CONTEXT_TRACKING_USER) \
    $(wildcard include/config/CONTEXT_TRACKING) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ftrace_irq.h \
    $(wildcard include/config/HWLAT_TRACER) \
    $(wildcard include/config/OSNOISE_TRACER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/vtime.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING) \
    $(wildcard include/config/IRQ_TIME_ACCOUNTING) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/hardirq.h \
    $(wildcard include/config/KVM_INTEL) \
    $(wildcard include/config/HAVE_KVM) \
    $(wildcard include/config/X86_THERMAL_VECTOR) \
    $(wildcard include/config/X86_MCE_THRESHOLD) \
    $(wildcard include/config/X86_MCE_AMD) \
    $(wildcard include/config/X86_HV_CALLBACK_VECTOR) \
    $(wildcard include/config/HYPERV) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/highmem-internal.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/device.h \
    $(wildcard include/config/GENERIC_MSI_IRQ) \
    $(wildcard include/config/ENERGY_MODEL) \
    $(wildcard include/config/PINCTRL) \
    $(wildcard include/config/DMA_OPS) \
    $(wildcard include/config/DMA_DECLARE_COHERENT) \
    $(wildcard include/config/DMA_CMA) \
    $(wildcard include/config/SWIOTLB) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_DEVICE) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_CPU) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) \
    $(wildcard include/config/DMA_OPS_BYPASS) \
    $(wildcard include/config/OF) \
    $(wildcard include/config/DEVTMPFS) \
    $(wildcard include/config/SYSFS_DEPRECATED) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dev_printk.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/energy_model.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/cpufreq.h \
    $(wildcard include/config/CPU_FREQ) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/topology.h \
    $(wildcard include/config/SCHED_DEBUG) \
    $(wildcard include/config/SCHED_CLUSTER) \
    $(wildcard include/config/SCHED_MC) \
    $(wildcard include/config/CPU_FREQ_GOV_SCHEDUTIL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/idle.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sched/sd_flags.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/klist.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pm.h \
    $(wildcard include/config/VT_CONSOLE_SLEEP) \
    $(wildcard include/config/CXL_SUSPEND) \
    $(wildcard include/config/PM_CLK) \
    $(wildcard include/config/PM_GENERIC_DOMAINS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/device/bus.h \
    $(wildcard include/config/ACPI) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/device/class.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/device/driver.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/device.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/pm_wakeup.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/mempool.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/uio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/uio.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/blkzoned.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sbitmap.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/backing-dev.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/writeback.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/flex_proportions.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/backing-dev-defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cgroup.h \
    $(wildcard include/config/DEBUG_CGROUP_REF) \
    $(wildcard include/config/CGROUP_CPUACCT) \
    $(wildcard include/config/SOCK_CGROUP_DATA) \
    $(wildcard include/config/CGROUP_DATA) \
    $(wildcard include/config/CGROUP_BPF) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/cgroupstats.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/taskstats.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ns_common.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/nsproxy.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/user_namespace.h \
    $(wildcard include/config/INOTIFY_USER) \
    $(wildcard include/config/FANOTIFY) \
    $(wildcard include/config/PERSISTENT_KEYRINGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kernel_stat.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/interrupt.h \
    $(wildcard include/config/IRQ_FORCED_THREADING) \
    $(wildcard include/config/GENERIC_IRQ_PROBE) \
    $(wildcard include/config/IRQ_TIMINGS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/irqreturn.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/irq.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/irq_vectors.h \
    $(wildcard include/config/PCI_MSI) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/sections.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/sections.h \
    $(wildcard include/config/HAVE_FUNCTION_DESCRIPTORS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cgroup-defs.h \
    $(wildcard include/config/CGROUP_NET_CLASSID) \
    $(wildcard include/config/CGROUP_NET_PRIO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/u64_stats_sync.h \
  arch/x86/include/generated/asm/local64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/local64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/local.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/bpf-cgroup-defs.h \
    $(wildcard include/config/BPF_LSM) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/psi_types.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kthread.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cgroup_subsys.h \
    $(wildcard include/config/CGROUP_DEVICE) \
    $(wildcard include/config/CGROUP_FREEZER) \
    $(wildcard include/config/CGROUP_PERF) \
    $(wildcard include/config/CGROUP_HUGETLB) \
    $(wildcard include/config/CGROUP_PIDS) \
    $(wildcard include/config/CGROUP_RDMA) \
    $(wildcard include/config/CGROUP_MISC) \
    $(wildcard include/config/CGROUP_DEBUG) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/cgroup_refcnt.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/lru_cache.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/prefetch.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/linux/drbd_genl_api.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/linux/drbd.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/linux/genl_magic_struct.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/skbuff.h \
    $(wildcard include/config/NF_CONNTRACK) \
    $(wildcard include/config/BRIDGE_NETFILTER) \
    $(wildcard include/config/NET_TC_SKB_EXT) \
    $(wildcard include/config/NET_SOCK_MSG) \
    $(wildcard include/config/SKB_EXTENSIONS) \
    $(wildcard include/config/NET_CLS_ACT) \
    $(wildcard include/config/IPV6_NDISC_NODETYPE) \
    $(wildcard include/config/NET_SWITCHDEV) \
    $(wildcard include/config/NET_REDIRECT) \
    $(wildcard include/config/NETFILTER_SKIP_EGRESS) \
    $(wildcard include/config/TLS_DEVICE) \
    $(wildcard include/config/NET_SCHED) \
    $(wildcard include/config/NET_RX_BUSY_POLL) \
    $(wildcard include/config/XPS) \
    $(wildcard include/config/NETWORK_SECMARK) \
    $(wildcard include/config/DEBUG_NET) \
    $(wildcard include/config/PAGE_POOL) \
    $(wildcard include/config/HAVE_EFFICIENT_UNALIGNED_ACCESS) \
    $(wildcard include/config/NETWORK_PHY_TIMESTAMPING) \
    $(wildcard include/config/XFRM) \
    $(wildcard include/config/MPTCP) \
    $(wildcard include/config/MCTP_FLOWS) \
    $(wildcard include/config/NETFILTER_XT_TARGET_TRACE) \
    $(wildcard include/config/NF_TABLES) \
    $(wildcard include/config/IP_VS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/socket.h \
  arch/x86/include/generated/uapi/asm/socket.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/socket.h \
  arch/x86/include/generated/uapi/asm/sockios.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/asm-generic/sockios.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/sockios.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/socket.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/checksum.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/checksum.h \
    $(wildcard include/config/GENERIC_CSUM) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/checksum_64.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/dma-mapping.h \
    $(wildcard include/config/DMA_API_DEBUG) \
    $(wildcard include/config/HAS_DMA) \
    $(wildcard include/config/NEED_DMA_MAP_STATE) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/scatterlist.h \
    $(wildcard include/config/NEED_SG_DMA_LENGTH) \
    $(wildcard include/config/DEBUG_SG) \
    $(wildcard include/config/SGL_ALLOC) \
    $(wildcard include/config/ARCH_NO_SG_CHAIN) \
    $(wildcard include/config/SG_POOL) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/io.h \
    $(wildcard include/config/MTRR) \
    $(wildcard include/config/X86_PAT) \
  arch/x86/include/generated/asm/early_ioremap.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/GENERIC_EARLY_IOREMAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/shared/io.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/iomap.h \
    $(wildcard include/config/HAS_IOPORT_MAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/PCI) \
    $(wildcard include/config/NO_GENERIC_PCI_IOPORT_MAP) \
    $(wildcard include/config/GENERIC_PCI_IOMAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/asm-generic/io.h \
    $(wildcard include/config/GENERIC_IOMAP) \
    $(wildcard include/config/TRACE_MMIO_ACCESS) \
    $(wildcard include/config/GENERIC_IOREMAP) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/logic_pio.h \
    $(wildcard include/config/INDIRECT_PIO) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/fwnode.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/vmalloc.h \
    $(wildcard include/config/HAVE_ARCH_HUGE_VMALLOC) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/vmalloc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/arch/x86/include/asm/pgtable_areas.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netdev_features.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/flow_dissector.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/in6.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/in6.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/libc-compat.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/siphash.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/if_ether.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/if_packet.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/flow.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/page_pool.h \
    $(wildcard include/config/PAGE_POOL_STATS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ptr_ring.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netfilter/nf_conntrack_common.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netfilter/nf_conntrack_common.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/net_debug.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/dropreason.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/scm.h \
    $(wildcard include/config/SECURITY_NETWORK) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/net.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/sockptr.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/net.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/security.h \
    $(wildcard include/config/SECURITY_INFINIBAND) \
    $(wildcard include/config/SECURITY_NETWORK_XFRM) \
    $(wildcard include/config/SECURITY_PATH) \
    $(wildcard include/config/SECURITYFS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/kernel_read_file.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/file.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/genetlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/genetlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/genetlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netlink.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/net_namespace.h \
    $(wildcard include/config/NF_FLOW_TABLE) \
    $(wildcard include/config/UNIX) \
    $(wildcard include/config/IPV6) \
    $(wildcard include/config/IEEE802154_6LOWPAN) \
    $(wildcard include/config/IP_SCTP) \
    $(wildcard include/config/NETFILTER) \
    $(wildcard include/config/WEXT_CORE) \
    $(wildcard include/config/MPLS) \
    $(wildcard include/config/CAN) \
    $(wildcard include/config/XDP_SOCKETS) \
    $(wildcard include/config/MCTP) \
    $(wildcard include/config/CRYPTO_USER) \
    $(wildcard include/config/SMC) \
    $(wildcard include/config/NET_NS) \
    $(wildcard include/config/NET_NS_REFCNT_TRACKER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/core.h \
    $(wildcard include/config/RPS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/mib.h \
    $(wildcard include/config/XFRM_STATISTICS) \
    $(wildcard include/config/TLS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/snmp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/snmp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/unix.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/packet.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/ipv4.h \
    $(wildcard include/config/IP_MULTIPLE_TABLES) \
    $(wildcard include/config/IP_ROUTE_CLASSID) \
    $(wildcard include/config/NET_L3_MASTER_DEV) \
    $(wildcard include/config/IP_MROUTE) \
    $(wildcard include/config/IP_MROUTE_MULTIPLE_TABLES) \
    $(wildcard include/config/IP_ROUTE_MULTIPATH) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/inet_frag.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/ipv6.h \
    $(wildcard include/config/IPV6_MULTIPLE_TABLES) \
    $(wildcard include/config/IPV6_SUBTREES) \
    $(wildcard include/config/IPV6_MROUTE) \
    $(wildcard include/config/IPV6_MROUTE_MULTIPLE_TABLES) \
    $(wildcard include/config/NF_DEFRAG_IPV6) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/dst_ops.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/icmpv6.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/nexthop.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/ieee802154_6lowpan.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/sctp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/netfilter.h \
    $(wildcard include/config/NETFILTER_FAMILY_ARP) \
    $(wildcard include/config/NETFILTER_FAMILY_BRIDGE) \
    $(wildcard include/config/NF_DEFRAG_IPV4) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netfilter_defs.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netfilter.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/in.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/in.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/conntrack.h \
    $(wildcard include/config/NF_CT_PROTO_DCCP) \
    $(wildcard include/config/NF_CT_PROTO_SCTP) \
    $(wildcard include/config/NF_CT_PROTO_GRE) \
    $(wildcard include/config/NF_CONNTRACK_EVENTS) \
    $(wildcard include/config/NF_CONNTRACK_LABELS) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netfilter/nf_conntrack_tcp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netfilter/nf_conntrack_tcp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netfilter/nf_conntrack_dccp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netfilter/nf_conntrack_tuple_common.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/netfilter/nf_conntrack_sctp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/netfilter/nf_conntrack_sctp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/flow_table.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/nftables.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/xfrm.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/uapi/linux/xfrm.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/mpls.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/can.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/xdp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/smc.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/bpf.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/netns/mctp.h \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/net/net_trackers.h \
    $(wildcard include/config/NET_DEV_REFCNT_TRACKER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/ref_tracker.h \
    $(wildcard include/config/REF_TRACKER) \
  /nix/store/ydgbh9sb06qr316g0j8flz83jvm2y80l-linux-6.3.7-dev/lib/modules/6.3.7/source/include/linux/seq_file_net.h \
  /home/hernad/nix/kernel/build-drbd/drbd/compat.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/linux/drbd_genl.h \
  /home/hernad/nix/kernel/build-drbd/drbd/linux/drbd_config.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/drbd_strings.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_state.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/drbd_protocol.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_state_change.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_kref_debug.h \
    $(wildcard include/config/KREF_DEBUG) \
  /home/hernad/nix/kernel/build-drbd/drbd/kref_debug.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd-headers/drbd_transport.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_polymorph_printk.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_interval.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_req.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.h \
  /home/hernad/nix/kernel/build-drbd/drbd/drbd_dax_pmem.h \

/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o: $(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o)

$(deps_/home/hernad/nix/kernel/build-drbd/drbd/drbd_debugfs.o):
