; RUN: llc -march=loongarch64 < %s | FileCheck %s

define signext i32 @foo(i32 %a) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    slli.w $r4, $r4, 0
; CHECK-NEXT:    bstrpick.d $r4, $r4, 31, 1
; CHECK-NEXT:    jr $ra
entry:
  %b = lshr i32 %a, 1
  ret i32 %b
}
