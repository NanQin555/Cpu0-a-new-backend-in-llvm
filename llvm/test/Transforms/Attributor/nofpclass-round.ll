; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 2
; RUN: opt -aa-pipeline=basic-aa -passes=attributor -attributor-manifest-internal -S < %s | FileCheck %s --check-prefixes=CHECK
; RUN: opt -aa-pipeline=basic-aa -passes=attributor-light -attributor-manifest-internal -S < %s | FileCheck %s --check-prefixes=LIGHT

declare float @llvm.round.f32(float)
declare ppc_fp128 @llvm.round.ppcf128(ppc_fp128)

define float @ret_round(float %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round
; CHECK-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1:[0-9]+]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2:[0-9]+]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round
; LIGHT-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1:[0-9]+]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2:[0-9]+]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noinf(float nofpclass(inf) %arg0) {
; CHECK-LABEL: define nofpclass(inf sub) float @ret_round_noinf
; CHECK-SAME: (float nofpclass(inf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(inf sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noinf
; LIGHT-SAME: (float nofpclass(inf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopinf(float nofpclass(pinf) %arg0) {
; CHECK-LABEL: define nofpclass(pinf sub) float @ret_round_nopinf
; CHECK-SAME: (float nofpclass(pinf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(pinf sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopinf
; LIGHT-SAME: (float nofpclass(pinf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noninf(float nofpclass(ninf) %arg0) {
; CHECK-LABEL: define nofpclass(ninf sub) float @ret_round_noninf
; CHECK-SAME: (float nofpclass(ninf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(ninf sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noninf
; LIGHT-SAME: (float nofpclass(ninf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonan(float nofpclass(nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan sub) float @ret_round_nonan
; CHECK-SAME: (float nofpclass(nan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonan
; LIGHT-SAME: (float nofpclass(nan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noqnan(float nofpclass(qnan) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_noqnan
; CHECK-SAME: (float nofpclass(qnan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noqnan
; LIGHT-SAME: (float nofpclass(qnan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nosnan(float nofpclass(snan) %arg0) {
; CHECK-LABEL: define nofpclass(snan sub) float @ret_round_nosnan
; CHECK-SAME: (float nofpclass(snan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(snan sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nosnan
; LIGHT-SAME: (float nofpclass(snan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nozero(float nofpclass(zero) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nozero
; CHECK-SAME: (float nofpclass(zero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nozero
; LIGHT-SAME: (float nofpclass(zero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopzero(float nofpclass(pzero) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopzero
; CHECK-SAME: (float nofpclass(pzero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopzero
; LIGHT-SAME: (float nofpclass(pzero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonzero(float nofpclass(nzero) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonzero
; CHECK-SAME: (float nofpclass(nzero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonzero
; LIGHT-SAME: (float nofpclass(nzero sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonorm(float nofpclass(norm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonorm
; CHECK-SAME: (float nofpclass(sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonorm
; LIGHT-SAME: (float nofpclass(sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonnorm(float nofpclass(nnorm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonnorm
; CHECK-SAME: (float nofpclass(sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonnorm
; LIGHT-SAME: (float nofpclass(sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopnorm(float nofpclass(pnorm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopnorm
; CHECK-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopnorm
; LIGHT-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonsub(float nofpclass(nsub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonsub
; CHECK-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonsub
; LIGHT-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopsub(float nofpclass(psub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopsub
; CHECK-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopsub
; LIGHT-SAME: (float nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonorm_nosub(float nofpclass(norm sub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonorm_nosub
; CHECK-SAME: (float nofpclass(sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonorm_nosub
; LIGHT-SAME: (float nofpclass(sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopnorm_nopsub(float nofpclass(pnorm psub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopnorm_nopsub
; CHECK-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopnorm_nopsub
; LIGHT-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonnorm_nonsub(float nofpclass(nnorm nsub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonnorm_nonsub
; CHECK-SAME: (float nofpclass(sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonnorm_nonsub
; LIGHT-SAME: (float nofpclass(sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopnorm_nonsub(float nofpclass(pnorm nsub) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopnorm_nonsub
; CHECK-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopnorm_nonsub
; LIGHT-SAME: (float nofpclass(sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define ppc_fp128 @ret_round_ppcf128(ppc_fp128 %arg0) {
; CHECK-LABEL: define nofpclass(sub) ppc_fp128 @ret_round_ppcf128
; CHECK-SAME: (ppc_fp128 nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret ppc_fp128 [[CALL]]
;
; LIGHT-LABEL: define ppc_fp128 @ret_round_ppcf128
; LIGHT-SAME: (ppc_fp128 nofpclass(sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret ppc_fp128 [[CALL]]
;
  %call = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 %arg0)
  ret ppc_fp128 %call
}

define ppc_fp128 @ret_round_noinf_ppcf128(ppc_fp128 nofpclass(inf) %arg0) {
; CHECK-LABEL: define nofpclass(sub) ppc_fp128 @ret_round_noinf_ppcf128
; CHECK-SAME: (ppc_fp128 nofpclass(inf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret ppc_fp128 [[CALL]]
;
; LIGHT-LABEL: define ppc_fp128 @ret_round_noinf_ppcf128
; LIGHT-SAME: (ppc_fp128 nofpclass(inf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret ppc_fp128 [[CALL]]
;
  %call = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 %arg0)
  ret ppc_fp128 %call
}

define ppc_fp128 @ret_round_nopinf_ppcf128(ppc_fp128 nofpclass(pinf) %arg0) {
; CHECK-LABEL: define nofpclass(sub) ppc_fp128 @ret_round_nopinf_ppcf128
; CHECK-SAME: (ppc_fp128 nofpclass(pinf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret ppc_fp128 [[CALL]]
;
; LIGHT-LABEL: define ppc_fp128 @ret_round_nopinf_ppcf128
; LIGHT-SAME: (ppc_fp128 nofpclass(pinf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret ppc_fp128 [[CALL]]
;
  %call = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 %arg0)
  ret ppc_fp128 %call
}

define ppc_fp128 @ret_round_noninf_ppcf128(ppc_fp128 nofpclass(ninf) %arg0) {
; CHECK-LABEL: define nofpclass(sub) ppc_fp128 @ret_round_noninf_ppcf128
; CHECK-SAME: (ppc_fp128 nofpclass(ninf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret ppc_fp128 [[CALL]]
;
; LIGHT-LABEL: define ppc_fp128 @ret_round_noninf_ppcf128
; LIGHT-SAME: (ppc_fp128 nofpclass(ninf sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret ppc_fp128 [[CALL]]
;
  %call = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 %arg0)
  ret ppc_fp128 %call
}

define ppc_fp128 @ret_round_nonan_ppcf128(ppc_fp128 nofpclass(nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan sub) ppc_fp128 @ret_round_nonan_ppcf128
; CHECK-SAME: (ppc_fp128 nofpclass(nan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan sub) ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret ppc_fp128 [[CALL]]
;
; LIGHT-LABEL: define ppc_fp128 @ret_round_nonan_ppcf128
; LIGHT-SAME: (ppc_fp128 nofpclass(nan sub) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret ppc_fp128 [[CALL]]
;
  %call = call ppc_fp128 @llvm.round.ppcf128(ppc_fp128 %arg0)
  ret ppc_fp128 %call
}

define float @ret_round_noneg(float nofpclass(ninf nsub nnorm) %arg0) {
; CHECK-LABEL: define nofpclass(ninf sub) float @ret_round_noneg
; CHECK-SAME: (float nofpclass(ninf sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(ninf sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noneg
; LIGHT-SAME: (float nofpclass(ninf sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noneg_nonegzero(float nofpclass(ninf nsub nnorm nzero) %arg0) {
; CHECK-LABEL: define nofpclass(ninf nzero sub nnorm) float @ret_round_noneg_nonegzero
; CHECK-SAME: (float nofpclass(ninf nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(ninf nzero sub nnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noneg_nonegzero
; LIGHT-SAME: (float nofpclass(ninf nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noneg_nonegzero_nonan(float nofpclass(ninf nsub nnorm nzero nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan ninf nzero sub nnorm) float @ret_round_noneg_nonegzero_nonan
; CHECK-SAME: (float nofpclass(nan ninf nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan ninf nzero sub nnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noneg_nonegzero_nonan
; LIGHT-SAME: (float nofpclass(nan ninf nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noneg_nozero(float nofpclass(ninf nsub nnorm zero) %arg0) {
; CHECK-LABEL: define nofpclass(ninf nzero sub nnorm) float @ret_round_noneg_nozero
; CHECK-SAME: (float nofpclass(ninf zero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(ninf nzero sub nnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noneg_nozero
; LIGHT-SAME: (float nofpclass(ninf zero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_noneg_nozero_nonan(float nofpclass(ninf nsub nnorm zero nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan ninf nzero sub nnorm) float @ret_round_noneg_nozero_nonan
; CHECK-SAME: (float nofpclass(nan ninf zero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan ninf nzero sub nnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_noneg_nozero_nonan
; LIGHT-SAME: (float nofpclass(nan ninf zero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopos(float nofpclass(pinf psub pnorm) %arg0) {
; CHECK-LABEL: define nofpclass(pinf sub) float @ret_round_nopos
; CHECK-SAME: (float nofpclass(pinf sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(pinf sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopos
; LIGHT-SAME: (float nofpclass(pinf sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopos_nopzero(float nofpclass(pinf psub pnorm pzero) %arg0) {
; CHECK-LABEL: define nofpclass(pinf pzero sub pnorm) float @ret_round_nopos_nopzero
; CHECK-SAME: (float nofpclass(pinf pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(pinf pzero sub pnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopos_nopzero
; LIGHT-SAME: (float nofpclass(pinf pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopos_nopzero_nonan(float nofpclass(pinf psub pnorm pzero nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan pinf pzero sub pnorm) float @ret_round_nopos_nopzero_nonan
; CHECK-SAME: (float nofpclass(nan pinf pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan pinf pzero sub pnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopos_nopzero_nonan
; LIGHT-SAME: (float nofpclass(nan pinf pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopos_nozero(float nofpclass(pinf psub pnorm zero) %arg0) {
; CHECK-LABEL: define nofpclass(pinf pzero sub pnorm) float @ret_round_nopos_nozero
; CHECK-SAME: (float nofpclass(pinf zero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(pinf pzero sub pnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopos_nozero
; LIGHT-SAME: (float nofpclass(pinf zero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopos_nozero_nonan(float nofpclass(pinf psub pnorm zero nan) %arg0) {
; CHECK-LABEL: define nofpclass(nan pinf pzero sub pnorm) float @ret_round_nopos_nozero_nonan
; CHECK-SAME: (float nofpclass(nan pinf zero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(nan pinf pzero sub pnorm) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopos_nozero_nonan
; LIGHT-SAME: (float nofpclass(nan pinf zero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nopzero_nopnorm(float nofpclass(pzero pnorm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nopzero_nopnorm
; CHECK-SAME: (float nofpclass(pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nopzero_nopnorm
; LIGHT-SAME: (float nofpclass(pzero sub pnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nonzero_nonnorm(float nofpclass(nzero nnorm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nonzero_nonnorm
; CHECK-SAME: (float nofpclass(nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nonzero_nonnorm
; LIGHT-SAME: (float nofpclass(nzero sub nnorm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}

define float @ret_round_nozero_nonorm(float nofpclass(zero norm) %arg0) {
; CHECK-LABEL: define nofpclass(sub) float @ret_round_nozero_nonorm
; CHECK-SAME: (float nofpclass(zero sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[CALL:%.*]] = call nofpclass(sub) float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; CHECK-NEXT:    ret float [[CALL]]
;
; LIGHT-LABEL: define float @ret_round_nozero_nonorm
; LIGHT-SAME: (float nofpclass(zero sub norm) [[ARG0:%.*]]) #[[ATTR1]] {
; LIGHT-NEXT:    [[CALL:%.*]] = call float @llvm.round.f32(float [[ARG0]]) #[[ATTR2]]
; LIGHT-NEXT:    ret float [[CALL]]
;
  %call = call float @llvm.round.f32(float %arg0)
  ret float %call
}