# REQUIRES: loongarch
# RUN: llvm-mc -filetype=obj -triple=loongarch64 %s -o %t.o
# RUN: ld.lld -pie %t.o -o %t
# RUN: llvm-readobj -r -x .got.plt %t | FileCheck --check-prefix=RELOC %s
# RUN: llvm-readelf -s %t | FileCheck --check-prefix=SYM %s
# RUN: llvm-objdump -d --no-show-raw-insn %t | FileCheck --check-prefix=DIS %s

# RELOC:      .rela.dyn {
# RELOC-NEXT:   0x30390 R_LARCH_IRELATIVE - 0x10260
# RELOC-NEXT: }
# RELOC:       Hex dump of section '.got.plt':
# RELOC-NEXT:  0x00030390 00000000 00000000

# SYM: 0000000000010260 0 IFUNC GLOBAL DEFAULT {{.*}} ifunc

# DIS:      <ifunc>:
# DIS-NEXT: 10260: jirl $zero, $ra, 0
# DIS:      <_start>:
# DIS-NEXT: 10264: bl 12
# DIS:      Disassembly of section .iplt:
# DIS:      <.iplt>:
# DIS-NEXT: 10270: pcaddu12i $r15, 32
# DIS-NEXT:        ld.d $r15, $r15, 288
# DIS-NEXT:        pcaddu12i $r13, 0
# DIS-NEXT:        jirl $zero, $r15, 0

.text
.globl ifunc
.type ifunc, @gnu_indirect_function
ifunc:
  jr $ra

.globl _start
_start:
  bl ifunc
