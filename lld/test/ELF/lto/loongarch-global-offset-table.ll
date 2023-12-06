; REQUIRES: loongarch

; RUN: llvm-as %s -o %t.o
; RUN: not ld.lld %t.o -shared -o %t.so --no-undefined 2>&1 | FileCheck %s

;; Check that the linker reserved symbol `_GLOBAL_OFFSET_TABLE_` is created when LTO.

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
target triple = "loongarch64-unknown-elf"

@g = global i32 1

define i32 @foo() {
  %res = load i32, ptr @g
  ret i32 %res
}

;; FIXME: Currently below error is reported.
; CHECK: ld.lld: error: undefined symbol: _GLOBAL_OFFSET_TABLE_
; CHECK: >>> referenced by ld-temp.o
; CHECK: >>>               lto.tmp:(foo)
; CHECK: >>> referenced by ld-temp.o
; CHECK: >>>               lto.tmp:(foo)
; CHECK: >>> referenced by ld-temp.o
; CHECK: >>>               lto.tmp:(foo)
