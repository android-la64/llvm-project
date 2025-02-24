//===------------- OrcABISupport.cpp - ABI specific support code ----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/ExecutionEngine/Orc/OrcABISupport.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/Process.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "orc"

using namespace llvm;

template <typename ORCABI>
bool stubAndPointerRangesOk(JITTargetAddress StubBlockAddr,
                            JITTargetAddress PointerBlockAddr,
                            unsigned NumStubs) {
  constexpr unsigned MaxDisp = ORCABI::StubToPointerMaxDisplacement;
  JITTargetAddress FirstStub = StubBlockAddr;
  JITTargetAddress LastStub = FirstStub + ((NumStubs - 1) * ORCABI::StubSize);
  JITTargetAddress FirstPointer = PointerBlockAddr;
  JITTargetAddress LastPointer =
      FirstPointer + ((NumStubs - 1) * ORCABI::StubSize);

  if (FirstStub < FirstPointer) {
    if (LastStub >= FirstPointer)
      return false; // Ranges overlap.
    return (FirstPointer - FirstStub <= MaxDisp) &&
           (LastPointer - LastStub <= MaxDisp); // out-of-range.
  }

  if (LastPointer >= FirstStub)
    return false; // Ranges overlap.

  return (FirstStub - FirstPointer <= MaxDisp) &&
         (LastStub - LastPointer <= MaxDisp);
}

namespace llvm {
namespace orc {

void OrcAArch64::writeResolverCode(char *ResolverWorkingMem,
                                   JITTargetAddress ResolverTargetAddress,
                                   JITTargetAddress ReentryFnAddr,
                                   JITTargetAddress ReentryCtxAddr) {

  const uint32_t ResolverCode[] = {
    // resolver_entry:
    0xa9bf47fd,        // 0x000:  stp  x29, x17, [sp, #-16]!
    0x910003fd,        // 0x004:  mov  x29, sp
    0xa9bf73fb,        // 0x008:  stp  x27, x28, [sp, #-16]!
    0xa9bf6bf9,        // 0x00c:  stp  x25, x26, [sp, #-16]!
    0xa9bf63f7,        // 0x010:  stp  x23, x24, [sp, #-16]!
    0xa9bf5bf5,        // 0x014:  stp  x21, x22, [sp, #-16]!
    0xa9bf53f3,        // 0x018:  stp  x19, x20, [sp, #-16]!
    0xa9bf3fee,        // 0x01c:  stp  x14, x15, [sp, #-16]!
    0xa9bf37ec,        // 0x020:  stp  x12, x13, [sp, #-16]!
    0xa9bf2fea,        // 0x024:  stp  x10, x11, [sp, #-16]!
    0xa9bf27e8,        // 0x028:  stp   x8,  x9, [sp, #-16]!
    0xa9bf1fe6,        // 0x02c:  stp   x6,  x7, [sp, #-16]!
    0xa9bf17e4,        // 0x030:  stp   x4,  x5, [sp, #-16]!
    0xa9bf0fe2,        // 0x034:  stp   x2,  x3, [sp, #-16]!
    0xa9bf07e0,        // 0x038:  stp   x0,  x1, [sp, #-16]!
    0xadbf7ffe,        // 0x03c:  stp  q30, q31, [sp, #-32]!
    0xadbf77fc,        // 0x040:  stp  q28, q29, [sp, #-32]!
    0xadbf6ffa,        // 0x044:  stp  q26, q27, [sp, #-32]!
    0xadbf67f8,        // 0x048:  stp  q24, q25, [sp, #-32]!
    0xadbf5ff6,        // 0x04c:  stp  q22, q23, [sp, #-32]!
    0xadbf57f4,        // 0x050:  stp  q20, q21, [sp, #-32]!
    0xadbf4ff2,        // 0x054:  stp  q18, q19, [sp, #-32]!
    0xadbf47f0,        // 0x058:  stp  q16, q17, [sp, #-32]!
    0xadbf3fee,        // 0x05c:  stp  q14, q15, [sp, #-32]!
    0xadbf37ec,        // 0x060:  stp  q12, q13, [sp, #-32]!
    0xadbf2fea,        // 0x064:  stp  q10, q11, [sp, #-32]!
    0xadbf27e8,        // 0x068:  stp   q8,  q9, [sp, #-32]!
    0xadbf1fe6,        // 0x06c:  stp   q6,  q7, [sp, #-32]!
    0xadbf17e4,        // 0x070:  stp   q4,  q5, [sp, #-32]!
    0xadbf0fe2,        // 0x074:  stp   q2,  q3, [sp, #-32]!
    0xadbf07e0,        // 0x078:  stp   q0,  q1, [sp, #-32]!
    0x580004e0,        // 0x07c:  ldr   x0, Lreentry_ctx_ptr
    0xaa1e03e1,        // 0x080:  mov   x1, x30
    0xd1003021,        // 0x084:  sub   x1,  x1, #12
    0x58000442,        // 0x088:  ldr   x2, Lreentry_fn_ptr
    0xd63f0040,        // 0x08c:  blr   x2
    0xaa0003f1,        // 0x090:  mov   x17, x0
    0xacc107e0,        // 0x094:  ldp   q0,  q1, [sp], #32
    0xacc10fe2,        // 0x098:  ldp   q2,  q3, [sp], #32
    0xacc117e4,        // 0x09c:  ldp   q4,  q5, [sp], #32
    0xacc11fe6,        // 0x0a0:  ldp   q6,  q7, [sp], #32
    0xacc127e8,        // 0x0a4:  ldp   q8,  q9, [sp], #32
    0xacc12fea,        // 0x0a8:  ldp  q10, q11, [sp], #32
    0xacc137ec,        // 0x0ac:  ldp  q12, q13, [sp], #32
    0xacc13fee,        // 0x0b0:  ldp  q14, q15, [sp], #32
    0xacc147f0,        // 0x0b4:  ldp  q16, q17, [sp], #32
    0xacc14ff2,        // 0x0b8:  ldp  q18, q19, [sp], #32
    0xacc157f4,        // 0x0bc:  ldp  q20, q21, [sp], #32
    0xacc15ff6,        // 0x0c0:  ldp  q22, q23, [sp], #32
    0xacc167f8,        // 0x0c4:  ldp  q24, q25, [sp], #32
    0xacc16ffa,        // 0x0c8:  ldp  q26, q27, [sp], #32
    0xacc177fc,        // 0x0cc:  ldp  q28, q29, [sp], #32
    0xacc17ffe,        // 0x0d0:  ldp  q30, q31, [sp], #32
    0xa8c107e0,        // 0x0d4:  ldp   x0,  x1, [sp], #16
    0xa8c10fe2,        // 0x0d8:  ldp   x2,  x3, [sp], #16
    0xa8c117e4,        // 0x0dc:  ldp   x4,  x5, [sp], #16
    0xa8c11fe6,        // 0x0e0:  ldp   x6,  x7, [sp], #16
    0xa8c127e8,        // 0x0e4:  ldp   x8,  x9, [sp], #16
    0xa8c12fea,        // 0x0e8:  ldp  x10, x11, [sp], #16
    0xa8c137ec,        // 0x0ec:  ldp  x12, x13, [sp], #16
    0xa8c13fee,        // 0x0f0:  ldp  x14, x15, [sp], #16
    0xa8c153f3,        // 0x0f4:  ldp  x19, x20, [sp], #16
    0xa8c15bf5,        // 0x0f8:  ldp  x21, x22, [sp], #16
    0xa8c163f7,        // 0x0fc:  ldp  x23, x24, [sp], #16
    0xa8c16bf9,        // 0x100:  ldp  x25, x26, [sp], #16
    0xa8c173fb,        // 0x104:  ldp  x27, x28, [sp], #16
    0xa8c17bfd,        // 0x108:  ldp  x29, x30, [sp], #16
    0xd65f0220,        // 0x10c:  ret  x17
    0x01234567,        // 0x110:  Lreentry_fn_ptr:
    0xdeadbeef,        // 0x114:      .quad 0
    0x98765432,        // 0x118:  Lreentry_ctx_ptr:
    0xcafef00d         // 0x11c:      .quad 0
  };

  const unsigned ReentryFnAddrOffset = 0x110;
  const unsigned ReentryCtxAddrOffset = 0x118;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnAddr,
         sizeof(uint64_t));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxAddr,
         sizeof(uint64_t));
}

