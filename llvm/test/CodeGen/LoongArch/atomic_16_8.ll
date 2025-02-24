; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=loongarch64 -o - %s | FileCheck %s


define void @umax_8(i8* %ptr) {
; CHECK-LABEL: umax_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB0_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    sltu $r13, $r14, $r5
; CHECK-NEXT:    masknez $r11, $r14, $r13
; CHECK-NEXT:    maskeqz $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB0_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umax i8* %ptr, i8 100 seq_cst
    ret void
}

define void @umax_16(i16* %ptr) {
; CHECK-LABEL: umax_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB1_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    sltu $r13, $r14, $r5
; CHECK-NEXT:    masknez $r11, $r14, $r13
; CHECK-NEXT:    maskeqz $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB1_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umax i16* %ptr, i16 100 seq_cst
    ret void
}

define void @max_8(i8* %ptr) {
; CHECK-LABEL: max_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB2_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    slt $r13, $r14, $r5
; CHECK-NEXT:    masknez $r11, $r14, $r13
; CHECK-NEXT:    maskeqz $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB2_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw max i8* %ptr, i8 100 seq_cst
    ret void
}

define void @max_16(i16* %ptr) {
; CHECK-LABEL: max_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB3_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    slt $r13, $r14, $r5
; CHECK-NEXT:    masknez $r11, $r14, $r13
; CHECK-NEXT:    maskeqz $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB3_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw max i16* %ptr, i16 100 seq_cst
    ret void
}


define void @umin_8(i8* %ptr) {
; CHECK-LABEL: umin_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB4_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    sltu $r13, $r14, $r5
; CHECK-NEXT:    maskeqz $r11, $r14, $r13
; CHECK-NEXT:    masknez $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB4_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umin i8* %ptr, i8 100 seq_cst
    ret void
}

define void @umin_16(i16* %ptr) {
; CHECK-LABEL: umin_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB5_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    sltu $r13, $r14, $r5
; CHECK-NEXT:    maskeqz $r11, $r14, $r13
; CHECK-NEXT:    masknez $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB5_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umin i16* %ptr, i16 100 seq_cst
    ret void
}

define void @min_8(i8* %ptr) {
; CHECK-LABEL: min_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB6_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    slt $r13, $r14, $r5
; CHECK-NEXT:    maskeqz $r11, $r14, $r13
; CHECK-NEXT:    masknez $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB6_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw min i8* %ptr, i8 100 seq_cst
    ret void
}

define void @min_16(i16* %ptr) {
; CHECK-LABEL: min_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB7_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r14, $r10, $r7
; CHECK-NEXT:    and $r5, $r5, $r7
; CHECK-NEXT:    slt $r13, $r14, $r5
; CHECK-NEXT:    maskeqz $r11, $r14, $r13
; CHECK-NEXT:    masknez $r13, $r5, $r13
; CHECK-NEXT:    or $r11, $r11, $r13
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB7_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw min i16* %ptr, i16 100 seq_cst
    ret void
}


define void @or_8(i8* %ptr) {
; CHECK-LABEL: or_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB8_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    or $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB8_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw or i8* %ptr, i8 100 seq_cst
    ret void
}

define void @or_16(i16* %ptr) {
; CHECK-LABEL: or_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB9_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    or $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB9_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw or i16* %ptr, i16 100 seq_cst
    ret void
}


define void @add_8(i8* %ptr) {
; CHECK-LABEL: add_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB10_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    add.w $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB10_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw add i8* %ptr, i8 100 seq_cst
    ret void
}

define void @add_16(i16* %ptr) {
; CHECK-LABEL: add_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB11_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    add.w $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB11_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw add i16* %ptr, i16 100 seq_cst
    ret void
}


define void @sub_8(i8* %ptr) {
; CHECK-LABEL: sub_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB12_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    sub.w $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB12_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw sub i8* %ptr, i8 100 seq_cst
    ret void
}

define void @sub_16(i16* %ptr) {
; CHECK-LABEL: sub_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB13_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    sub.w $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB13_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw sub i16* %ptr, i16 100 seq_cst
    ret void
}


define void @and_8(i8* %ptr) {
; CHECK-LABEL: and_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB14_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB14_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw and i8* %ptr, i8 100 seq_cst
    ret void
}

define void @and_16(i16* %ptr) {
; CHECK-LABEL: and_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB15_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB15_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw and i16* %ptr, i16 100 seq_cst
    ret void
}


define void @nand_8(i8* %ptr) {
; CHECK-LABEL: nand_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB16_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r10, $r5
; CHECK-NEXT:    nor $r11, $zero, $r11
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB16_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw nand i8* %ptr, i8 100 seq_cst
    ret void
}

define void @nand_16(i16* %ptr) {
; CHECK-LABEL: nand_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB17_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r10, $r5
; CHECK-NEXT:    nor $r11, $zero, $r11
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB17_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw nand i16* %ptr, i16 100 seq_cst
    ret void
}


define void @xor_8(i8* %ptr) {
; CHECK-LABEL: xor_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB18_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    xor $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB18_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xor i8* %ptr, i8 100 seq_cst
    ret void
}

