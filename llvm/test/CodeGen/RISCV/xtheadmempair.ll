; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+xtheadmempair -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32XTHEADMEMPAIR
; RUN: llc -mtriple=riscv64 -mattr=+xtheadmempair -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64XTHEADMEMPAIR

define i64 @lwd(i32* %a) {
; RV32XTHEADMEMPAIR-LABEL: lwd:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 2, 3
; RV32XTHEADMEMPAIR-NEXT:    srai a3, a1, 31
; RV32XTHEADMEMPAIR-NEXT:    srai a4, a2, 31
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    add a3, a3, a4
; RV32XTHEADMEMPAIR-NEXT:    add a1, a3, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lwd:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 2, 3
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 4
  %2 = load i32, i32* %1, align 4
  %3 = getelementptr i32, i32* %a, i64 5
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %2 to i64
  %6 = sext i32 %4 to i64
  %7 = add i64 %5, %6
  ret i64 %7
}

define i64 @lwud(i32* %a) {
; RV32XTHEADMEMPAIR-LABEL: lwud:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 2, 3
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lwud:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.lwud a1, a2, (a0), 2, 3
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 4
  %2 = load i32, i32* %1, align 4
  %3 = getelementptr i32, i32* %a, i64 5
  %4 = load i32, i32* %3, align 4
  %5 = zext i32 %2 to i64
  %6 = zext i32 %4 to i64
  %7 = add i64 %5, %6
  ret i64 %7
}

define i64 @ldd(i64* %a) {
; RV32XTHEADMEMPAIR-LABEL: ldd:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    lw a1, 32(a0)
; RV32XTHEADMEMPAIR-NEXT:    lw a2, 36(a0)
; RV32XTHEADMEMPAIR-NEXT:    lw a3, 44(a0)
; RV32XTHEADMEMPAIR-NEXT:    lw a0, 40(a0)
; RV32XTHEADMEMPAIR-NEXT:    add a2, a2, a3
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a0
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    add a1, a2, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: ldd:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.ldd a1, a2, (a0), 2, 4
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 4
  %2 = load i64, i64* %1, align 8
  %3 = getelementptr i64, i64* %a, i64 5
  %4 = load i64, i64* %3, align 8
  %5 = add i64 %2, %4
  ret i64 %5
}

define i64 @lwd_0(i32* %a) {
; RV32XTHEADMEMPAIR-LABEL: lwd_0:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    srai a3, a1, 31
; RV32XTHEADMEMPAIR-NEXT:    srai a4, a2, 31
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    add a3, a3, a4
; RV32XTHEADMEMPAIR-NEXT:    add a1, a3, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lwd_0:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 0, 3
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 0
  %2 = load i32, i32* %1, align 4
  %3 = getelementptr i32, i32* %a, i64 1
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %2 to i64
  %6 = sext i32 %4 to i64
  %7 = add i64 %5, %6
  ret i64 %7
}

define i64 @lwud_0(i32* %a) {
; RV32XTHEADMEMPAIR-LABEL: lwud_0:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lwud_0:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.lwud a1, a2, (a0), 0, 3
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 0
  %2 = load i32, i32* %1, align 4
  %3 = getelementptr i32, i32* %a, i64 1
  %4 = load i32, i32* %3, align 4
  %5 = zext i32 %2 to i64
  %6 = zext i32 %4 to i64
  %7 = add i64 %5, %6
  ret i64 %7
}

define i64 @ldd_0(i64* %a) {
; RV32XTHEADMEMPAIR-LABEL: ldd_0:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a3, a4, (a0), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    add a2, a2, a4
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a3
; RV32XTHEADMEMPAIR-NEXT:    sltu a1, a0, a1
; RV32XTHEADMEMPAIR-NEXT:    add a1, a2, a1
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: ldd_0:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.ldd a1, a2, (a0), 0, 4
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 0
  %2 = load i64, i64* %1, align 8
  %3 = getelementptr i64, i64* %a, i64 1
  %4 = load i64, i64* %3, align 8
  %5 = add i64 %2, %4
  ret i64 %5
}

define void @swd(i32* %a, i32 %b, i32%c) {
; RV32XTHEADMEMPAIR-LABEL: swd:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 2, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: swd:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 2, 3
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 4
  store i32 %b, i32* %1, align 4
  %2 = getelementptr i32, i32* %a, i64 5
  store i32 %c, i32* %2, align 4
  ret void
}

define void @sdd(i64* %a, i64 %b, i64%c) {
; RV32XTHEADMEMPAIR-LABEL: sdd:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    sw a2, 36(a0)
; RV32XTHEADMEMPAIR-NEXT:    sw a1, 32(a0)
; RV32XTHEADMEMPAIR-NEXT:    sw a4, 44(a0)
; RV32XTHEADMEMPAIR-NEXT:    sw a3, 40(a0)
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: sdd:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.sdd a1, a2, (a0), 2, 4
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 4
  store i64 %b, i64* %1, align 8
  %2 = getelementptr i64, i64* %a, i64 5
  store i64 %c, i64* %2, align 8
  ret void
}