void OrcAArch64::writeTrampolines(char *TrampolineBlockWorkingMem,
                                  JITTargetAddress TrampolineBlockTargetAddress,
                                  JITTargetAddress ResolverAddr,
                                  unsigned NumTrampolines) {

  unsigned OffsetToPtr = alignTo(NumTrampolines * TrampolineSize, 8);

  memcpy(TrampolineBlockWorkingMem + OffsetToPtr, &ResolverAddr,
         sizeof(uint64_t));

  // OffsetToPtr is actually the offset from the PC for the 2nd instruction, so
  // subtract 32-bits.
  OffsetToPtr -= 4;

  uint32_t *Trampolines =
      reinterpret_cast<uint32_t *>(TrampolineBlockWorkingMem);

  for (unsigned I = 0; I < NumTrampolines; ++I, OffsetToPtr -= TrampolineSize) {
    Trampolines[3 * I + 0] = 0xaa1e03f1;                      // mov x17, x30
    Trampolines[3 * I + 1] = 0x58000010 | (OffsetToPtr << 3); // adr x16, Lptr
    Trampolines[3 * I + 2] = 0xd63f0200;                      // blr x16
  }
}

void OrcAArch64::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 ldr     x0, ptr1       ; PC-rel load of ptr1
  //                 br      x0             ; Jump to resolver
  // stub2:
  //                 ldr     x0, ptr2       ; PC-rel load of ptr2
  //                 br      x0             ; Jump to resolver
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .quad 0x0
  // ptr2:
  //                 .quad 0x0
  //
  // ...

  static_assert(StubSize == PointerSize,
                "Pointer and stub size must match for algorithm below");
  assert(stubAndPointerRangesOk<OrcAArch64>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");
  uint64_t PtrDisplacement =
      PointersBlockTargetAddress - StubsBlockTargetAddress;
  uint64_t *Stub = reinterpret_cast<uint64_t *>(StubsBlockWorkingMem);
  uint64_t PtrOffsetField = PtrDisplacement << 3;

  for (unsigned I = 0; I < NumStubs; ++I)
    Stub[I] = 0xd61f020058000010 | PtrOffsetField;
}

void OrcX86_64_Base::writeTrampolines(
    char *TrampolineBlockWorkingMem,
    JITTargetAddress TrampolineBlockTargetAddress,
    JITTargetAddress ResolverAddr, unsigned NumTrampolines) {

  unsigned OffsetToPtr = NumTrampolines * TrampolineSize;

  memcpy(TrampolineBlockWorkingMem + OffsetToPtr, &ResolverAddr,
         sizeof(uint64_t));

  uint64_t *Trampolines =
      reinterpret_cast<uint64_t *>(TrampolineBlockWorkingMem);
  uint64_t CallIndirPCRel = 0xf1c40000000015ff;

  for (unsigned I = 0; I < NumTrampolines; ++I, OffsetToPtr -= TrampolineSize)
    Trampolines[I] = CallIndirPCRel | ((OffsetToPtr - 6) << 16);
}

void OrcX86_64_Base::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 jmpq    *ptr1(%rip)
  //                 .byte   0xC4         ; <- Invalid opcode padding.
  //                 .byte   0xF1
  // stub2:
  //                 jmpq    *ptr2(%rip)
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .quad 0x0
  // ptr2:
  //                 .quad 0x0
  //
  // ...

  // Populate the stubs page stubs and mark it executable.
  static_assert(StubSize == PointerSize,
                "Pointer and stub size must match for algorithm below");
  assert(stubAndPointerRangesOk<OrcX86_64_Base>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");
  uint64_t *Stub = reinterpret_cast<uint64_t *>(StubsBlockWorkingMem);
  uint64_t PtrOffsetField =
      (PointersBlockTargetAddress - StubsBlockTargetAddress - 6) << 16;
  for (unsigned I = 0; I < NumStubs; ++I)
    Stub[I] = 0xF1C40000000025ff | PtrOffsetField;
}

void OrcX86_64_SysV::writeResolverCode(char *ResolverWorkingMem,
                                       JITTargetAddress ResolverTargetAddress,
                                       JITTargetAddress ReentryFnAddr,
                                       JITTargetAddress ReentryCtxAddr) {

  LLVM_DEBUG({
    dbgs() << "Writing resolver code to "
           << formatv("{0:x16}", ResolverTargetAddress) << "\n";
  });

  const uint8_t ResolverCode[] = {
      // resolver_entry:
      0x55,                                     // 0x00: pushq     %rbp
      0x48, 0x89, 0xe5,                         // 0x01: movq      %rsp, %rbp
      0x50,                                     // 0x04: pushq     %rax
      0x53,                                     // 0x05: pushq     %rbx
      0x51,                                     // 0x06: pushq     %rcx
      0x52,                                     // 0x07: pushq     %rdx
      0x56,                                     // 0x08: pushq     %rsi
      0x57,                                     // 0x09: pushq     %rdi
      0x41, 0x50,                               // 0x0a: pushq     %r8
      0x41, 0x51,                               // 0x0c: pushq     %r9
      0x41, 0x52,                               // 0x0e: pushq     %r10
      0x41, 0x53,                               // 0x10: pushq     %r11
      0x41, 0x54,                               // 0x12: pushq     %r12
      0x41, 0x55,                               // 0x14: pushq     %r13
      0x41, 0x56,                               // 0x16: pushq     %r14
      0x41, 0x57,                               // 0x18: pushq     %r15
      0x48, 0x81, 0xec, 0x08, 0x02, 0x00, 0x00, // 0x1a: subq      0x208, %rsp
      0x48, 0x0f, 0xae, 0x04, 0x24,             // 0x21: fxsave64  (%rsp)
      0x48, 0xbf,                               // 0x26: movabsq   <CBMgr>, %rdi

      // 0x28: JIT re-entry ctx addr.
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

      0x48, 0x8b, 0x75, 0x08,                   // 0x30: movq      8(%rbp), %rsi
      0x48, 0x83, 0xee, 0x06,                   // 0x34: subq      $6, %rsi
      0x48, 0xb8,                               // 0x38: movabsq   <REntry>, %rax

      // 0x3a: JIT re-entry fn addr:
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

      0xff, 0xd0,                               // 0x42: callq     *%rax
      0x48, 0x89, 0x45, 0x08,                   // 0x44: movq      %rax, 8(%rbp)
      0x48, 0x0f, 0xae, 0x0c, 0x24,             // 0x48: fxrstor64 (%rsp)
      0x48, 0x81, 0xc4, 0x08, 0x02, 0x00, 0x00, // 0x4d: addq      0x208, %rsp
      0x41, 0x5f,                               // 0x54: popq      %r15
      0x41, 0x5e,                               // 0x56: popq      %r14
      0x41, 0x5d,                               // 0x58: popq      %r13
      0x41, 0x5c,                               // 0x5a: popq      %r12
      0x41, 0x5b,                               // 0x5c: popq      %r11
      0x41, 0x5a,                               // 0x5e: popq      %r10
      0x41, 0x59,                               // 0x60: popq      %r9
      0x41, 0x58,                               // 0x62: popq      %r8
      0x5f,                                     // 0x64: popq      %rdi
      0x5e,                                     // 0x65: popq      %rsi
      0x5a,                                     // 0x66: popq      %rdx
      0x59,                                     // 0x67: popq      %rcx
      0x5b,                                     // 0x68: popq      %rbx
      0x58,                                     // 0x69: popq      %rax
      0x5d,                                     // 0x6a: popq      %rbp
      0xc3,                                     // 0x6b: retq
 };

  const unsigned ReentryFnAddrOffset = 0x3a;
  const unsigned ReentryCtxAddrOffset = 0x28;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnAddr,
         sizeof(uint64_t));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxAddr,
         sizeof(uint64_t));
}

