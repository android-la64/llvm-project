; A basic inline assembly test

; RUN: llc -march=loongarch64 -mattr=+lsx < %s | FileCheck %s

@v2i64_r  = global <2 x i64> zeroinitializer, align 16

define void @test1() nounwind {
entry:
  ; CHECK-LABEL: test1:
  %0 = call <2 x i64> asm "vldi ${0:w}, 1", "=f"()
  ; CHECK: vldi $vr{{[1-3]?[0-9]}}, 1
  store <2 x i64> %0, <2 x i64>* @v2i64_r
  ret void
}

define void @test2() nounwind {
entry:
  ; CHECK-LABEL: test2:
  %0 = load <2 x i64>, <2 x i64>* @v2i64_r
  %1 = call <2 x i64> asm "vaddi.wu ${0:w}, ${1:w}, 1", "=f,f"(<2 x i64> %0)
  ; CHECK: vaddi.wu $vr{{[1-3]?[0-9]}}, $vr{{[1-3]?[0-9]}}, 1
  store <2 x i64> %1, <2 x i64>* @v2i64_r
  ret void
}

define void @test3() nounwind {
entry:
  ; CHECK-LABEL: test3:
  %0 = load <2 x i64>, <2 x i64>* @v2i64_r
  %1 = call <2 x i64> asm sideeffect "vaddi.wu ${0:w}, ${1:w}, 1", "=f,f,~{$vr0}"(<2 x i64> %0)
  ; CHECK: vaddi.wu $vr{{([1-9]|[1-3][0-9])}}, $vr{{([1-9]|[1-3][0-9])}}, 1
  store <2 x i64> %1, <2 x i64>* @v2i64_r
  ret void
}
