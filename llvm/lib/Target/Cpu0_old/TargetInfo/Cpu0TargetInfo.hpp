//===-- Cpu0TargetInfo.hpp - Cpu0 Target Implementation ---------------*- C++ -*-===//
//
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_VE_TARGETINFO_VETARGETINFO_H
#define LLVM_LIB_TARGET_VE_TARGETINFO_VETARGETINFO_H

namespace llvm {

class Target;

Target &getTheCpu0Target();
Target &getTheCpu0elTarget();
} // namespace llvm

#endif 