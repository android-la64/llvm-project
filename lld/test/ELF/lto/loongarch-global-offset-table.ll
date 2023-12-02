; REQUIRES: loongarch

; RUN: llvm-as %s -o %t.o
; RUN: ld.lld %t.o -shared -o %t.so --no-undefined
; RUN: llvm-readelf -S -s %t.so | FileCheck %s

;; Check that the linker reserved symbol `_GLOBAL_OFFSET_TABLE_` is created when
;; LTO which points to the begining of .got section.

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
target triple = "loongarch64-unknown-elf"

@g = global i32 1

define i32 @foo() {
  %res = load i32, ptr @g
  ret i32 %res
}

; CHECK: Section Headers:
; CHECK:  [Nr]     Name Type     Address
; CHECK:  [{{.+}}] .got PROGBITS [[GOT:[0-9a-z]+]]

; CHECK: Symbol table '.symtab' contains {{.+}} entries:
; CHECK: Num:    Value   Size Type   Bind  Vis    Ndx    Name
; CHECK: {{.+}}: [[GOT]] 0    NOTYPE LOCAL HIDDEN {{.+}} _GLOBAL_OFFSET_TABLE_