void OrcX86_64_Win32::writeResolverCode(char *ResolverWorkingMem,
                                        JITTargetAddress ResolverTargetAddress,
                                        JITTargetAddress ReentryFnAddr,
                                        JITTargetAddress ReentryCtxAddr) {

  // resolverCode is similar to OrcX86_64 with differences specific to windows
  // x64 calling convention: arguments go into rcx, rdx and come in reverse
  // order, shadow space allocation on stack
  const uint8_t ResolverCode[] = {
      // resolver_entry:
      0x55,                                      // 0x00: pushq     %rbp
      0x48, 0x89, 0xe5,                          // 0x01: movq      %rsp, %rbp
      0x50,                                      // 0x04: pushq     %rax
      0x53,                                      // 0x05: pushq     %rbx
      0x51,                                      // 0x06: pushq     %rcx
      0x52,                                      // 0x07: pushq     %rdx
      0x56,                                      // 0x08: pushq     %rsi
      0x57,                                      // 0x09: pushq     %rdi
      0x41, 0x50,                                // 0x0a: pushq     %r8
      0x41, 0x51,                                // 0x0c: pushq     %r9
      0x41, 0x52,                                // 0x0e: pushq     %r10
      0x41, 0x53,                                // 0x10: pushq     %r11
      0x41, 0x54,                                // 0x12: pushq     %r12
      0x41, 0x55,                                // 0x14: pushq     %r13
      0x41, 0x56,                                // 0x16: pushq     %r14
      0x41, 0x57,                                // 0x18: pushq     %r15
      0x48, 0x81, 0xec, 0x08, 0x02, 0x00, 0x00,  // 0x1a: subq      0x208, %rsp
      0x48, 0x0f, 0xae, 0x04, 0x24,              // 0x21: fxsave64  (%rsp)

      0x48, 0xb9,                                // 0x26: movabsq   <CBMgr>, %rcx
      // 0x28: JIT re-entry ctx addr.
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

      0x48, 0x8B, 0x55, 0x08,                    // 0x30: mov       rdx, [rbp+0x8]
      0x48, 0x83, 0xea, 0x06,                    // 0x34: sub       rdx, 0x6

      0x48, 0xb8,                                // 0x38: movabsq   <REntry>, %rax
      // 0x3a: JIT re-entry fn addr:
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

      // 0x42: sub       rsp, 0x20 (Allocate shadow space)
      0x48, 0x83, 0xEC, 0x20,
      0xff, 0xd0,                                // 0x46: callq     *%rax

      // 0x48: add       rsp, 0x20 (Free shadow space)
      0x48, 0x83, 0xC4, 0x20,

      0x48, 0x89, 0x45, 0x08,                    // 0x4C: movq      %rax, 8(%rbp)
      0x48, 0x0f, 0xae, 0x0c, 0x24,              // 0x50: fxrstor64 (%rsp)
      0x48, 0x81, 0xc4, 0x08, 0x02, 0x00, 0x00,  // 0x55: addq      0x208, %rsp
      0x41, 0x5f,                                // 0x5C: popq      %r15
      0x41, 0x5e,                                // 0x5E: popq      %r14
      0x41, 0x5d,                                // 0x60: popq      %r13
      0x41, 0x5c,                                // 0x62: popq      %r12
      0x41, 0x5b,                                // 0x64: popq      %r11
      0x41, 0x5a,                                // 0x66: popq      %r10
      0x41, 0x59,                                // 0x68: popq      %r9
      0x41, 0x58,                                // 0x6a: popq      %r8
      0x5f,                                      // 0x6c: popq      %rdi
      0x5e,                                      // 0x6d: popq      %rsi
      0x5a,                                      // 0x6e: popq      %rdx
      0x59,                                      // 0x6f: popq      %rcx
      0x5b,                                      // 0x70: popq      %rbx
      0x58,                                      // 0x71: popq      %rax
      0x5d,                                      // 0x72: popq      %rbp
      0xc3,                                      // 0x73: retq
  };

  const unsigned ReentryFnAddrOffset = 0x3a;
  const unsigned ReentryCtxAddrOffset = 0x28;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnAddr,
         sizeof(uint64_t));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxAddr,
         sizeof(uint64_t));
}

void OrcI386::writeResolverCode(char *ResolverWorkingMem,
                                JITTargetAddress ResolverTargetAddress,
                                JITTargetAddress ReentryFnAddr,
                                JITTargetAddress ReentryCtxAddr) {

  assert((ReentryFnAddr >> 32) == 0 && "ReentryFnAddr out of range");
  assert((ReentryCtxAddr >> 32) == 0 && "ReentryCtxAddr out of range");

  const uint8_t ResolverCode[] = {
      // resolver_entry:
      0x55,                               // 0x00: pushl    %ebp
      0x89, 0xe5,                         // 0x01: movl     %esp, %ebp
      0x54,                               // 0x03: pushl    %esp
      0x83, 0xe4, 0xf0,                   // 0x04: andl     $-0x10, %esp
      0x50,                               // 0x07: pushl    %eax
      0x53,                               // 0x08: pushl    %ebx
      0x51,                               // 0x09: pushl    %ecx
      0x52,                               // 0x0a: pushl    %edx
      0x56,                               // 0x0b: pushl    %esi
      0x57,                               // 0x0c: pushl    %edi
      0x81, 0xec, 0x18, 0x02, 0x00, 0x00, // 0x0d: subl     $0x218, %esp
      0x0f, 0xae, 0x44, 0x24, 0x10,       // 0x13: fxsave   0x10(%esp)
      0x8b, 0x75, 0x04,                   // 0x18: movl     0x4(%ebp), %esi
      0x83, 0xee, 0x05,                   // 0x1b: subl     $0x5, %esi
      0x89, 0x74, 0x24, 0x04,             // 0x1e: movl     %esi, 0x4(%esp)
      0xc7, 0x04, 0x24, 0x00, 0x00, 0x00,
      0x00,                               // 0x22: movl     <cbmgr>, (%esp)
      0xb8, 0x00, 0x00, 0x00, 0x00,       // 0x29: movl     <reentry>, %eax
      0xff, 0xd0,                         // 0x2e: calll    *%eax
      0x89, 0x45, 0x04,                   // 0x30: movl     %eax, 0x4(%ebp)
      0x0f, 0xae, 0x4c, 0x24, 0x10,       // 0x33: fxrstor  0x10(%esp)
      0x81, 0xc4, 0x18, 0x02, 0x00, 0x00, // 0x38: addl     $0x218, %esp
      0x5f,                               // 0x3e: popl     %edi
      0x5e,                               // 0x3f: popl     %esi
      0x5a,                               // 0x40: popl     %edx
      0x59,                               // 0x41: popl     %ecx
      0x5b,                               // 0x42: popl     %ebx
      0x58,                               // 0x43: popl     %eax
      0x8b, 0x65, 0xfc,                   // 0x44: movl     -0x4(%ebp), %esp
      0x5d,                               // 0x48: popl     %ebp
      0xc3                                // 0x49: retl
  };

  const unsigned ReentryFnAddrOffset = 0x2a;
  const unsigned ReentryCtxAddrOffset = 0x25;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnAddr,
         sizeof(uint32_t));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxAddr,
         sizeof(uint32_t));
}

void OrcI386::writeTrampolines(char *TrampolineWorkingMem,
                               JITTargetAddress TrampolineBlockTargetAddress,
                               JITTargetAddress ResolverAddr,
                               unsigned NumTrampolines) {
  assert((ResolverAddr >> 32) == 0 && "ResolverAddr out of range");

  uint64_t CallRelImm = 0xF1C4C400000000e8;
  uint64_t ResolverRel = ResolverAddr - TrampolineBlockTargetAddress - 5;

  uint64_t *Trampolines = reinterpret_cast<uint64_t *>(TrampolineWorkingMem);
  for (unsigned I = 0; I < NumTrampolines; ++I, ResolverRel -= TrampolineSize)
    Trampolines[I] = CallRelImm | (ResolverRel << 8);
}

void OrcI386::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  assert((StubsBlockTargetAddress >> 32) == 0 &&
         "StubsBlockTargetAddress is out of range");
  assert((PointersBlockTargetAddress >> 32) == 0 &&
         "PointersBlockTargetAddress is out of range");

  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 jmpq    *ptr1
  //                 .byte   0xC4         ; <- Invalid opcode padding.
  //                 .byte   0xF1
  // stub2:
  //                 jmpq    *ptr2
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .quad 0x0
  // ptr2:
  //                 .quad 0x0
  //
  // ...

  assert(stubAndPointerRangesOk<OrcI386>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");

  uint64_t *Stub = reinterpret_cast<uint64_t *>(StubsBlockWorkingMem);
  uint64_t PtrAddr = PointersBlockTargetAddress;
  for (unsigned I = 0; I < NumStubs; ++I, PtrAddr += 4)
    Stub[I] = 0xF1C40000000025ff | (PtrAddr << 16);
}

