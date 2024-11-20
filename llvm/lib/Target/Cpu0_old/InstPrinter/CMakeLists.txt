add_llvm_library(LLVMCpu0AsmPrinter
  Cpu0InstPrinter.cpp

  LINK_COMPONENTS
  MC
  Support

  ADD_TO_COMPONENT
  Cpu0
  )