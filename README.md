# Cpu0: a new backend in llvm 
This project is just a practice while learning llvm project.

Note: The LLVM project version is 18.1.8.

```
# Compile commands
cmake -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Debug -DLLVM_TARGETS_TO_BUILD=Cpu0 -DLLVM_USE_LINKER=lld -G "Ninja" ../llvm

ninja
```

# backend structure
llvm/lib/Target/Cpu0:
    Cpu0.td
    Cpu0CallingConv.td
    Cpu0InstrFormats.td
    Cpu0InstrInfo.td
    Cpu0RegisterInfo.td
    Cpu0Scheduler.td

    Cpu0.h
    Cpu0FrameLowering.cpp/hpp
    Cpu0InstrInfo.cpp/hpp
    Cpu0ISelLowering.cpp/hpp
    Cpu0MachineFunctionInfo.cpp/hpp
    Cpu0RegisterInfo.cpp/hpp
    Cpu0SEFrameLowering.cpp/hpp
    Cpu0SEInstrInfo.cpp/hpp
    Cpu0SEISelLowering.cpp/hpp
    Cpu0SERegisterInfo.cpp/hpp
    Cpu0Subtarget.cpp/hpp
    Cpu0TargetMachine.cpp/hpp
    Cpu0TargetObjectFile.cpp/hpp

llvm/lib/Target/Cpu0/MCTargetDesc:
    Cpu0ABIInfo.cpp/hpp
    Cpu0MCTargetDesc.cpp

llvm/lib/Target/Cpu0/TargetInfo:
    Cpu0TargetInfo.cpp/hpp
    

Resources:
1. [LLVM 后端实践笔记 by P2Tree](https://zhuanlan.zhihu.com/p/351848328)
2. [《Tutorial: Creating an LLVM Backend for the Cpu0 Architecture》](https://jonathan2251.github.io/lbd/about.html)