void OrcMips32_Base::writeResolverCode(char *ResolverWorkingMem,
                                       JITTargetAddress ResolverTargetAddress,
                                       JITTargetAddress ReentryFnAddr,
                                       JITTargetAddress ReentryCtxAddr,
                                       bool isBigEndian) {

  const uint32_t ResolverCode[] = {
      // resolver_entry:
      0x27bdff98,                    // 0x00: addiu $sp,$sp,-104
      0xafa20000,                    // 0x04: sw $v0,0($sp)
      0xafa30004,                    // 0x08: sw $v1,4($sp)
      0xafa40008,                    // 0x0c: sw $a0,8($sp)
      0xafa5000c,                    // 0x10: sw $a1,12($sp)
      0xafa60010,                    // 0x14: sw $a2,16($sp)
      0xafa70014,                    // 0x18: sw $a3,20($sp)
      0xafb00018,                    // 0x1c: sw $s0,24($sp)
      0xafb1001c,                    // 0x20: sw $s1,28($sp)
      0xafb20020,                    // 0x24: sw $s2,32($sp)
      0xafb30024,                    // 0x28: sw $s3,36($sp)
      0xafb40028,                    // 0x2c: sw $s4,40($sp)
      0xafb5002c,                    // 0x30: sw $s5,44($sp)
      0xafb60030,                    // 0x34: sw $s6,48($sp)
      0xafb70034,                    // 0x38: sw $s7,52($sp)
      0xafa80038,                    // 0x3c: sw $t0,56($sp)
      0xafa9003c,                    // 0x40: sw $t1,60($sp)
      0xafaa0040,                    // 0x44: sw $t2,64($sp)
      0xafab0044,                    // 0x48: sw $t3,68($sp)
      0xafac0048,                    // 0x4c: sw $t4,72($sp)
      0xafad004c,                    // 0x50: sw $t5,76($sp)
      0xafae0050,                    // 0x54: sw $t6,80($sp)
      0xafaf0054,                    // 0x58: sw $t7,84($sp)
      0xafb80058,                    // 0x5c: sw $t8,88($sp)
      0xafb9005c,                    // 0x60: sw $t9,92($sp)
      0xafbe0060,                    // 0x64: sw $fp,96($sp)
      0xafbf0064,                    // 0x68: sw $ra,100($sp)

      // JIT re-entry ctx addr.
      0x00000000,                    // 0x6c: lui $a0,ctx
      0x00000000,                    // 0x70: addiu $a0,$a0,ctx

      0x03e02825,                    // 0x74: move $a1, $ra
      0x24a5ffec,                    // 0x78: addiu $a1,$a1,-20

      // JIT re-entry fn addr:
      0x00000000,                    // 0x7c: lui $t9,reentry
      0x00000000,                    // 0x80: addiu $t9,$t9,reentry

      0x0320f809,                    // 0x84: jalr $t9
      0x00000000,                    // 0x88: nop
      0x8fbf0064,                    // 0x8c: lw $ra,100($sp)
      0x8fbe0060,                    // 0x90: lw $fp,96($sp)
      0x8fb9005c,                    // 0x94: lw $t9,92($sp)
      0x8fb80058,                    // 0x98: lw $t8,88($sp)
      0x8faf0054,                    // 0x9c: lw $t7,84($sp)
      0x8fae0050,                    // 0xa0: lw $t6,80($sp)
      0x8fad004c,                    // 0xa4: lw $t5,76($sp)
      0x8fac0048,                    // 0xa8: lw $t4,72($sp)
      0x8fab0044,                    // 0xac: lw $t3,68($sp)
      0x8faa0040,                    // 0xb0: lw $t2,64($sp)
      0x8fa9003c,                    // 0xb4: lw $t1,60($sp)
      0x8fa80038,                    // 0xb8: lw $t0,56($sp)
      0x8fb70034,                    // 0xbc: lw $s7,52($sp)
      0x8fb60030,                    // 0xc0: lw $s6,48($sp)
      0x8fb5002c,                    // 0xc4: lw $s5,44($sp)
      0x8fb40028,                    // 0xc8: lw $s4,40($sp)
      0x8fb30024,                    // 0xcc: lw $s3,36($sp)
      0x8fb20020,                    // 0xd0: lw $s2,32($sp)
      0x8fb1001c,                    // 0xd4: lw $s1,28($sp)
      0x8fb00018,                    // 0xd8: lw $s0,24($sp)
      0x8fa70014,                    // 0xdc: lw $a3,20($sp)
      0x8fa60010,                    // 0xe0: lw $a2,16($sp)
      0x8fa5000c,                    // 0xe4: lw $a1,12($sp)
      0x8fa40008,                    // 0xe8: lw $a0,8($sp)
      0x27bd0068,                    // 0xec: addiu $sp,$sp,104
      0x0300f825,                    // 0xf0: move $ra, $t8
      0x03200008,                    // 0xf4: jr $t9
      0x00000000,                    // 0xf8: move $t9, $v0/v1
  };

  const unsigned ReentryFnAddrOffset = 0x7c;   // JIT re-entry fn addr lui
  const unsigned ReentryCtxAddrOffset = 0x6c;  // JIT re-entry context addr lui
  const unsigned Offsett = 0xf8;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));

  // Depending on endian return value will be in v0 or v1.
  uint32_t MoveVxT9 = isBigEndian ? 0x0060c825 : 0x0040c825;
  memcpy(ResolverWorkingMem + Offsett, &MoveVxT9, sizeof(MoveVxT9));

  uint32_t ReentryCtxLUi =
      0x3c040000 | (((ReentryCtxAddr + 0x8000) >> 16) & 0xFFFF);
  uint32_t ReentryCtxADDiu = 0x24840000 | ((ReentryCtxAddr)&0xFFFF);
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxLUi,
         sizeof(ReentryCtxLUi));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset + 4, &ReentryCtxADDiu,
         sizeof(ReentryCtxADDiu));

  uint32_t ReentryFnLUi =
      0x3c190000 | (((ReentryFnAddr + 0x8000) >> 16) & 0xFFFF);
  uint32_t ReentryFnADDiu = 0x27390000 | ((ReentryFnAddr)&0xFFFF);
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnLUi,
         sizeof(ReentryFnLUi));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset + 4, &ReentryFnADDiu,
         sizeof(ReentryFnADDiu));
}

void OrcMips32_Base::writeTrampolines(
    char *TrampolineBlockWorkingMem,
    JITTargetAddress TrampolineBlockTargetAddress,
    JITTargetAddress ResolverAddr, unsigned NumTrampolines) {

  assert((ResolverAddr >> 32) == 0 && "ResolverAddr out of range");

  uint32_t *Trampolines =
      reinterpret_cast<uint32_t *>(TrampolineBlockWorkingMem);
  uint32_t RHiAddr = ((ResolverAddr + 0x8000) >> 16);

  for (unsigned I = 0; I < NumTrampolines; ++I) {
    // move $t8,$ra
    // lui $t9,ResolverAddr
    // addiu $t9,$t9,ResolverAddr
    // jalr $t9
    // nop
    Trampolines[5 * I + 0] = 0x03e0c025;
    Trampolines[5 * I + 1] = 0x3c190000 | (RHiAddr & 0xFFFF);
    Trampolines[5 * I + 2] = 0x27390000 | (ResolverAddr & 0xFFFF);
    Trampolines[5 * I + 3] = 0x0320f809;
    Trampolines[5 * I + 4] = 0x00000000;
  }
}

void OrcMips32_Base::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  assert((StubsBlockTargetAddress >> 32) == 0 &&
         "InitialPtrVal is out of range");

  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 lui $t9, ptr1
  //                 lw $t9, %lo(ptr1)($t9)
  //                 jr $t9
  // stub2:
  //                 lui $t9, ptr2
  //                 lw $t9,%lo(ptr1)($t9)
  //                 jr $t9
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .word 0x0
  // ptr2:
  //                 .word 0x0
  //
  // i..

  assert(stubAndPointerRangesOk<OrcMips32_Base>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");

  // Populate the stubs page stubs and mark it executable.
  uint32_t *Stub = reinterpret_cast<uint32_t *>(StubsBlockWorkingMem);
  uint64_t PtrAddr = PointersBlockTargetAddress;

  for (unsigned I = 0; I < NumStubs; ++I) {
    uint32_t HiAddr = ((PtrAddr + 0x8000) >> 16);
    Stub[4 * I + 0] = 0x3c190000 | (HiAddr & 0xFFFF);  // lui $t9,ptr1
    Stub[4 * I + 1] = 0x8f390000 | (PtrAddr & 0xFFFF); // lw $t9,%lo(ptr1)($t9)
    Stub[4 * I + 2] = 0x03200008;                      // jr $t9
    Stub[4 * I + 3] = 0x00000000;                      // nop
    PtrAddr += 4;
  }
}

