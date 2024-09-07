# Cpu0: a new backend in llvm 
This project is just a practice while learning llvm project.

Note: The LLVM project version is 18.1.8.

# Compile commands
Only compile Cpu0 backend that will speed up the compile process. ~~ Ofcourse you can remove '-DLLVM_TARGETS_TO_BUILD' to compiler all backends.~~
```
cmake -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Debug -DLLVM_TARGETS_TO_BUILD=Cpu0 -DLLVM_USE_LINKER=lld -G "Ninja" ../llvm

ninja
```

# understanding of TableGen
How to generate .inc file while tablegen working?

What's the structure of .inc file?




# backend structure
## RISCV 
llvm/lib/Target/RISCV:

llvm/lib/Target/RISCV/AsmParser:

llvm/lib/Target/RISCV/Disassembler:

llvm/lib/Target/RISCV/GISel:

llvm/lib/Target/RISCV/MAC:

llvm/lib/Target/RISCV/MCTargetDesc:

llvm/lib/Target/RISCV/TargetInfo:


## Cpu0
llvm/lib/Target/Cpu0:

    Cpu0.td 
        - Aggregating all .td files, works as the entry of .td.
    Cpu0InstrFormats.td
        - Describe the common properties of ISA.
    Cpu0InstrInfo.td
        - Describe the defination of instructions.
        - Define some SDNode, like Cpu0Ret.
    Cpu0RegisterInfo.td
        - Define all the registers and regitser sets(RegisterClass).
    Cpu0Schedule.td
        - Define some schedulers, which based on a class called InstrItinClass(IIC).
    Cpu0CallingConv.td
        - Calling convention.

    Cpu0.h
    Cpu0TargetMachine.cpp/hpp
        - Define classes Cpu0TargetMachie, Cpu0ebTargetMachie, Cpu0elTargetMacine, which defined parts about initial (DataLayout...).
        - Important function called getSubtargetImpl() can constaruct Subtarget object.
    Cpu0FrameLowering.cpp/hpp
        - Functional implementation of frame.
    Cpu0SEFrameLowering.cpp/hpp
        - Inherited from Cpu0FrameLowering class.
        - 'SE' means stardand edition.
    Cpu0InstrInfo.cpp/hpp
        - Describe instructions' function and movement, on the basis of Cpu0GenInstrInfo.inc.
        - Cpu0InstrInfo class Inherit from Cpu0GenInstrInfo calss, who is generate by tablegen.
    Cpu0SEInstrInfo.cpp/hpp
        - Only factory function now.
    Cpu0ISelLowering.cpp/hpp
        - Lowering LLVM IR to IR selectionDAG, and calling convention and handle global address.
    Cpu0SEISelLowering.cpp/hpp
        - Inheried form Cpu0ISelLowering class
    Cpu0MachineFunctionInfo.cpp/hpp
        - Deal with functions.
    Cpu0RegisterInfo.cpp/hpp
        - Define Cpu0RegisterInfo class based on Cpu0GenRegisterInfo.
    Cpu0SERegisterInfo.cpp/hpp
        - Inheried from Cpu0RegisterInfo class.
    Cpu0Subtarget.cpp/hpp
        - Define Cpu0Subtarget class.
    Cpu0TargetObjectFile.cpp/hpp
        - ELF formats.
llvm/lib/Target/Cpu0/MCTargetDesc:

    Cpu0MCTargetDesc.cpp
    Cpu0ABIInfo.cpp/hpp
        - Define ABI info and provide three kinds of ABI standards.

llvm/lib/Target/Cpu0/TargetInfo:

    Cpu0TargetInfo.cpp/hpp
        - Finish the registration of Cpu0 and Cpu0el
    
CMakeLists Files:
    In LLVM-PROJECT-18.1.8, this project do not use LLVMBuild.txt anmore. The message in LLVMBuild.txt should be move in CMakeList.txt like bellow.
```
add_llvm_target(Cpu0CodeGen
  Cpu0TargetMachine.cpp
  ...
  Cpu0TargetObjectFile.cpp

  LINK_COMPONENTS
  CodeGen Core MC
  Cpu0Desc
  Cpu0Info
  SelectionDAG
  Support
  Target

  ADD_TO_COMPONENT
  Cpu0
  )
```


# Resources:
1. [LLVM 后端实践笔记 by P2Tree](https://zhuanlan.zhihu.com/p/351848328)
2. [《Tutorial: Creating an LLVM Backend for the Cpu0 Architecture》](https://jonathan2251.github.io/lbd/about.html)
