; Check that we accept functions with '$' in the name.

; RUN: llc -mtriple=loongarch64-unknown-linux < %s | FileCheck %s

define hidden i32 @"_Z54bar$ompvariant$bar"() {
entry:
  ret i32 2
}
