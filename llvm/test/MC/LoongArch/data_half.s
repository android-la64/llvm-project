# RUN: llvm-mc --triple=loongarch64 < %s | FileCheck %s

.data

# CHECK:      .half 1
# CHECK-NEXT: .half 65535
.half 0x1
.half 0xffff

# CHECK:      .half 1
# CHECK-NEXT: .half 65535
.2byte 0x1
.2byte 0xffff