define void @xor_16(i16* %ptr) {
; CHECK-LABEL: xor_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB19_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    xor $r11, $r10, $r5
; CHECK-NEXT:    and $r11, $r11, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB19_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xor i16* %ptr, i16 100 seq_cst
    ret void
}


define void @xchg_8(i8* %ptr) {
; CHECK-LABEL: xchg_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r7, $zero, 255
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB20_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r5, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB20_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.b $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xchg i8* %ptr, i8 100 seq_cst
    ret void
}

define void @xchg_16(i16* %ptr) {
; CHECK-LABEL: xchg_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:    addi.d $r6, $zero, -4
; CHECK-NEXT:    and $r6, $r4, $r6
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r7, 15
; CHECK-NEXT:    ori $r7, $r7, 4095
; CHECK-NEXT:    sll.w $r7, $r7, $r4
; CHECK-NEXT:    nor $r8, $zero, $r7
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB21_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r10, $r6, 0
; CHECK-NEXT:    and $r11, $r5, $r7
; CHECK-NEXT:    and $r12, $r10, $r8
; CHECK-NEXT:    or $r12, $r12, $r11
; CHECK-NEXT:    sc.w $r12, $r6, 0
; CHECK-NEXT:    beq $r12, $zero, .LBB21_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    and $r9, $r10, $r7
; CHECK-NEXT:    srl.w $r9, $r9, $r4
; CHECK-NEXT:    ext.w.h $r9, $r9
; CHECK-NEXT:  # %bb.3:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xchg i16* %ptr, i16 100 seq_cst
    ret void
}

define void @cmpxchg_8(i8* %ptr) {
; CHECK-LABEL: cmpxchg_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 1
; CHECK-NEXT:    ori $r6, $zero, 100
; CHECK-NEXT:    addi.d $r7, $zero, -4
; CHECK-NEXT:    and $r7, $r4, $r7
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    ori $r8, $zero, 255
; CHECK-NEXT:    sll.w $r8, $r8, $r4
; CHECK-NEXT:    nor $r9, $zero, $r8
; CHECK-NEXT:    andi $r6, $r6, 255
; CHECK-NEXT:    sll.w $r6, $r6, $r4
; CHECK-NEXT:    andi $r5, $r5, 255
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB22_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r11, $r7, 0
; CHECK-NEXT:    and $r12, $r11, $r8
; CHECK-NEXT:    bne $r12, $r6, .LBB22_3
; CHECK-NEXT:  # %bb.2: # in Loop: Header=BB22_1 Depth=1
; CHECK-NEXT:    and $r11, $r11, $r9
; CHECK-NEXT:    or $r11, $r11, $r5
; CHECK-NEXT:    sc.w $r11, $r7, 0
; CHECK-NEXT:    beq $r11, $zero, .LBB22_1
; CHECK-NEXT:  .LBB22_3:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    srl.w $r10, $r12, $r4
; CHECK-NEXT:    ext.w.b $r10, $r10
; CHECK-NEXT:  # %bb.4:
; CHECK-NEXT:    jr $ra
    %ret = cmpxchg i8* %ptr, i8 100, i8 1 seq_cst seq_cst
    ret void
}

define void @cmpxchg_16(i16* %ptr) {
; CHECK-LABEL: cmpxchg_16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 1
; CHECK-NEXT:    ori $r6, $zero, 100
; CHECK-NEXT:    addi.d $r7, $zero, -4
; CHECK-NEXT:    and $r7, $r4, $r7
; CHECK-NEXT:    andi $r4, $r4, 3
; CHECK-NEXT:    slli.w $r4, $r4, 3
; CHECK-NEXT:    lu12i.w $r8, 15
; CHECK-NEXT:    ori $r8, $r8, 4095
; CHECK-NEXT:    sll.w $r9, $r8, $r4
; CHECK-NEXT:    nor $r10, $zero, $r9
; CHECK-NEXT:    and $r6, $r6, $r8
; CHECK-NEXT:    sll.w $r6, $r6, $r4
; CHECK-NEXT:    and $r5, $r5, $r8
; CHECK-NEXT:    sll.w $r5, $r5, $r4
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB23_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r11, $r7, 0
; CHECK-NEXT:    and $r12, $r11, $r9
; CHECK-NEXT:    bne $r12, $r6, .LBB23_3
; CHECK-NEXT:  # %bb.2: # in Loop: Header=BB23_1 Depth=1
; CHECK-NEXT:    and $r11, $r11, $r10
; CHECK-NEXT:    or $r11, $r11, $r5
; CHECK-NEXT:    sc.w $r11, $r7, 0
; CHECK-NEXT:    beq $r11, $zero, .LBB23_1
; CHECK-NEXT:  .LBB23_3:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    srl.w $r8, $r12, $r4
; CHECK-NEXT:    ext.w.h $r8, $r8
; CHECK-NEXT:  # %bb.4:
; CHECK-NEXT:    jr $ra
    %ret = cmpxchg i16* %ptr, i16 100, i16 1 seq_cst seq_cst
    ret void
}
