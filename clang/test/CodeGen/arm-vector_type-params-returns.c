// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --version 3

// RUN: %clang_cc1 -DSVE_HEADER -triple aarch64 -target-feature +sve -emit-llvm -O2 -o - %s | opt -S -passes=mem2reg,sroa | FileCheck %s
// RUN: %clang_cc1 -DSVE_HEADER -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -disable-O0-optnone -Werror -Wall -o - /dev/null %s

// RUN: %clang_cc1 -DNEON_HEADER -triple aarch64 -target-feature +sve -emit-llvm -O2 -o - %s | opt -S -passes=mem2reg,sroa | FileCheck %s
// RUN: %clang_cc1 -DNEON_HEADER -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -disable-O0-optnone -Werror -Wall -o - /dev/null %s

// RUN: %clang_cc1 -DSVE_HEADER -DNEON_HEADER -triple aarch64 -target-feature +sve -emit-llvm -O2 -o - %s | opt -S -passes=mem2reg,sroa | FileCheck %s
// RUN: %clang_cc1 -DSVE_HEADER -DNEON_HEADER -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -disable-O0-optnone -Werror -Wall -o - /dev/null %s

// RUN: %clang_cc1 -DNEON_HEADER -DSVE_HEADER2  -triple aarch64 -target-feature +sve -emit-llvm -O2 -o - %s | opt -S -passes=mem2reg,sroa | FileCheck %s
// RUN: %clang_cc1 -DNEON_HEADER -DSVE_HEADER2 -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -disable-O0-optnone -Werror -Wall -o - /dev/null %s

// REQUIRES: aarch64-registered-target

#ifdef SVE_HEADER
  #include <arm_sve.h>
#endif

#ifdef NEON_HEADER
  #include <arm_neon.h>
#endif

#ifdef SVE_HEADER_2
  #include <arm_sve.h>
#endif

// function return types
// CHECK-LABEL: define dso_local noundef <8 x half> @test_ret_v8f16(
// CHECK-SAME: <8 x half> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0:[0-9]+]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <8 x half> [[V]]
//
float16x8_t test_ret_v8f16(float16x8_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <4 x float> @test_ret_v4f32(
// CHECK-SAME: <4 x float> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <4 x float> [[V]]
//
float32x4_t test_ret_v4f32(float32x4_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <2 x double> @test_ret_v2f64(
// CHECK-SAME: <2 x double> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <2 x double> [[V]]
//
float64x2_t test_ret_v2f64(float64x2_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <8 x bfloat> @test_ret_v8bf16(
// CHECK-SAME: <8 x bfloat> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <8 x bfloat> [[V]]
//
bfloat16x8_t test_ret_v8bf16(bfloat16x8_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <16 x i8> @test_ret_v16s8(
// CHECK-SAME: <16 x i8> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <16 x i8> [[V]]
//
int8x16_t test_ret_v16s8(int8x16_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <8 x i16> @test_ret_v8s16(
// CHECK-SAME: <8 x i16> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <8 x i16> [[V]]
//
int16x8_t test_ret_v8s16(int16x8_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <4 x i32> @test_ret_v32s4(
// CHECK-SAME: <4 x i32> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <4 x i32> [[V]]
//
int32x4_t test_ret_v32s4(int32x4_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <2 x i64> @test_ret_v64s2(
// CHECK-SAME: <2 x i64> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <2 x i64> [[V]]
//
int64x2_t test_ret_v64s2(int64x2_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <16 x i8> @test_ret_v16u8(
// CHECK-SAME: <16 x i8> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <16 x i8> [[V]]
//
uint8x16_t test_ret_v16u8(uint8x16_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <8 x i16> @test_ret_v8u16(
// CHECK-SAME: <8 x i16> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <8 x i16> [[V]]
//
uint16x8_t test_ret_v8u16(uint16x8_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <4 x i32> @test_ret_v32u4(
// CHECK-SAME: <4 x i32> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <4 x i32> [[V]]
//
uint32x4_t test_ret_v32u4(uint32x4_t v) {
  return v;
}

// CHECK-LABEL: define dso_local noundef <2 x i64> @test_ret_v64u2(
// CHECK-SAME: <2 x i64> noundef returned [[V:%.*]]) local_unnamed_addr #[[ATTR0]] {
// CHECK-NEXT:  entry:
// CHECK-NEXT:    ret <2 x i64> [[V]]
//
uint64x2_t test_ret_v64u2(uint64x2_t v) {
  return v;
}