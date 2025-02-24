; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=loongarch64 -o - %s | FileCheck %s


define void @umax_32(i32* %ptr) {
; CHECK-LABEL: umax_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB0_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammax_db.wu $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umax i32* %ptr, i32 100 seq_cst
    ret void
}

define void @umax_64(i64* %ptr) {
; CHECK-LABEL: umax_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB1_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammax_db.du $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umax i64* %ptr, i64 100 seq_cst
    ret void
}

define void @max_32(i32* %ptr) {
; CHECK-LABEL: max_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB2_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammax_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw max i32* %ptr, i32 100 seq_cst
    ret void
}

define void @max_64(i64* %ptr) {
; CHECK-LABEL: max_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB3_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammax_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw max i64* %ptr, i64 100 seq_cst
    ret void
}


define void @umin_32(i32* %ptr) {
; CHECK-LABEL: umin_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB4_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammin_db.wu $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umin i32* %ptr, i32 100 seq_cst
    ret void
}

define void @umin_64(i64* %ptr) {
; CHECK-LABEL: umin_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB5_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammin_db.du $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw umin i64* %ptr, i64 100 seq_cst
    ret void
}

define void @min_32(i32* %ptr) {
; CHECK-LABEL: min_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB6_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammin_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw min i32* %ptr, i32 100 seq_cst
    ret void
}

define void @min_64(i64* %ptr) {
; CHECK-LABEL: min_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB7_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ammin_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw min i64* %ptr, i64 100 seq_cst
    ret void
}


define void @or_32(i32* %ptr) {
; CHECK-LABEL: or_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB8_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amor_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw or i32* %ptr, i32 100 seq_cst
    ret void
}

define void @or_64(i64* %ptr) {
; CHECK-LABEL: or_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB9_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amor_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw or i64* %ptr, i64 100 seq_cst
    ret void
}


define void @add_32(i32* %ptr) {
; CHECK-LABEL: add_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB10_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amadd_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw add i32* %ptr, i32 100 seq_cst
    ret void
}

define void @add_64(i64* %ptr) {
; CHECK-LABEL: add_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB11_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amadd_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw add i64* %ptr, i64 100 seq_cst
    ret void
}


define void @sub_32(i32* %ptr) {
; CHECK-LABEL: sub_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB12_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sub.w $r7, $zero, $r5
; CHECK-NEXT:    amadd_db.w $r6, $r7, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw sub i32* %ptr, i32 100 seq_cst
    ret void
}

define void @sub_64(i64* %ptr) {
; CHECK-LABEL: sub_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB13_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sub.d $r7, $zero, $r5
; CHECK-NEXT:    amadd_db.d $r6, $r7, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw sub i64* %ptr, i64 100 seq_cst
    ret void
}


define void @and_32(i32* %ptr) {
; CHECK-LABEL: and_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB14_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amand_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw and i32* %ptr, i32 100 seq_cst
    ret void
}

define void @and_64(i64* %ptr) {
; CHECK-LABEL: and_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB15_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amand_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw and i64* %ptr, i64 100 seq_cst
    ret void
}


define void @nand_32(i32* %ptr) {
; CHECK-LABEL: nand_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB16_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r6, $r4, 0
; CHECK-NEXT:    and $r7, $r6, $r5
; CHECK-NEXT:    nor $r7, $zero, $r7
; CHECK-NEXT:    sc.w $r7, $r4, 0
; CHECK-NEXT:    beq $r7, $zero, .LBB16_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw nand i32* %ptr, i32 100 seq_cst
    ret void
}

define void @nand_64(i64* %ptr) {
; CHECK-LABEL: nand_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB17_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.d $r6, $r4, 0
; CHECK-NEXT:    and $r7, $r6, $r5
; CHECK-NEXT:    nor $r7, $zero, $r7
; CHECK-NEXT:    sc.d $r7, $r4, 0
; CHECK-NEXT:    beq $r7, $zero, .LBB17_1
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw nand i64* %ptr, i64 100 seq_cst
    ret void
}


define void @xor_32(i32* %ptr) {
; CHECK-LABEL: xor_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB18_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amxor_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xor i32* %ptr, i32 100 seq_cst
    ret void
}

define void @xor_64(i64* %ptr) {
; CHECK-LABEL: xor_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB19_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amxor_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xor i64* %ptr, i64 100 seq_cst
    ret void
}


define void @xchg_32(i32* %ptr) {
; CHECK-LABEL: xchg_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 100
; CHECK-NEXT:  .LBB20_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amswap_db.w $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xchg i32* %ptr, i32 100 seq_cst
    ret void
}

define void @xchg_64(i64* %ptr) {
; CHECK-LABEL: xchg_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 100
; CHECK-NEXT:  .LBB21_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    amswap_db.d $r6, $r5, $r4, 0
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    jr $ra
    %ret = atomicrmw xchg i64* %ptr, i64 100 seq_cst
    ret void
}

define void @cmpxchg_32(i32* %ptr) {
; CHECK-LABEL: cmpxchg_32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori $r5, $zero, 1
; CHECK-NEXT:    ori $r6, $zero, 100
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB22_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.w $r7, $r4, 0
; CHECK-NEXT:    bne $r7, $r6, .LBB22_3
; CHECK-NEXT:  # %bb.2: # in Loop: Header=BB22_1 Depth=1
; CHECK-NEXT:    move $r8, $r5
; CHECK-NEXT:    sc.w $r8, $r4, 0
; CHECK-NEXT:    beq $r8, $zero, .LBB22_1
; CHECK-NEXT:  .LBB22_3:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    jr $ra
    %ret = cmpxchg i32* %ptr, i32 100, i32 1 seq_cst seq_cst
    ret void
}

define void @cmpxchg_64(i64* %ptr) {
; CHECK-LABEL: cmpxchg_64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi.d $r5, $zero, 1
; CHECK-NEXT:    addi.d $r6, $zero, 100
; CHECK-NEXT:    dbar 0
; CHECK-NEXT:  .LBB23_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    ll.d $r7, $r4, 0
; CHECK-NEXT:    bne $r7, $r6, .LBB23_3
; CHECK-NEXT:  # %bb.2: # in Loop: Header=BB23_1 Depth=1
; CHECK-NEXT:    move $r8, $r5
; CHECK-NEXT:    sc.d $r8, $r4, 0
; CHECK-NEXT:    beq $r8, $zero, .LBB23_1
; CHECK-NEXT:  .LBB23_3:
; CHECK-NEXT:    dbar 1792
; CHECK-NEXT:    jr $ra
    %ret = cmpxchg i64* %ptr, i64 100, i64 1 seq_cst seq_cst
    ret void
}
