add_llvm_component_library(LLVMCpu0Desc
  Cpu0ABIInfo.cpp
  Cpu0MCAsmInfo.cpp
  Cpu0MCTargetDesc.cpp

  LINK_COMPONENTS
  MC
  Cpu0Info
  Support

  ADD_TO_COMPONENT
  Cpu0
  )