; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=loongarch64 -mattr=+lasx  < %s | FileCheck %s

define <4 x i64> @s_v4i32_v4i64(<4 x i32> %a0) {
; CHECK-LABEL: s_v4i32_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.d.w $xr0, $xr0
; CHECK-NEXT:    jr $ra
  %1 = sext <4 x i32> %a0 to <4 x i64>
  ret <4 x i64> %1
}

define <4 x i64> @z_v4i32_v4i64(<4 x i32> %a0) {
; CHECK-LABEL: z_v4i32_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.du.wu $xr0, $xr0
; CHECK-NEXT:    jr $ra
  %1 = zext <4 x i32> %a0 to <4 x i64>
  ret <4 x i64> %1
}

define <16 x i16> @s_v16i8_v16i16(<16 x i8> %A) {
; CHECK-LABEL: s_v16i8_v16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.h.b $xr0, $xr0
; CHECK-NEXT:    jr $ra
  entry:
  %B = sext <16 x i8> %A to <16 x i16>
  ret <16 x i16> %B
}

define <16 x i16> @z_v16i8_v16i16(<16 x i8> %A) {
; CHECK-LABEL: z_v16i8_v16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.hu.bu $xr0, $xr0
; CHECK-NEXT:    jr $ra
  entry:
  %B = zext <16 x i8> %A to <16 x i16>
  ret <16 x i16> %B
}

define <8 x i32> @s_v8i16_v8i32(<8 x i16> %x) {
; CHECK-LABEL: s_v8i16_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.w.h $xr0, $xr0
; CHECK-NEXT:    jr $ra
  %1 = sext <8 x i16> %x to <8 x i32>
  ret <8 x i32> %1
}

define <8 x i32> @z_v8i16_v8i32(<8 x i16> %x) {
; CHECK-LABEL: z_v8i16_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $vr0 killed $vr0 def $xr0
; CHECK-NEXT:    vext2xv.wu.hu $xr0, $xr0
; CHECK-NEXT:    jr $ra
  %1 = zext <8 x i16> %x to <8 x i32>
  ret <8 x i32> %1
}

