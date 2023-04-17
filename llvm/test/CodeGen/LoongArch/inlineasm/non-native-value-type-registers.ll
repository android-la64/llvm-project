; RUN: llc -march=loongarch64 -o - %s 2>&1 | FileCheck %s

;; Test that non native value types can be parsed.

define void @test_i1() {
; CHECK-LABEL: test_i1:
; CHECK:    ori $r6, $zero, 0
; CHECK:    jr $ra
start:
  call void asm "", "{$r6}"(i1 0)
  ret void
}

;; Note: non-simple values like `i3` are only allowed in newer llvm versions (>= 12).
;; In older llvm versions (<= 11), SelectionDAGBuilder::visitInlineAsm asserts simple
;; values must be used. For details, please see https://reviews.llvm.org/D91710.
define void @test_i3() {
; CHECK-LABEL: test_i3:
; CHECK:    ori $r7, $zero, 0
; CHECK:    jr $ra
start:
  call void asm "", "{$r7}"(i3 0)
  ret void
}

define void @test_i8() {
; CHECK-LABEL: test_i8:
; CHECK:    ori $r5, $zero, 0
; CHECK:    jr $ra
start:
  call void asm "", "{$r5}"(i8 0)
  ret void
}

define void @test_i16() {
; CHECK-LABEL: test_i16:
; CHECK:    ori $r20, $zero, 5
; CHECK:    jr $ra
start:
  call void asm "", "{$r20}"(i16 5)
  ret void
}