define void @swd_0(i32* %a, i32 %b, i32%c) {
; RV32XTHEADMEMPAIR-LABEL: swd_0:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: swd_0:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 0, 3
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i32, i32* %a, i64 0
  store i32 %b, i32* %1, align 4
  %2 = getelementptr i32, i32* %a, i64 1
  store i32 %c, i32* %2, align 4
  ret void
}

define void @sdd_0(i64* %a, i64 %b, i64%c) {
; RV32XTHEADMEMPAIR-LABEL: sdd_0:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    th.swd a3, a4, (a0), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: sdd_0:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.sdd a1, a2, (a0), 0, 4
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 0
  store i64 %b, i64* %1, align 8
  %2 = getelementptr i64, i64* %a, i64 1
  store i64 %c, i64* %2, align 8
  ret void
}

define i64 @ld64(i64* %a) {
; RV32XTHEADMEMPAIR-LABEL: ld64:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a2, a1, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    mv a0, a2
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: ld64:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    ld a0, 0(a0)
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 0
  %2 = load i64, i64* %1, align 8
  ret i64 %2
}

define i128 @ld128(i128* %a) {
; RV32XTHEADMEMPAIR-LABEL: ld128:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a2, a3, (a1), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a4, a5, (a1), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    th.swd a2, a3, (a0), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    th.swd a4, a5, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: ld128:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.ldd a2, a1, (a0), 0, 4
; RV64XTHEADMEMPAIR-NEXT:    mv a0, a2
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i128, i128* %a, i64 0
  %2 = load i128, i128* %1, align 8
  ret i128 %2
}

define void @sd64(i64* %a, i64 %b) {
; RV32XTHEADMEMPAIR-LABEL: sd64:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.swd a1, a2, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: sd64:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    sd a1, 0(a0)
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i64, i64* %a, i64 0
  store i64 %b, i64* %1, align 8
  ret void
}

define void @sd128(i128* %a, i128 %b) {
; RV32XTHEADMEMPAIR-LABEL: sd128:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a2, a3, (a1), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    th.lwd a4, a5, (a1), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    th.swd a2, a3, (a0), 1, 3
; RV32XTHEADMEMPAIR-NEXT:    th.swd a4, a5, (a0), 0, 3
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: sd128:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    th.sdd a1, a2, (a0), 0, 4
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i128, i128* %a, i64 0
  store i128 %b, i128* %1, align 8
  ret void
}

define i32 @lh(i16* %a) {
; RV32XTHEADMEMPAIR-LABEL: lh:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    lh a1, 0(a0)
; RV32XTHEADMEMPAIR-NEXT:    lh a0, 2(a0)
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a0
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lh:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    lh a1, 0(a0)
; RV64XTHEADMEMPAIR-NEXT:    lh a0, 2(a0)
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a0
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i16, i16* %a, i64 0
  %2 = load i16, i16* %1, align 4
  %3 = getelementptr i16, i16* %a, i64 1
  %4 = load i16, i16* %3, align 4
  %5 = sext i16 %2 to i32
  %6 = sext i16 %4 to i32
  %7 = add i32 %5, %6
  ret i32 %7
}

define i32 @lb(i8* %a) {
; RV32XTHEADMEMPAIR-LABEL: lb:
; RV32XTHEADMEMPAIR:       # %bb.0:
; RV32XTHEADMEMPAIR-NEXT:    lb a1, 0(a0)
; RV32XTHEADMEMPAIR-NEXT:    lb a0, 1(a0)
; RV32XTHEADMEMPAIR-NEXT:    add a0, a1, a0
; RV32XTHEADMEMPAIR-NEXT:    ret
;
; RV64XTHEADMEMPAIR-LABEL: lb:
; RV64XTHEADMEMPAIR:       # %bb.0:
; RV64XTHEADMEMPAIR-NEXT:    lb a1, 0(a0)
; RV64XTHEADMEMPAIR-NEXT:    lb a0, 1(a0)
; RV64XTHEADMEMPAIR-NEXT:    add a0, a1, a0
; RV64XTHEADMEMPAIR-NEXT:    ret
  %1 = getelementptr i8, i8* %a, i64 0
  %2 = load i8, i8* %1, align 4
  %3 = getelementptr i8, i8* %a, i64 1
  %4 = load i8, i8* %3, align 4
  %5 = sext i8 %2 to i32
  %6 = sext i8 %4 to i32
  %7 = add i32 %5, %6
  ret i32 %7
}