void OrcMips64::writeResolverCode(char *ResolverWorkingMem,
                                  JITTargetAddress ResolverTargetAddress,
                                  JITTargetAddress ReentryFnAddr,
                                  JITTargetAddress ReentryCtxAddr) {

  const uint32_t ResolverCode[] = {
       //resolver_entry:
      0x67bdff30,                     // 0x00: daddiu $sp,$sp,-208
      0xffa20000,                     // 0x04: sd v0,0(sp)
      0xffa30008,                     // 0x08: sd v1,8(sp)
      0xffa40010,                     // 0x0c: sd a0,16(sp)
      0xffa50018,                     // 0x10: sd a1,24(sp)
      0xffa60020,                     // 0x14: sd a2,32(sp)
      0xffa70028,                     // 0x18: sd a3,40(sp)
      0xffa80030,                     // 0x1c: sd a4,48(sp)
      0xffa90038,                     // 0x20: sd a5,56(sp)
      0xffaa0040,                     // 0x24: sd a6,64(sp)
      0xffab0048,                     // 0x28: sd a7,72(sp)
      0xffac0050,                     // 0x2c: sd t0,80(sp)
      0xffad0058,                     // 0x30: sd t1,88(sp)
      0xffae0060,                     // 0x34: sd t2,96(sp)
      0xffaf0068,                     // 0x38: sd t3,104(sp)
      0xffb00070,                     // 0x3c: sd s0,112(sp)
      0xffb10078,                     // 0x40: sd s1,120(sp)
      0xffb20080,                     // 0x44: sd s2,128(sp)
      0xffb30088,                     // 0x48: sd s3,136(sp)
      0xffb40090,                     // 0x4c: sd s4,144(sp)
      0xffb50098,                     // 0x50: sd s5,152(sp)
      0xffb600a0,                     // 0x54: sd s6,160(sp)
      0xffb700a8,                     // 0x58: sd s7,168(sp)
      0xffb800b0,                     // 0x5c: sd t8,176(sp)
      0xffb900b8,                     // 0x60: sd t9,184(sp)
      0xffbe00c0,                     // 0x64: sd fp,192(sp)
      0xffbf00c8,                     // 0x68: sd ra,200(sp)

      // JIT re-entry ctx addr.
      0x00000000,                     // 0x6c: lui $a0,heighest(ctx)
      0x00000000,                     // 0x70: daddiu $a0,$a0,heigher(ctx)
      0x00000000,                     // 0x74: dsll $a0,$a0,16
      0x00000000,                     // 0x78: daddiu $a0,$a0,hi(ctx)
      0x00000000,                     // 0x7c: dsll $a0,$a0,16
      0x00000000,                     // 0x80: daddiu $a0,$a0,lo(ctx)

      0x03e02825,                     // 0x84: move $a1, $ra
      0x64a5ffdc,                     // 0x88: daddiu $a1,$a1,-36

      // JIT re-entry fn addr:
      0x00000000,                     // 0x8c: lui $t9,reentry
      0x00000000,                     // 0x90: daddiu $t9,$t9,reentry
      0x00000000,                     // 0x94: dsll $t9,$t9,
      0x00000000,                     // 0x98: daddiu $t9,$t9,
      0x00000000,                     // 0x9c: dsll $t9,$t9,
      0x00000000,                     // 0xa0: daddiu $t9,$t9,
      0x0320f809,                     // 0xa4: jalr $t9
      0x00000000,                     // 0xa8: nop
      0xdfbf00c8,                     // 0xac: ld ra, 200(sp)
      0xdfbe00c0,                     // 0xb0: ld fp, 192(sp)
      0xdfb900b8,                     // 0xb4: ld t9, 184(sp)
      0xdfb800b0,                     // 0xb8: ld t8, 176(sp)
      0xdfb700a8,                     // 0xbc: ld s7, 168(sp)
      0xdfb600a0,                     // 0xc0: ld s6, 160(sp)
      0xdfb50098,                     // 0xc4: ld s5, 152(sp)
      0xdfb40090,                     // 0xc8: ld s4, 144(sp)
      0xdfb30088,                     // 0xcc: ld s3, 136(sp)
      0xdfb20080,                     // 0xd0: ld s2, 128(sp)
      0xdfb10078,                     // 0xd4: ld s1, 120(sp)
      0xdfb00070,                     // 0xd8: ld s0, 112(sp)
      0xdfaf0068,                     // 0xdc: ld t3, 104(sp)
      0xdfae0060,                     // 0xe0: ld t2, 96(sp)
      0xdfad0058,                     // 0xe4: ld t1, 88(sp)
      0xdfac0050,                     // 0xe8: ld t0, 80(sp)
      0xdfab0048,                     // 0xec: ld a7, 72(sp)
      0xdfaa0040,                     // 0xf0: ld a6, 64(sp)
      0xdfa90038,                     // 0xf4: ld a5, 56(sp)
      0xdfa80030,                     // 0xf8: ld a4, 48(sp)
      0xdfa70028,                     // 0xfc: ld a3, 40(sp)
      0xdfa60020,                     // 0x100: ld a2, 32(sp)
      0xdfa50018,                     // 0x104: ld a1, 24(sp)
      0xdfa40010,                     // 0x108: ld a0, 16(sp)
      0xdfa30008,                     // 0x10c: ld v1, 8(sp)
      0x67bd00d0,                     // 0x110: daddiu $sp,$sp,208
      0x0300f825,                     // 0x114: move $ra, $t8
      0x03200008,                     // 0x118: jr $t9
      0x0040c825,                     // 0x11c: move $t9, $v0
  };

  const unsigned ReentryFnAddrOffset = 0x8c;   // JIT re-entry fn addr lui
  const unsigned ReentryCtxAddrOffset = 0x6c;  // JIT re-entry ctx addr lui

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));

  uint32_t ReentryCtxLUi =
      0x3c040000 | (((ReentryCtxAddr + 0x800080008000) >> 48) & 0xFFFF);
  uint32_t ReentryCtxDADDiu =
      0x64840000 | (((ReentryCtxAddr + 0x80008000) >> 32) & 0xFFFF);
  uint32_t ReentryCtxDSLL = 0x00042438;
  uint32_t ReentryCtxDADDiu2 =
      0x64840000 | ((((ReentryCtxAddr + 0x8000) >> 16) & 0xFFFF));
  uint32_t ReentryCtxDSLL2 = 0x00042438;
  uint32_t ReentryCtxDADDiu3 = 0x64840000 | ((ReentryCtxAddr)&0xFFFF);

  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxLUi,
         sizeof(ReentryCtxLUi));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 4), &ReentryCtxDADDiu,
         sizeof(ReentryCtxDADDiu));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 8), &ReentryCtxDSLL,
         sizeof(ReentryCtxDSLL));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 12), &ReentryCtxDADDiu2,
         sizeof(ReentryCtxDADDiu2));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 16), &ReentryCtxDSLL2,
         sizeof(ReentryCtxDSLL2));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 20), &ReentryCtxDADDiu3,
         sizeof(ReentryCtxDADDiu3));

  uint32_t ReentryFnLUi =
      0x3c190000 | (((ReentryFnAddr + 0x800080008000) >> 48) & 0xFFFF);

  uint32_t ReentryFnDADDiu =
      0x67390000 | (((ReentryFnAddr + 0x80008000) >> 32) & 0xFFFF);

  uint32_t ReentryFnDSLL = 0x0019cc38;

  uint32_t ReentryFnDADDiu2 =
      0x67390000 | (((ReentryFnAddr + 0x8000) >> 16) & 0xFFFF);

  uint32_t ReentryFnDSLL2 = 0x0019cc38;

  uint32_t ReentryFnDADDiu3 = 0x67390000 | ((ReentryFnAddr)&0xFFFF);

  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnLUi,
         sizeof(ReentryFnLUi));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 4), &ReentryFnDADDiu,
         sizeof(ReentryFnDADDiu));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 8), &ReentryFnDSLL,
         sizeof(ReentryFnDSLL));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 12), &ReentryFnDADDiu2,
         sizeof(ReentryFnDADDiu2));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 16), &ReentryFnDSLL2,
         sizeof(ReentryFnDSLL2));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 20), &ReentryFnDADDiu3,
         sizeof(ReentryFnDADDiu3));
}

