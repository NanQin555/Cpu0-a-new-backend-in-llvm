# Cpu0: a new backend in llvm 
This project is just a practice while learning llvm project.

Note: The LLVM project version is 18.1.8.

```
# Compile commands
cmake -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Debug -DLLVM_TARGETS_TO_BUILD=Cpu0 -DLLVM_USE_LINKER=lld -G "Ninja" ../llvm

ninja
```


Resources:
1. [LLVM 后端实践笔记 by P2Tree](https://zhuanlan.zhihu.com/p/351848328)
2. [《Tutorial: Creating an LLVM Backend for the Cpu0 Architecture》](https://jonathan2251.github.io/lbd/about.html)