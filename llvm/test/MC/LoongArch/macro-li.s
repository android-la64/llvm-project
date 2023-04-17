# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu | FileCheck %s
li.w $a0, 0x00000000    # CHECK: ori $r4, $zero, 0
li.w $a0, 0x000007ff    # CHECK: ori $r4, $zero, 2047
li.w $a0, 0x00000800    # CHECK: ori $r4, $zero, 2048
li.w $a0, 0x00000fff    # CHECK: ori $r4, $zero, 4095
li.w $a0, 0x7ffff000    # CHECK: lu12i.w $r4, 524287
li.w $a0, 0x7ffff7ff    # CHECK: lu12i.w $r4, 524287
                        # CHECK: ori $r4, $r4, 2047
li.w $a0, 0x7ffff800    # CHECK: lu12i.w $r4, 524287
                        # CHECK: ori $r4, $r4, 2048
li.w $a0, 0x7fffffff    # CHECK: lu12i.w $r4, 524287
                        # CHECK: ori $r4, $r4, 4095
li.w $a0, 0x80000000    # CHECK: lu12i.w $r4, -524288
li.w $a0, 0x800007ff    # CHECK: lu12i.w $r4, -524288
                        # CHECK: ori $r4, $r4, 2047
li.w $a0, 0x80000800    # CHECK: lu12i.w $r4, -524288
                        # CHECK: ori $r4, $r4, 2048
li.w $a0, 0x80000fff    # CHECK: lu12i.w $r4, -524288
                        # CHECK: ori $r4, $r4, 4095
li.w $a0, 0xfffff000    # CHECK: lu12i.w $r4, -1
li.w $a0, 0xfffff7ff    # CHECK: lu12i.w $r4, -1
                        # CHECK: ori $r4, $r4, 2047
li.w $a0, 0xfffff800    # CHECK: addi.w $r4, $zero, -2048
li.w $a0, 0xffffffff    # CHECK: addi.w $r4, $zero, -1
li.d $a0, 0x0000000000000000    # CHECK: addi.d $r4, $zero, 0
li.d $a0, 0x00000000000007ff    # CHECK: addi.d $r4, $zero, 2047
li.d $a0, 0x0000000000000800    # CHECK: ori $r4, $zero, 2048
li.d $a0, 0x0000000000000fff    # CHECK: ori $r4, $zero, 4095
li.d $a0, 0x000000007ffff000    # CHECK: lu12i.w $r4, 524287
li.d $a0, 0x000000007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
li.d $a0, 0x000000007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
li.d $a0, 0x000000007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
li.d $a0, 0x0000000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x00000000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x0000000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x0000000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x00000000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x00000000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x00000000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x00000000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 0
li.d $a0, 0x0007ffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007fffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007fffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007fffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0007ffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 524287
li.d $a0, 0x0008000000000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x0008000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x0008000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000800007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000800007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000800007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000800007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x0008000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x0008000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x0008000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x00080000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000ffffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000ffffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000ffffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x000fffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu52i.d $r4, $r4, 0
li.d $a0, 0x7ff0000000000000    # CHECK: lu52i.d $r4, $zero, 2047
li.d $a0, 0x7ff00000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff0000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff0000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff000007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff000007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff000007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff000007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff0000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff00000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff0000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff0000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff00000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff00000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff00000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff00000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7fffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7fffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7fffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff7ffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000000000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff800007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff800007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff800007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff800007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff8000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ff80000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ffffffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ffffffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7ffffffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x7fffffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu52i.d $r4, $r4, 2047
li.d $a0, 0x8000000000000000    # CHECK: lu52i.d $r4, $zero, -2048
li.d $a0, 0x80000000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8000000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8000000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800000007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800000007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800000007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800000007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8000000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80000000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8000000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8000000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80000000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80000000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80000000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80000000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007fffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007fffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007fffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8007ffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000000000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800800007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800800007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800800007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800800007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x8008000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x80080000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800ffffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800ffffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800ffffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0x800fffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu52i.d $r4, $r4, -2048
li.d $a0, 0xfff0000000000000    # CHECK: lu52i.d $r4, $zero, -1
li.d $a0, 0xfff00000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff0000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff0000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff000007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff000007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff000007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff000007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff0000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff00000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff0000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff0000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff00000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff00000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff00000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff00000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 0
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff80000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7fffffffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7fffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7fffffffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff7ffffffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, 524287
                                # CHECK: lu52i.d $r4, $r4, -1
li.d $a0, 0xfff8000000000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff8000000000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff8000000000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff800007ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff800007ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff800007ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff800007fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff8000080000000    # CHECK: lu12i.w $r4, -524288
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff8000080000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff8000080000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000fffff000    # CHECK: lu12i.w $r4, -1
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000fffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000fffff800    # CHECK: addi.w $r4, $zero, -2048
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xfff80000ffffffff    # CHECK: addi.w $r4, $zero, -1
                                # CHECK: lu32i.d $r4, -524288
li.d $a0, 0xffffffff00000000    # CHECK: ori $r4, $zero, 0
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff000007ff    # CHECK: ori $r4, $zero, 2047
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff00000800    # CHECK: ori $r4, $zero, 2048
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff00000fff    # CHECK: ori $r4, $zero, 4095
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff7ffff000    # CHECK: lu12i.w $r4, 524287
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff7ffff7ff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2047
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff7ffff800    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 2048
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff7fffffff    # CHECK: lu12i.w $r4, 524287
                                # CHECK: ori $r4, $r4, 4095
                                # CHECK: lu32i.d $r4, -1
li.d $a0, 0xffffffff80000000    # CHECK: lu12i.w $r4, -524288
li.d $a0, 0xffffffff800007ff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2047
li.d $a0, 0xffffffff80000800    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 2048
li.d $a0, 0xffffffff80000fff    # CHECK: lu12i.w $r4, -524288
                                # CHECK: ori $r4, $r4, 4095
li.d $a0, 0xfffffffffffff000    # CHECK: lu12i.w $r4, -1
li.d $a0, 0xfffffffffffff7ff    # CHECK: lu12i.w $r4, -1
                                # CHECK: ori $r4, $r4, 2047
li.d $a0, 0xfffffffffffff800    # CHECK: addi.d $r4, $zero, -2048
li.d $a0, 0xffffffffffffffff    # CHECK: addi.d $r4, $zero, -1
