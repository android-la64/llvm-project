//===- EhFrame.h ------------------------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLD_ELF_EHFRAME_H
#define LLD_ELF_EHFRAME_H

#include "lld/Common/LLVM.h"

namespace lld {
namespace elf {
class InputSectionBase;
struct EhSectionPiece;

uint8_t getFdeEncoding(EhSectionPiece *p);
void setPcRelativeEncoding(EhSectionPiece *p, uint8_t *buf);
bool hasLSDA(const EhSectionPiece &p);
} // namespace elf
} // namespace lld

#endif
