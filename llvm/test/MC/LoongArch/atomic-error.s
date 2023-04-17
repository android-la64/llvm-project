# RUN: not llvm-mc --triple=loongarch64 %s 2>&1 | FileCheck %s

# CHECK: error: expected memory with constant 0 offset
amadd_db.d $a1, $t5, $s6, 1

# CHECK: error: unexpected token in argument list
amadd_db.d $a1, $t5, $s6, a
