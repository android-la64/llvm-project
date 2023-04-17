; RUN: llc -march=loongarch64 < %s | FileCheck %s

define i32 @foo(i32 signext %a) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    slli.w $r4, $r4, 0
; CHECK-NEXT:    jr $ra
  ret i32 %a
}

define signext i32 @foo1() {
; CHECK-LABEL: foo1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    ori $r4, $zero, 0
; CHECK-NEXT:    ori $r5, $zero, 896
; CHECK-NEXT:    move $r6, $r4
; CHECK-NEXT:  .LBB1_1: # %for.body
; CHECK-NEXT:    # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    add.w $r4, $r4, $r6
; CHECK-NEXT:    addi.w $r6, $r6, 1
; CHECK-NEXT:    bne $r6, $r5, .LBB1_1
; CHECK-NEXT:  # %bb.2: # %for.end
; CHECK-NEXT:    jr $ra
entry:
  br label %for.body

for.body:
  %sum.013 = phi i32 [ 0, %entry ], [ %add, %for.body ]
  %i.010 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %add = add i32 %sum.013, %i.010
  %inc = add nuw nsw i32 %i.010, 1
  %exitcond = icmp eq i32 %inc, 896
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret i32 %add
}
