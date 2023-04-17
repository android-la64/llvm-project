; RUN: llc -mtriple=loongarch64 %s -o - | FileCheck %s

define void @foo() {
;CHECK: .p2align 2
;CHECK: foo:
entry:
  ret void
}
