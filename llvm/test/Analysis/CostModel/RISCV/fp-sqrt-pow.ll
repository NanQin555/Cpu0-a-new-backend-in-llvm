; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -passes="print<cost-model>" 2>&1 -disable-output -S -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+zvfh -riscv-v-vector-bits-min=-1 | FileCheck %s

define void @sqrt() {
; CHECK-LABEL: 'sqrt'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %1 = call half @llvm.sqrt.f16(half undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %2 = call <2 x half> @llvm.sqrt.v2f16(<2 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %3 = call <4 x half> @llvm.sqrt.v4f16(<4 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %4 = call <8 x half> @llvm.sqrt.v8f16(<8 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %5 = call <16 x half> @llvm.sqrt.v16f16(<16 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %6 = call <vscale x 2 x half> @llvm.sqrt.nxv2f16(<vscale x 2 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %7 = call <vscale x 4 x half> @llvm.sqrt.nxv4f16(<vscale x 4 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %8 = call <vscale x 8 x half> @llvm.sqrt.nxv8f16(<vscale x 8 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %9 = call <vscale x 16 x half> @llvm.sqrt.nxv16f16(<vscale x 16 x half> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %10 = call float @llvm.sqrt.f32(float undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %11 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %12 = call <4 x float> @llvm.sqrt.v4f32(<4 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %13 = call <8 x float> @llvm.sqrt.v8f32(<8 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %14 = call <16 x float> @llvm.sqrt.v16f32(<16 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %15 = call <vscale x 1 x float> @llvm.sqrt.nxv1f32(<vscale x 1 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %16 = call <vscale x 2 x float> @llvm.sqrt.nxv2f32(<vscale x 2 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %17 = call <vscale x 4 x float> @llvm.sqrt.nxv4f32(<vscale x 4 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %18 = call <vscale x 8 x float> @llvm.sqrt.nxv8f32(<vscale x 8 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %19 = call <vscale x 16 x float> @llvm.sqrt.nxv16f32(<vscale x 16 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %20 = call double @llvm.sqrt.f64(double undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %21 = call <2 x double> @llvm.sqrt.v2f64(<2 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %22 = call <4 x double> @llvm.sqrt.v4f64(<4 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %23 = call <8 x double> @llvm.sqrt.v8f64(<8 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %24 = call <16 x double> @llvm.sqrt.v16f64(<16 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %25 = call <vscale x 1 x double> @llvm.sqrt.nxv1f64(<vscale x 1 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %26 = call <vscale x 2 x double> @llvm.sqrt.nxv2f64(<vscale x 2 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %27 = call <vscale x 4 x double> @llvm.sqrt.nxv4f64(<vscale x 4 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %28 = call <vscale x 8 x double> @llvm.sqrt.nxv8f64(<vscale x 8 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
  call half @llvm.sqrt.f16(half undef)
  call <2 x half> @llvm.sqrt.v2f16(<2 x half> undef)
  call <4 x half> @llvm.sqrt.v4f16(<4 x half> undef)
  call <8 x half> @llvm.sqrt.v8f16(<8 x half> undef)
  call <16 x half> @llvm.sqrt.v16f16(<16 x half> undef)
  call <vscale x 2 x half> @llvm.sqrt.nvx2f16(<vscale x 2 x half> undef)
  call <vscale x 4 x half> @llvm.sqrt.nvx4f16(<vscale x 4 x half> undef)
  call <vscale x 8 x half> @llvm.sqrt.nvx8f16(<vscale x 8 x half> undef)
  call <vscale x 16 x half> @llvm.sqrt.nvx16f16(<vscale x 16 x half> undef)
  call float @llvm.sqrt.f32(float undef)
  call <2 x float> @llvm.sqrt.v2f32(<2 x float> undef)
  call <4 x float> @llvm.sqrt.v4f32(<4 x float> undef)
  call <8 x float> @llvm.sqrt.v8f32(<8 x float> undef)
  call <16 x float> @llvm.sqrt.v16f32(<16 x float> undef)
  call <vscale x 1 x float> @llvm.sqrt.nvx1f32(<vscale x 1 x float> undef)
  call <vscale x 2 x float> @llvm.sqrt.nvx2f32(<vscale x 2 x float> undef)
  call <vscale x 4 x float> @llvm.sqrt.nvx4f32(<vscale x 4 x float> undef)
  call <vscale x 8 x float> @llvm.sqrt.nvx8f32(<vscale x 8 x float> undef)
  call <vscale x 16 x float> @llvm.sqrt.nvx16f32(<vscale x 16 x float> undef)
  call double @llvm.sqrt.f64(double undef)
  call <2 x double> @llvm.sqrt.v2f64(<2 x double> undef)
  call <4 x double> @llvm.sqrt.v4f64(<4 x double> undef)
  call <8 x double> @llvm.sqrt.v8f64(<8 x double> undef)
  call <16 x double> @llvm.sqrt.v16f64(<16 x double> undef)
  call <vscale x 1 x double> @llvm.sqrt.nvx1f64(<vscale x 1 x double> undef)
  call <vscale x 2 x double> @llvm.sqrt.nvx2f64(<vscale x 2 x double> undef)
  call <vscale x 4 x double> @llvm.sqrt.nvx4f64(<vscale x 4 x double> undef)
  call <vscale x 8 x double> @llvm.sqrt.nvx8f64(<vscale x 8 x double> undef)
  ret void
}

declare half @llvm.sqrt.f16(half)
declare <2 x half> @llvm.sqrt.v2f16(<2 x half>)
declare <4 x half> @llvm.sqrt.v4f16(<4 x half>)
declare <8 x half> @llvm.sqrt.v8f16(<8 x half>)
declare <16 x half> @llvm.sqrt.v16f16(<16 x half>)
declare <vscale x 2 x half> @llvm.sqrt.nvx2f16(<vscale x 2 x half>)
declare <vscale x 4 x half> @llvm.sqrt.nvx4f16(<vscale x 4 x half>)
declare <vscale x 8 x half> @llvm.sqrt.nvx8f16(<vscale x 8 x half>)
declare <vscale x 16 x half> @llvm.sqrt.nvx16f16(<vscale x 16 x half>)
declare float @llvm.sqrt.f32(float)
declare <2 x float> @llvm.sqrt.v2f32(<2 x float>)
declare <4 x float> @llvm.sqrt.v4f32(<4 x float>)
declare <8 x float> @llvm.sqrt.v8f32(<8 x float>)
declare <16 x float> @llvm.sqrt.v16f32(<16 x float>)
declare <vscale x 1 x float> @llvm.sqrt.nvx1f32(<vscale x 1 x float>)
declare <vscale x 2 x float> @llvm.sqrt.nvx2f32(<vscale x 2 x float>)
declare <vscale x 4 x float> @llvm.sqrt.nvx4f32(<vscale x 4 x float>)
declare <vscale x 8 x float> @llvm.sqrt.nvx8f32(<vscale x 8 x float>)
declare <vscale x 16 x float> @llvm.sqrt.nvx16f32(<vscale x 16 x float>)
declare double @llvm.sqrt.f64(double)
declare <2 x double> @llvm.sqrt.v2f64(<2 x double>)
declare <4 x double> @llvm.sqrt.v4f64(<4 x double>)
declare <8 x double> @llvm.sqrt.v8f64(<8 x double>)
declare <16 x double> @llvm.sqrt.v16f64(<16 x double>)
declare <vscale x 1 x double> @llvm.sqrt.nvx1f64(<vscale x 1 x double>)
declare <vscale x 2 x double> @llvm.sqrt.nvx2f64(<vscale x 2 x double>)
declare <vscale x 4 x double> @llvm.sqrt.nvx4f64(<vscale x 4 x double>)
declare <vscale x 8 x double> @llvm.sqrt.nvx8f64(<vscale x 8 x double>)

define void @pow() {
; CHECK-LABEL: 'pow'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %1 = call float @llvm.pow.f32(float undef, float undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 23 for instruction: %2 = call <2 x float> @llvm.pow.v2f32(<2 x float> undef, <2 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 47 for instruction: %3 = call <4 x float> @llvm.pow.v4f32(<4 x float> undef, <4 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 95 for instruction: %4 = call <8 x float> @llvm.pow.v8f32(<8 x float> undef, <8 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 191 for instruction: %5 = call <16 x float> @llvm.pow.v16f32(<16 x float> undef, <16 x float> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %6 = call <vscale x 1 x float> @llvm.pow.nxv1f32(<vscale x 1 x float> undef, <vscale x 1 x float> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %7 = call <vscale x 2 x float> @llvm.pow.nxv2f32(<vscale x 2 x float> undef, <vscale x 2 x float> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %8 = call <vscale x 4 x float> @llvm.pow.nxv4f32(<vscale x 4 x float> undef, <vscale x 4 x float> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %9 = call <vscale x 8 x float> @llvm.pow.nxv8f32(<vscale x 8 x float> undef, <vscale x 8 x float> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %10 = call <vscale x 16 x float> @llvm.pow.nxv16f32(<vscale x 16 x float> undef, <vscale x 16 x float> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %11 = call double @llvm.pow.f64(double undef, double undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 23 for instruction: %12 = call <2 x double> @llvm.pow.v2f64(<2 x double> undef, <2 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 47 for instruction: %13 = call <4 x double> @llvm.pow.v4f64(<4 x double> undef, <4 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 95 for instruction: %14 = call <8 x double> @llvm.pow.v8f64(<8 x double> undef, <8 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 191 for instruction: %15 = call <16 x double> @llvm.pow.v16f64(<16 x double> undef, <16 x double> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %16 = call <vscale x 1 x double> @llvm.pow.nxv1f64(<vscale x 1 x double> undef, <vscale x 1 x double> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %17 = call <vscale x 2 x double> @llvm.pow.nxv2f64(<vscale x 2 x double> undef, <vscale x 2 x double> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %18 = call <vscale x 4 x double> @llvm.pow.nxv4f64(<vscale x 4 x double> undef, <vscale x 4 x double> undef)
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %19 = call <vscale x 8 x double> @llvm.pow.nxv8f64(<vscale x 8 x double> undef, <vscale x 8 x double> undef)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
  call float @llvm.pow.f32(float undef, float undef)
  call <2 x float> @llvm.pow.v2f32(<2 x float> undef, <2 x float> undef)
  call <4 x float> @llvm.pow.v4f32(<4 x float> undef, <4 x float> undef)
  call <8 x float> @llvm.pow.v8f32(<8 x float> undef, <8 x float> undef)
  call <16 x float> @llvm.pow.v16f32(<16 x float> undef, <16 x float> undef)
  call <vscale x 1 x float> @llvm.pow.nvx1f32(<vscale x 1 x float> undef, <vscale x 1 x float> undef)
  call <vscale x 2 x float> @llvm.pow.nvx2f32(<vscale x 2 x float> undef, <vscale x 2 x float> undef)
  call <vscale x 4 x float> @llvm.pow.nvx4f32(<vscale x 4 x float> undef, <vscale x 4 x float> undef)
  call <vscale x 8 x float> @llvm.pow.nvx8f32(<vscale x 8 x float> undef, <vscale x 8 x float> undef)
  call <vscale x 16 x float> @llvm.pow.nvx16f32(<vscale x 16 x float> undef, <vscale x 16 x float> undef)
  call double @llvm.pow.f64(double undef, double undef)
  call <2 x double> @llvm.pow.v2f64(<2 x double> undef, <2 x double> undef)
  call <4 x double> @llvm.pow.v4f64(<4 x double> undef, <4 x double> undef)
  call <8 x double> @llvm.pow.v8f64(<8 x double> undef, <8 x double> undef)
  call <16 x double> @llvm.pow.v16f64(<16 x double> undef, <16 x double> undef)
  call <vscale x 1 x double> @llvm.pow.nvx1f64(<vscale x 1 x double> undef, <vscale x 1 x double> undef)
  call <vscale x 2 x double> @llvm.pow.nvx2f64(<vscale x 2 x double> undef, <vscale x 2 x double> undef)
  call <vscale x 4 x double> @llvm.pow.nvx4f64(<vscale x 4 x double> undef, <vscale x 4 x double> undef)
  call <vscale x 8 x double> @llvm.pow.nvx8f64(<vscale x 8 x double> undef, <vscale x 8 x double> undef)
  ret void
}

declare float @llvm.pow.f32(float, float)
declare <2 x float> @llvm.pow.v2f32(<2 x float>, <2 x float>)
declare <4 x float> @llvm.pow.v4f32(<4 x float>, <4 x float>)
declare <8 x float> @llvm.pow.v8f32(<8 x float>, <8 x float>)
declare <16 x float> @llvm.pow.v16f32(<16 x float>, <16 x float>)
declare <vscale x 1 x float> @llvm.pow.nvx1f32(<vscale x 1 x float>, <vscale x 1 x float>)
declare <vscale x 2 x float> @llvm.pow.nvx2f32(<vscale x 2 x float>, <vscale x 2 x float>)
declare <vscale x 4 x float> @llvm.pow.nvx4f32(<vscale x 4 x float>, <vscale x 4 x float>)
declare <vscale x 8 x float> @llvm.pow.nvx8f32(<vscale x 8 x float>, <vscale x 8 x float>)
declare <vscale x 16 x float> @llvm.pow.nvx16f32(<vscale x 16 x float>, <vscale x 16 x float>)
declare double @llvm.pow.f64(double, double)
declare <2 x double> @llvm.pow.v2f64(<2 x double>, <2 x double>)
declare <4 x double> @llvm.pow.v4f64(<4 x double>, <4 x double>)
declare <8 x double> @llvm.pow.v8f64(<8 x double>, <8 x double>)
declare <16 x double> @llvm.pow.v16f64(<16 x double>, <16 x double>)
declare <vscale x 1 x double> @llvm.pow.nvx1f64(<vscale x 1 x double>, <vscale x 1 x double>)
declare <vscale x 2 x double> @llvm.pow.nvx2f64(<vscale x 2 x double>, <vscale x 2 x double>)
declare <vscale x 4 x double> @llvm.pow.nvx4f64(<vscale x 4 x double>, <vscale x 4 x double>)
declare <vscale x 8 x double> @llvm.pow.nvx8f64(<vscale x 8 x double>, <vscale x 8 x double>)