void OrcMips64::writeTrampolines(char *TrampolineBlockWorkingMem,
                                 JITTargetAddress TrampolineBlockTargetAddress,
                                 JITTargetAddress ResolverAddr,
                                 unsigned NumTrampolines) {

  uint32_t *Trampolines =
      reinterpret_cast<uint32_t *>(TrampolineBlockWorkingMem);

  uint64_t HeighestAddr = ((ResolverAddr + 0x800080008000) >> 48);
  uint64_t HeigherAddr = ((ResolverAddr + 0x80008000) >> 32);
  uint64_t HiAddr = ((ResolverAddr + 0x8000) >> 16);

  for (unsigned I = 0; I < NumTrampolines; ++I) {
    Trampolines[10 * I + 0] = 0x03e0c025;                            // move $t8,$ra
    Trampolines[10 * I + 1] = 0x3c190000 | (HeighestAddr & 0xFFFF);  // lui $t9,resolveAddr
    Trampolines[10 * I + 2] = 0x67390000 | (HeigherAddr & 0xFFFF);   // daddiu $t9,$t9,%higher(resolveAddr)
    Trampolines[10 * I + 3] = 0x0019cc38;                            // dsll $t9,$t9,16
    Trampolines[10 * I + 4] = 0x67390000 | (HiAddr & 0xFFFF);        // daddiu $t9,$t9,%hi(ptr)
    Trampolines[10 * I + 5] = 0x0019cc38;                            // dsll $t9,$t9,16
    Trampolines[10 * I + 6] =
        0x67390000 | (ResolverAddr & 0xFFFF); // daddiu $t9,$t9,%lo(ptr)
    Trampolines[10 * I + 7] = 0x0320f809;                            // jalr $t9
    Trampolines[10 * I + 8] = 0x00000000;                            // nop
    Trampolines[10 * I + 9] = 0x00000000;                            // nop
  }
}

void OrcMips64::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 lui $t9,ptr1
  //                 dsll $t9,$t9,16
  //                 daddiu $t9,$t9,%hi(ptr)
  //                 dsll $t9,$t9,16
  //                 ld $t9,%lo(ptr)
  //                 jr $t9
  // stub2:
  //                 lui $t9,ptr1
  //                 dsll $t9,$t9,16
  //                 daddiu $t9,$t9,%hi(ptr)
  //                 dsll $t9,$t9,16
  //                 ld $t9,%lo(ptr)
  //                 jr $t9
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .dword 0x0
  // ptr2:
  //                 .dword 0x0
  //
  // ...

  assert(stubAndPointerRangesOk<OrcMips64>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");

  // Populate the stubs page stubs and mark it executable.
  uint32_t *Stub = reinterpret_cast<uint32_t *>(StubsBlockWorkingMem);
  uint64_t PtrAddr = PointersBlockTargetAddress;

  for (unsigned I = 0; I < NumStubs; ++I, PtrAddr += 8) {
    uint64_t HeighestAddr = ((PtrAddr + 0x800080008000) >> 48);
    uint64_t HeigherAddr = ((PtrAddr + 0x80008000) >> 32);
    uint64_t HiAddr = ((PtrAddr + 0x8000) >> 16);
    Stub[8 * I + 0] = 0x3c190000 | (HeighestAddr & 0xFFFF);  // lui $t9,ptr1
    Stub[8 * I + 1] = 0x67390000 | (HeigherAddr & 0xFFFF);   // daddiu $t9,$t9,%higher(ptr)
    Stub[8 * I + 2] = 0x0019cc38;                            // dsll $t9,$t9,16
    Stub[8 * I + 3] = 0x67390000 | (HiAddr & 0xFFFF);        // daddiu $t9,$t9,%hi(ptr)
    Stub[8 * I + 4] = 0x0019cc38;                            // dsll $t9,$t9,16
    Stub[8 * I + 5] = 0xdf390000 | (PtrAddr & 0xFFFF);       // ld $t9,%lo(ptr)
    Stub[8 * I + 6] = 0x03200008;                            // jr $t9
    Stub[8 * I + 7] = 0x00000000;                            // nop
  }
}

void OrcRiscv64::writeResolverCode(char *ResolverWorkingMem,
                                   JITTargetAddress ResolverTargetAddress,
                                   JITTargetAddress ReentryFnAddr,
                                   JITTargetAddress ReentryCtxAddr) {

  const uint32_t ResolverCode[] = {
      0xef810113, // 0x00: addi sp,sp,-264
      0x00813023, // 0x04: sd s0,0(sp)
      0x00913423, // 0x08: sd s1,8(sp)
      0x01213823, // 0x0c: sd s2,16(sp)
      0x01313c23, // 0x10: sd s3,24(sp)
      0x03413023, // 0x14: sd s4,32(sp)
      0x03513423, // 0x18: sd s5,40(sp)
      0x03613823, // 0x1c: sd s6,48(sp)
      0x03713c23, // 0x20: sd s7,56(sp)
      0x05813023, // 0x24: sd s8,64(sp)
      0x05913423, // 0x28: sd s9,72(sp)
      0x05a13823, // 0x2c: sd s10,80(sp)
      0x05b13c23, // 0x30: sd s11,88(sp)
      0x06113023, // 0x34: sd ra,96(sp)
      0x06a13423, // 0x38: sd a0,104(sp)
      0x06b13823, // 0x3c: sd a1,112(sp)
      0x06c13c23, // 0x40: sd a2,120(sp)
      0x08d13023, // 0x44: sd a3,128(sp)
      0x08e13423, // 0x48: sd a4,136(sp)
      0x08f13823, // 0x4c: sd a5,144(sp)
      0x09013c23, // 0x50: sd a6,152(sp)
      0x0b113023, // 0x54: sd a7,160(sp)
      0x0a813427, // 0x58: fsd fs0,168(sp)
      0x0a913827, // 0x5c: fsd fs1,176(sp)
      0x0b213c27, // 0x60: fsd fs2,184(sp)
      0x0d313027, // 0x64: fsd fs3,192(sp)
      0x0d413427, // 0x68: fsd fs4,200(sp)
      0x0d513827, // 0x6c: fsd fs5,208(sp)
      0x0d613c27, // 0x70: fsd fs6,216(sp)
      0x0f713027, // 0x74: fsd fs7,224(sp)
      0x0f813427, // 0x78: fsd fs8,232(sp)
      0x0f913827, // 0x7c: fsd fs9,240(sp)
      0x0fa13c27, // 0x80: fsd fs10,248(sp)
      0x11b13027, // 0x84: fsd fs11,256(sp)
      0x00000517, // 0x88: auipc a0,0x0
      0x0b053503, // 0x8c: ld a0,176(a0) # 0x138
      0x00030593, // 0x90: mv a1,t1
      0xff458593, // 0x94: addi a1,a1,-12
      0x00000617, // 0x98: auipc a2,0x0
      0x0a863603, // 0x9c: ld a2,168(a2) # 0x140
      0x000600e7, // 0xa0: jalr a2
      0x00050293, // 0xa4: mv t0,a0
      0x00013403, // 0xa8: ld s0,0(sp)
      0x00813483, // 0xac: ld s1,8(sp)
      0x01013903, // 0xb0: ld s2,16(sp)
      0x01813983, // 0xb4: ld s3,24(sp)
      0x02013a03, // 0xb8: ld s4,32(sp)
      0x02813a83, // 0xbc: ld s5,40(sp)
      0x03013b03, // 0xc0: ld s6,48(sp)
      0x03813b83, // 0xc4: ld s7,56(sp)
      0x04013c03, // 0xc8: ld s8,64(sp)
      0x04813c83, // 0xcc: ld s9,72(sp)
      0x05013d03, // 0xd0: ld s10,80(sp)
      0x05813d83, // 0xd4: ld s11,88(sp)
      0x06013083, // 0xd8: ld ra,96(sp)
      0x06813503, // 0xdc: ld a0,104(sp)
      0x07013583, // 0xe0: ld a1,112(sp)
      0x07813603, // 0xe4: ld a2,120(sp)
      0x08013683, // 0xe8: ld a3,128(sp)
      0x08813703, // 0xec: ld a4,136(sp)
      0x09013783, // 0xf0: ld a5,144(sp)
      0x09813803, // 0xf4: ld a6,152(sp)
      0x0a013883, // 0xf8: ld a7,160(sp)
      0x0a813407, // 0xfc: fld fs0,168(sp)
      0x0b013487, // 0x100: fld fs1,176(sp)
      0x0b813907, // 0x104: fld fs2,184(sp)
      0x0c013987, // 0x108: fld fs3,192(sp)
      0x0c813a07, // 0x10c: fld fs4,200(sp)
      0x0d013a87, // 0x110: fld fs5,208(sp)
      0x0d813b07, // 0x114: fld fs6,216(sp)
      0x0e013b87, // 0x118: fld fs7,224(sp)
      0x0e813c07, // 0x11c: fld fs8,232(sp)
      0x0f013c87, // 0x120: fld fs9,240(sp)
      0x0f813d07, // 0x124: fld fs10,248(sp)
      0x10013d87, // 0x128: fld fs11,256(sp)
      0x10810113, // 0x12c: addi sp,sp,264
      0x00028067, // 0x130: jr t0
      0x12345678, // 0x134: padding to align at 8 byte
      0x12345678, // 0x138: Lreentry_ctx_ptr:
      0xdeadbeef, // 0x13c:      .quad 0
      0x98765432, // 0x140: Lreentry_fn_ptr:
      0xcafef00d  // 0x144:      .quad 0
  };

  const unsigned ReentryCtxAddrOffset = 0x138;
  const unsigned ReentryFnAddrOffset = 0x140;

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));
  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryFnAddr,
         sizeof(uint64_t));
  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxAddr,
         sizeof(uint64_t));
}

