; RUN: llc -march=loongarch64 -target-abi=lp64 -o - %s 2>&1 | FileCheck %s

;; Test that floating-point bits can be stored in GPR.

define void @reg_float(float %x) {
; CHECK-LABEL:  reg_float:
; CHECK: movfr2gr.s $r{{[0-9]+}}, $f0
  call void asm "", "r"(float %x)
  ret void
}

define void @r10_float(float %x) {
; CHECK-LABEL:  r10_float:
; CHECK: movfr2gr.s $r10, $f0
  call void asm "", "{$r10}"(float %x)
  ret void
}

define void @reg_double(double %x) {
; CHECK-LABEL:  reg_double:
; CHECK: movfr2gr.d $r{{[0-9]+}}, $f0
  call void asm "", "r"(double %x)
  ret void
}

define void @r10_double(double %x) {
; CHECK-LABEL:  r10_double:
; CHECK: movfr2gr.d $r10, $f0
  call void asm "", "{$r10}"(double %x)
  ret void
}
