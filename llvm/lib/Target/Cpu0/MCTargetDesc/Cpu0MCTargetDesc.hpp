//===-- Cpu0TargetDesc.h - Cpu0 Target Descriptions -------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides Cpu0 specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_CPU0_MCTARGETDESC_CPU0MCTARGETDESC_H
#define LLVM_LIB_TARGET_CPU0_MCTARGETDESC_CPU0MCTARGETDESC_H

#include "llvm/Support/DataTypes.h"

namespace llvm {
  class Target;
  class Triple;
  class MCAsmBackend;
  class MCCodeEmitter;
  class MCContext;
  class MCInstrInfo;
  class MCObjectWriter;
  class MCRegisterInfo;
  class MCSubtargetInfo;
  class StringRef;

  class raw_ostream;

  Target &getTheCpu0Target();
  Target &getTheCpu0elTarget();
}

// Defines symbolic names for Cpu0 registers. This defines a mapping from
//  register name to register number.

#define GET_REGINFO_ENUM
#include "Cpu0GenRegisterInfo.inc"

#define GET_INSTRINFO_ENUM
#define GET_INSTRINFO_MC_HELPER_DECLS
#include "Cpu0GenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "Cpu0GenSubtargetInfo.inc"

#endif