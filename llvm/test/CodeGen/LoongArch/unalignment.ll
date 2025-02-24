; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=loongarch64 -o - %s | FileCheck -check-prefix=UNALIGNED %s
; RUN: llc -march=loongarch64 -mattr=+unaligned-access -o - %s | FileCheck -check-prefix=UNALIGNED %s
; RUN: llc -march=loongarch64 -mattr=-unaligned-access -o - %s | FileCheck -check-prefix=ALIGNED %s

define i32 @i32_load(i32* %p) {
; UNALIGNED-LABEL: i32_load:
; UNALIGNED:       # %bb.0:
; UNALIGNED-NEXT:    ld.w $r4, $r4, 0
; UNALIGNED-NEXT:    jr $ra
;
; ALIGNED-LABEL: i32_load:
; ALIGNED:       # %bb.0:
; ALIGNED-NEXT:    ld.hu $r5, $r4, 0
; ALIGNED-NEXT:    ld.hu $r4, $r4, 2
; ALIGNED-NEXT:    slli.w $r4, $r4, 16
; ALIGNED-NEXT:    or $r4, $r4, $r5
; ALIGNED-NEXT:    jr $ra
  %tmp = load i32, i32* %p, align 2
  ret i32 %tmp
}

define signext i32 @i32_sextload(i32* %p) {
; UNALIGNED-LABEL: i32_sextload:
; UNALIGNED:       # %bb.0:
; UNALIGNED-NEXT:    ld.w $r4, $r4, 0
; UNALIGNED-NEXT:    jr $ra
;
; ALIGNED-LABEL: i32_sextload:
; ALIGNED:       # %bb.0:
; ALIGNED-NEXT:    ld.hu $r5, $r4, 0
; ALIGNED-NEXT:    ld.h $r4, $r4, 2
; ALIGNED-NEXT:    slli.d $r4, $r4, 16
; ALIGNED-NEXT:    or $r4, $r4, $r5
; ALIGNED-NEXT:    jr $ra
  %tmp = load i32, i32* %p, align 2
  ret i32 %tmp
}

define zeroext i32 @i32_zextload(i32* %p) {
; UNALIGNED-LABEL: i32_zextload:
; UNALIGNED:       # %bb.0:
; UNALIGNED-NEXT:    ld.wu $r4, $r4, 0
; UNALIGNED-NEXT:    jr $ra
;
; ALIGNED-LABEL: i32_zextload:
; ALIGNED:       # %bb.0:
; ALIGNED-NEXT:    ld.hu $r5, $r4, 0
; ALIGNED-NEXT:    ld.hu $r4, $r4, 2
; ALIGNED-NEXT:    slli.d $r4, $r4, 16
; ALIGNED-NEXT:    or $r4, $r4, $r5
; ALIGNED-NEXT:    jr $ra
  %tmp = load i32, i32* %p, align 2
  ret i32 %tmp
}

define i64 @i64_load(i64* %p) {
; UNALIGNED-LABEL: i64_load:
; UNALIGNED:       # %bb.0:
; UNALIGNED-NEXT:    ld.d $r4, $r4, 0
; UNALIGNED-NEXT:    jr $ra
;
; ALIGNED-LABEL: i64_load:
; ALIGNED:       # %bb.0:
; ALIGNED-NEXT:    ld.wu $r5, $r4, 0
; ALIGNED-NEXT:    ld.wu $r4, $r4, 4
; ALIGNED-NEXT:    slli.d $r4, $r4, 32
; ALIGNED-NEXT:    or $r4, $r4, $r5
; ALIGNED-NEXT:    jr $ra
  %tmp = load i64, i64* %p, align 4
  ret i64 %tmp
}
