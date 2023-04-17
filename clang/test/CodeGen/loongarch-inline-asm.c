// REQUIRES: loongarch-registered-target
// RUN: %clang_cc1 -triple loongarch64-linux-gnu -emit-llvm -o - %s | FileCheck %s

int data;

void m () {
  asm("ld.w $r1, %0" :: "m"(data));
  // CHECK: call void asm sideeffect "ld.w $$r1, $0", "*m"(ptr elementtype(i32) @data)
}

void ZC () {
  asm("ll.w $r1, %0" :: "ZC"(data));
  // CHECK: call void asm sideeffect "ll.w $$r1, $0", "*^ZC"(ptr elementtype(i32) @data)
}

void ZB () {
  asm("amadd_db.w $zero, $r1, %0" :: "ZB"(data));
  // CHECK: call void asm sideeffect "amadd_db.w $$zero, $$r1, $0", "*^ZB"(ptr elementtype(i32) @data)
}

void R () {
  asm("ld.w $r1, %0" :: "R"(data));
  // CHECK: call void asm sideeffect "ld.w $$r1, $0", "*R"(ptr elementtype(i32) @data)
}

int *p;
void preld () {
  asm("preld 0, %0, 2" :: "r"(p));
  // CHECK: %0 = load ptr, ptr @p, align 8
  // CHECK: call void asm sideeffect "preld 0, $0, 2", "r"(ptr %0)
}
