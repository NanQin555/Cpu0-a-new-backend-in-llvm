//===-- Cpu0SEInstrInfo.h - Cpu032/64 Instruction Information ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Cpu032/64 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_CPU0_CPU0SEINSTRINFO_H
#define LLVM_LIB_TARGET_CPU0_CPU0SEINSTRINFO_H

#include "Cpu0InstrInfo.hpp"
#include "Cpu0SERegisterInfo.hpp"
#include "Cpu0MachineFunctionInfo.hpp"

namespace llvm {

class Cpu0SEInstrInfo : public Cpu0InstrInfo {
  const Cpu0SERegisterInfo RI;

public:
  explicit Cpu0SEInstrInfo(const Cpu0Subtarget &STI);

  const Cpu0RegisterInfo &getRegisterInfo() const override;

};
} // End llvm namespace

#endif