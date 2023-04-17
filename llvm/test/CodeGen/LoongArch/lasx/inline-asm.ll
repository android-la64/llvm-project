; A basic inline assembly test

; RUN: llc -march=loongarch64 -mattr=+lasx < %s | FileCheck %s

@v4i64_r  = global <4 x i64> zeroinitializer, align 32
@v8i32_r  = global <8 x i32> zeroinitializer, align 32

define void @test1() nounwind {
entry:
  ; CHECK-LABEL: test1:
  %0 = call <4 x i64> asm "xvldi ${0:u}, 1", "=f"()
  ; CHECK: xvldi $xr{{[1-3]?[0-9]}}, 1
  store <4 x i64> %0, <4 x i64>* @v4i64_r
  ret void
}

define void @test2() nounwind {
entry:
  ; CHECK-LABEL: test2:
  %0 = load <8 x i32>, <8 x i32>* @v8i32_r
  %1 = call <8 x i32> asm "xvaddi.wu ${0:u}, ${1:u}, 1", "=f,f"(<8 x i32> %0)
  ; CHECK: xvaddi.wu $xr{{[1-3]?[0-9]}}, $xr{{[1-3]?[0-9]}}, 1
  store <8 x i32> %1, <8 x i32>* @v8i32_r
  ret void
}

define void @test2_d() nounwind {
entry:
  ; CHECK-LABEL: test2_d:
  %0 = load < 4 x i64>, < 4 x i64>* @v4i64_r
  %1 = call < 4 x i64> asm "xvaddi.wu ${0:u}, ${1:u}, 1", "=f,f"(< 4 x i64> %0)
  ; CHECK: xvaddi.wu $xr{{[1-3]?[0-9]}}, $xr{{[1-3]?[0-9]}}, 1
  store < 4 x i64> %1, < 4 x i64>* @v4i64_r
  ret void
}

define void @test3() nounwind {
entry:
  ; CHECK-LABEL: test3:
  %0 = load <8 x i32>, <8 x i32>* @v8i32_r
  %1 = call <8 x i32> asm sideeffect "xvaddi.wu ${0:u}, ${1:u}, 1", "=f,f,~{$xr0}"(<8 x i32> %0)
  ; CHECK: xvaddi.wu $xr{{([1-9]|[1-3][0-9])}}, $xr{{([1-9]|[1-3][0-9])}}, 1
  store <8 x i32> %1, <8 x i32>* @v8i32_r
  ret void
}

define void @test3_d() nounwind {
entry:
  ; CHECK-LABEL: test3_d:
  %0 = load <4 x i64>, <4 x i64>* @v4i64_r
  %1 = call <4 x i64> asm sideeffect "xvaddi.wu ${0:u}, ${1:u}, 1", "=f,f,~{$xr0}"(<4 x i64> %0)
  ; CHECK: xvaddi.wu $xr{{([1-9]|[1-3][0-9])}}, $xr{{([1-9]|[1-3][0-9])}}, 1
  store <4 x i64> %1, <4 x i64>* @v4i64_r
  ret void
}
