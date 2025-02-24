; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=loongarch64 -mattr=+lsx  < %s | FileCheck %s

define <16 x i8> @seti8(<16 x i8>) {
; CHECK-LABEL: seti8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vbitseti.b $vr0, $vr0, 6
; CHECK-NEXT:    jr $ra
  %2 = or <16 x i8> %0, <i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64>
  ret <16 x i8> %2
}

define <8 x i16> @seti16(<8 x i16>) {
; CHECK-LABEL: seti16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vbitseti.h $vr0, $vr0, 6
; CHECK-NEXT:    jr $ra
  %2 = or <8 x i16> %0, <i16 64, i16 64, i16 64, i16 64, i16 64, i16 64, i16 64, i16 64>
  ret <8 x i16> %2
}

define <4 x i32> @seti32(<4 x i32>) {
; CHECK-LABEL: seti32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vbitseti.w $vr0, $vr0, 6
; CHECK-NEXT:    jr $ra
  %2 = or <4 x i32> %0, <i32 64, i32 64, i32 64, i32 64>
  ret <4 x i32> %2
}

define <2 x i64> @seti64(<2 x i64>) {
; CHECK-LABEL: seti64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vbitseti.d $vr0, $vr0, 6
; CHECK-NEXT:    jr $ra
  %2 = or <2 x i64> %0, <i64 64, i64 64>
  ret <2 x i64> %2
}
