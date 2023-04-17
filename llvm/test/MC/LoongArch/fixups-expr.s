# RUN: llvm-mc --filetype=obj --triple=loongarch64 %s \
# RUN:     | llvm-readobj -r - | FileCheck %s

# Check that subtraction expressions are emitted as two relocations

.globl G1
.globl G2
.L1:
G1:
nop
.L2:
G2:

.data
.8byte .L2-.L1   # CHECK: 0x0 R_LARCH_ADD64 .L2 0x0
                 # CHECK: 0x0 R_LARCH_SUB64 .L1 0x0
.8byte G2-G1     # CHECK: 0x8 R_LARCH_ADD64 G2 0x0
                 # CHECK: 0x8 R_LARCH_SUB64 G1 0x0
.4byte .L2-.L1   # CHECK: 0x10 R_LARCH_ADD32 .L2 0x0
                 # CHECK: 0x10 R_LARCH_SUB32 .L1 0x0
.4byte G2-G1     # CHECK: 0x14 R_LARCH_ADD32 G2 0x0
                 # CHECK: 0x14 R_LARCH_SUB32 G1 0x0
.2byte .L2-.L1   # CHECK: 0x18 R_LARCH_ADD16 .L2 0x0
                 # CHECK: 0x18 R_LARCH_SUB16 .L1 0x0
.2byte G2-G1     # CHECK: 0x1A R_LARCH_ADD16 G2 0x0
                 # CHECK: 0x1A R_LARCH_SUB16 G1 0x0
.byte .L2-.L1    # CHECK: 0x1C R_LARCH_ADD8 .L2 0x0
                 # CHECK: 0x1C R_LARCH_SUB8 .L1 0x0
.byte G2-G1      # CHECK: 0x1D R_LARCH_ADD8 G2 0x0
                 # CHECK: 0x1D R_LARCH_SUB8 G1 0x0

.section .rodata.str.1
.L.str:
.asciz "string"

.rodata
.Lreltable:
.word .L.str-.Lreltable # CHECK: 0x0 R_LARCH_ADD32 .L.str 0x0
                        # CHECK: 0x0 R_LARCH_SUB32 .Lreltable 0x0