void OrcRiscv64::writeTrampolines(char *TrampolineBlockWorkingMem,
                                  JITTargetAddress TrampolineBlockTargetAddress,
                                  JITTargetAddress ResolverAddr,
                                  unsigned NumTrampolines) {

  unsigned OffsetToPtr = alignTo(NumTrampolines * TrampolineSize, 8);

  memcpy(TrampolineBlockWorkingMem + OffsetToPtr, &ResolverAddr,
         sizeof(uint64_t));

  uint32_t *Trampolines =
      reinterpret_cast<uint32_t *>(TrampolineBlockWorkingMem);
  for (unsigned I = 0; I < NumTrampolines; ++I, OffsetToPtr -= TrampolineSize) {
    uint32_t Hi20 = (OffsetToPtr + 0x800) & 0xFFFFF000;
    uint32_t Lo12 = OffsetToPtr - Hi20;
    Trampolines[4 * I + 0] = 0x00000297 | Hi20; // auipc t0, %hi(Lptr)
    Trampolines[4 * I + 1] =
        0x0002b283 | ((Lo12 & 0xFFF) << 20);    // ld t0, %lo(Lptr)
    Trampolines[4 * I + 2] = 0x00028367;        // jalr t1, t0
    Trampolines[4 * I + 3] = 0xdeadface;        // padding
  }
}

void OrcRiscv64::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 auipc   t0, %hi(ptr1)  ; PC-rel load of ptr1
  //                 ld      t0, %lo(t0)
  //                 jr      t0             ; Jump to resolver
  //                 .quad 0                ; Pad to 16 bytes
  // stub2:
  //                 auipc   t0, %hi(ptr1)  ; PC-rel load of ptr1
  //                 ld      t0, %lo(t0)
  //                 jr      t0             ; Jump to resolver
  //                 .quad 0
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .quad 0x0
  // ptr2:
  //                 .quad 0x0
  //
  // ...

  assert(stubAndPointerRangesOk<OrcRiscv64>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");

  uint32_t *Stub = reinterpret_cast<uint32_t *>(StubsBlockWorkingMem);

  for (unsigned I = 0; I < NumStubs; ++I) {
    uint64_t PtrDisplacement =
        PointersBlockTargetAddress - StubsBlockTargetAddress;
    uint32_t Hi20 = (PtrDisplacement + 0x800) & 0xFFFFF000;
    uint32_t Lo12 = PtrDisplacement - Hi20;
    Stub[4 * I + 0] = 0x00000297 | Hi20;                   // auipc t0, %hi(Lptr)
    Stub[4 * I + 1] = 0x0002b283 | ((Lo12 & 0xFFF) << 20); // ld t0, %lo(Lptr)
    Stub[4 * I + 2] = 0x00028067;                          // jr t0
    Stub[4 * I + 3] = 0xfeedbeef;                          // padding
    PointersBlockTargetAddress += PointerSize;
    StubsBlockTargetAddress += StubSize;
  }
}

void OrcLoongArch64::writeResolverCode(char *ResolverWorkingMem,
                                       JITTargetAddress ResolverTargetAddress,
                                       JITTargetAddress ReentryFnAddr,
                                       JITTargetAddress ReentryCtxAddr) {

  const uint32_t ResolverCode[] = {
      // resolver_entry:
      0x02fc8063, // 0x0: addi.d $r3,$r3,-224(0xf20)
      0x29c00064, // 0x4: st.d $r4,$r3,0
      0x29c02065, // 0x8: st.d $r5,$r3,8(0x8)
      0x29c04066, // 0xc: st.d $r6,$r3,16(0x10)
      0x29c06067, // 0x10: st.d $r7,$r3,24(0x18)
      0x29c08068, // 0x14: st.d $r8,$r3,32(0x20)
      0x29c0a069, // 0x18: st.d $r9,$r3,40(0x28)
      0x29c0c06a, // 0x1c: st.d $r10,$r3,48(0x30)
      0x29c0e06b, // 0x20: st.d $r11,$r3,56(0x38)
      0x29c1006c, // 0x24: st.d $r12,$r3,64(0x40)
      0x29c1206d, // 0x28: st.d $r13,$r3,72(0x48)
      0x29c1406e, // 0x2c: st.d $r14,$r3,80(0x50)
      0x29c1606f, // 0x30: st.d $r15,$r3,88(0x58)
      0x29c18070, // 0x34: st.d $r16,$r3,96(0x60)
      0x29c1a071, // 0x38: st.d $r17,$r3,104(0x68)
      0x29c1c072, // 0x3c: st.d $r18,$r3,112(0x70)
      0x29c1e073, // 0x40: st.d $r19,$r3,120(0x78)
      0x29c20074, // 0x44: st.d $r20,$r3,128(0x80)
      0x29c22076, // 0x48: st.d $r22,$r3,136(0x88)
      0x29c24077, // 0x4c: st.d $r23,$r3,144(0x90)
      0x29c26078, // 0x50: st.d $r24,$r3,152(0x98)
      0x29c28079, // 0x54: st.d $r25,$r3,160(0xa0)
      0x29c2a07a, // 0x58: st.d $r26,$r3,168(0xa8)
      0x29c2c07b, // 0x5c: st.d $r27,$r3,176(0xb0)
      0x29c2e07c, // 0x60: st.d $r28,$r3,184(0xb8)
      0x29c3007d, // 0x64: st.d $r29,$r3,192(0xc0)
      0x29c3207e, // 0x68: st.d $r30,$r3,200(0xc8)
      0x29c3407f, // 0x6c: st.d $r31,$r3,208(0xd0)
      0x29c36061, // 0x70: st.d $r1,$r3,216(0xd8)
      // JIT re-entry ctx addr.
      0x00000000, // 0x74: lu12i.w $a0,hi(ctx)
      0x00000000, // 0x78: ori $a0,$a0,lo(ctx)
      0x00000000, // 0x7c: lu32i.d $a0,higher(ctx)
      0x00000000, // 0x80: lu52i.d $a0,$a0,highest(ctx)

      0x00150025, // 0x84: move $r5,$r1
      0x02ffa0a5, // 0x88: addi.d $r5,$r5,-24(0xfe8)

      // JIT re-entry fn addr:
      0x00000000, // 0x8c: lu12i.w $t0,hi(reentry)
      0x00000000, // 0x90: ori $t0,$t0,lo(reentry)
      0x00000000, // 0x94: lu32i.d $t0,higher(reentry)
      0x00000000, // 0x98: lu52i.d $t0,$t0,highest(reentry)
      0x4c0002a1, // 0x9c: jirl $r1,$r21,0
      0x00150095, // 0xa0: move $r21,$r4
      0x28c36061, // 0xa4: ld.d $r1,$r3,216(0xd8)
      0x28c3407f, // 0xa8: ld.d $r31,$r3,208(0xd0)
      0x28c3207e, // 0xac: ld.d $r30,$r3,200(0xc8)
      0x28c3007d, // 0xb0: ld.d $r29,$r3,192(0xc0)
      0x28c2e07c, // 0xb4: ld.d $r28,$r3,184(0xb8)
      0x28c2c07b, // 0xb8: ld.d $r27,$r3,176(0xb0)
      0x28c2a07a, // 0xbc: ld.d $r26,$r3,168(0xa8)
      0x28c28079, // 0xc0: ld.d $r25,$r3,160(0xa0)
      0x28c26078, // 0xc4: ld.d $r24,$r3,152(0x98)
      0x28c24077, // 0xc8: ld.d $r23,$r3,144(0x90)
      0x28c22076, // 0xcc: ld.d $r22,$r3,136(0x88)
      0x28c20074, // 0xd0: ld.d $r20,$r3,128(0x80)
      0x28c1e073, // 0xd4: ld.d $r19,$r3,120(0x78)
      0x28c1c072, // 0xd8: ld.d $r18,$r3,112(0x70)
      0x28c1a071, // 0xdc: ld.d $r17,$r3,104(0x68)
      0x28c18070, // 0xe0: ld.d $r16,$r3,96(0x60)
      0x28c1606f, // 0xe4: ld.d $r15,$r3,88(0x58)
      0x28c1406e, // 0xe8: ld.d $r14,$r3,80(0x50)
      0x28c1206d, // 0xec: ld.d $r13,$r3,72(0x48)
      0x28c1006c, // 0xf0: ld.d $r12,$r3,64(0x40)
      0x28c0e06b, // 0xf4: ld.d $r11,$r3,56(0x38)
      0x28c0c06a, // 0xf8: ld.d $r10,$r3,48(0x30)
      0x28c0a069, // 0xfc: ld.d $r9,$r3,40(0x28)
      0x28c08068, // 0x100: ld.d $r8,$r3,32(0x20)
      0x28c06067, // 0x104: ld.d $r7,$r3,24(0x18)
      0x28c04066, // 0x108: ld.d $r6,$r3,16(0x10)
      0x28c02065, // 0x10c: ld.d $r5,$r3,8(0x8)
      0x28c00064, // 0x110: ld.d $r4,$r3,0
      0x02c38063, // 0x114: addi.d $r3,$r3,224(0xe0)
      0x00150281, // 0x118: move $r1,$r20
      0x4c0002a0, // 0x11c: jirl $r0,$r21,0
  };

  const unsigned ReentryFnAddrOffset = 0x8c;  // JIT re-entry fn addr lu12i.w
  const unsigned ReentryCtxAddrOffset = 0x74; // JIT re-entry ctx addr lu12i.w

  memcpy(ResolverWorkingMem, ResolverCode, sizeof(ResolverCode));

  uint32_t ReentryCtxLU12i = 0x14000004 | ((ReentryCtxAddr << 32 >> 44) << 5);
  uint32_t ReentryCtxORi = 0x03800084 | ((ReentryCtxAddr & 0xFFF) << 10);
  uint32_t ReentryCtxLU32i = 0x16000004 | ((ReentryCtxAddr << 12 >> 44) << 5);
  uint32_t ReentryCtxLU52i = 0x03000084 | ((ReentryCtxAddr >> 52) << 10);

  memcpy(ResolverWorkingMem + ReentryCtxAddrOffset, &ReentryCtxLU12i,
         sizeof(ReentryCtxLU12i));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 4), &ReentryCtxORi,
         sizeof(ReentryCtxORi));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 8), &ReentryCtxLU32i,
         sizeof(ReentryCtxLU32i));
  memcpy(ResolverWorkingMem + (ReentryCtxAddrOffset + 12), &ReentryCtxLU52i,
         sizeof(ReentryCtxLU52i));

  uint32_t ReentryLU12i = 0x14000015 | ((ReentryFnAddr << 32 >> 44) << 5);
  uint32_t ReentryORi = 0x038002b5 | ((ReentryFnAddr & 0xFFF) << 10);
  uint32_t ReentryLU32i = 0x16000015 | ((ReentryFnAddr << 12 >> 44) << 5);
  uint32_t ReentryLU52i = 0x030002b5 | ((ReentryFnAddr >> 52) << 10);

  memcpy(ResolverWorkingMem + ReentryFnAddrOffset, &ReentryLU12i,
         sizeof(ReentryLU12i));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 4), &ReentryORi,
         sizeof(ReentryORi));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 8), &ReentryLU32i,
         sizeof(ReentryLU32i));
  memcpy(ResolverWorkingMem + (ReentryFnAddrOffset + 12), &ReentryLU52i,
         sizeof(ReentryLU52i));
}

