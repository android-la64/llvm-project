; RUN: llc --mtriple=loongarch64 --relocation-model=pic -o - %s | FileCheck %s

;; Duplicate returns to enable tail call optimizations.
declare i32 @test()
declare i32 @test1()
declare i32 @test2()
declare i32 @test3()
define i32 @duplicate_returns(i32 %a, i32 %b) nounwind {
; CHECK-LABEL: duplicate_returns:
; CHECK:    b test2
; CHECK:    b test
; CHECK:    b test1
; CHECK:    b test3
entry:
  %cmp = icmp eq i32 %a, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = tail call i32 @test()
  br label %return

if.else:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %b, 0
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %call3 = tail call i32 @test1()
  br label %return

if.else4:                                         ; preds = %if.else
  %cmp5 = icmp sgt i32 %a, %b
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else4
  %call7 = tail call i32 @test2()
  br label %return

if.else8:                                         ; preds = %if.else4
  %call9 = tail call i32 @test3()
  br label %return

return:                                           ; preds = %if.else8, %if.then6, %if.then2, %if.then
  %retval = phi i32 [ %call, %if.then ], [ %call3, %if.then2 ], [ %call7, %if.then6 ], [ %call9, %if.else8 ]
  ret i32 %retval
}
