; RUN: not llc -march=loongarch64 %s 2>&1 | FileCheck %s

define void @test_i128() {
; CHECK: error: couldn't allocate input reg for constraint '{$r20}'
start:
  call void asm "", "{$r20}"(i128 5)
  ret void
}