void OrcLoongArch64::writeTrampolines(
    char *TrampolineBlockWorkingMem,
    JITTargetAddress TrampolineBlockTargetAddress,
    JITTargetAddress ResolverFnAddr, unsigned NumTrampolines) {

  uint32_t *Trampolines =
      reinterpret_cast<uint32_t *>(TrampolineBlockWorkingMem);

  uint64_t HiBits = ((ResolverFnAddr << 32 >> 44) << 5);
  uint64_t LoBits = ((ResolverFnAddr & 0xFFF) << 10);
  uint64_t HigherBits = ((ResolverFnAddr << 12 >> 44) << 5);
  uint64_t HighestBits = ((ResolverFnAddr >> 52) << 10);

  for (unsigned I = 0; I < NumTrampolines; ++I) {
    Trampolines[10 * I + 0] = 0x00150034; // move $t8,$ra
    Trampolines[10 * I + 1] =
        0x14000015 | HiBits; // lu12i.w $r21,hi(ResolveAddr)
    Trampolines[10 * I + 2] =
        0x038002b5 | LoBits; // ori $r21,$r21,lo(ResolveAddr)
    Trampolines[10 * I + 3] =
        0x16000015 | HigherBits; // lu32i $r21,higher(ResolveAddr)
    Trampolines[10 * I + 4] =
        0x030002b5 | HighestBits; // lu52i $r21,$r21,highest(ResolveAddr)
    Trampolines[10 * I + 5] = 0x4c0002a1; // jirl $ra, $r21, 0
  }
}

void OrcLoongArch64::writeIndirectStubsBlock(
    char *StubsBlockWorkingMem, JITTargetAddress StubsBlockTargetAddress,
    JITTargetAddress PointersBlockTargetAddress, unsigned NumStubs) {
  // Stub format is:
  //
  // .section __orc_stubs
  // stub1:
  //                 lu12i.w $r21, %abs(ptr1)<<32>>44
  //                 ori $r21, $r21, %abs(ptr1)&0xfff
  //                 lu32i.d $r21, %abs(ptr1)<<12>>44
  //                 lu52i.d $r21, $r21, %abs(ptr1)>>52
  //                 ld.d $r21, $r21, 0
  //                 jirl $r0, $r21, 0
  // stub2:
  //                 lu12i.w $r21, %abs(ptr2)<<32>>44
  //                 ori $r21, $r21, %abs(ptr2)&0xfff
  //                 lu32i.d $r21, %abs(ptr2)<<12>>44
  //                 lu52i.d $r21, $r21, %abs(ptr2)>>52
  //                 ld.d $r21, $r21, 0
  //                 jirl $r0, $r21, 0
  //
  // ...
  //
  // .section __orc_ptrs
  // ptr1:
  //                 .dword 0x0
  // ptr2:
  //                 .dword 0x0
  //
  // ...

  assert(stubAndPointerRangesOk<OrcLoongArch64>(
             StubsBlockTargetAddress, PointersBlockTargetAddress, NumStubs) &&
         "PointersBlock is out of range");

  // Populate the stubs page stubs and mark it executable.
  uint32_t *Stub = reinterpret_cast<uint32_t *>(StubsBlockWorkingMem);
  uint64_t PtrAddr = PointersBlockTargetAddress;

  for (unsigned I = 0; I < NumStubs; ++I, PtrAddr += 8) {
    uint64_t HiBits = ((PtrAddr << 32 >> 44) << 5);
    uint64_t LoBits = ((PtrAddr & 0xFFF) << 10);
    uint64_t HigherBits = ((PtrAddr << 12 >> 44) << 5);
    uint64_t HighestBits = ((PtrAddr >> 52) << 10);
    Stub[8 * I + 0] = 0x14000015 | HiBits;     // lu12i.w $r21, hi(PtrAddr)
    Stub[8 * I + 1] = 0x038002b5 | LoBits;     // ori $r21, $r21, lo(PtrAddr)
    Stub[8 * I + 2] = 0x16000015 | HigherBits; // lu32i.d $r21, higher(PtrAddr)
    Stub[8 * I + 3] =
        0x030002b5 | HighestBits; // lu52i.d $r21, $r21, highest(PtrAddr)
    Stub[8 * I + 4] = 0x28c002b5; // ld.d $r21, $r21, 0
    Stub[8 * I + 5] = 0x4c0002a0; // jirl $r0, $r21, 0
  }
}

} // End namespace orc.
} // End namespace llvm.
