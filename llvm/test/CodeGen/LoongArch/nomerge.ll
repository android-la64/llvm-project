; RUN: llc < %s -mtriple=loongarch64 -relocation-model=pic -o - | FileCheck %s

define void @foo(i32 %i) {
entry:
  switch i32 %i, label %if.end3 [
    i32 5, label %if.then
    i32 7, label %if.then2
  ]

if.then:
  tail call void @bar() #0
  br label %if.end3

if.then2:
  tail call void @bar() #0
  br label %if.end3

if.end3:
  tail call void @bar() #0
  ret void
}

declare void @bar()

attributes #0 = { nomerge }

; CHECK-LABEL: foo:
; CHECK: # %bb.0: # %entry
; CHECK: .LBB0_1: # %entry
; CHECK: .LBB0_2: # %if.then
; CHECK-NEXT: bl bar
; CHECK: .LBB0_3: # %if.then2
; CHECK-NEXT: bl bar
; CHECK: .LBB0_4: # %if.end3
; CHECK: b bar
