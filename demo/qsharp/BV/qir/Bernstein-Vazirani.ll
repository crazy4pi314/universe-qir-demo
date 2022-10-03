
%Qubit = type opaque
%Array = type opaque
%Result = type opaque
%Range = type { i64, i64, i64 }
%Tuple = type opaque
%String = type opaque

define internal i64 @Tests__Samples__BernVaz__BernsteinVaziraniTestCase__body() {
entry:
  %number = alloca i64, align 8
  %q0 = call %Qubit* @__quantum__rt__qubit_allocate()
  %qs = call %Array* @__quantum__rt__qubit_allocate_array(i64 5)
  call void @__quantum__rt__array_update_alias_count(%Array* %qs, i32 1)
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %q0)
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %__qsVar0__i__ = phi i64 [ 0, %entry ], [ %4, %exiting__1 ]
  %0 = icmp sle i64 %__qsVar0__i__, 4
  br i1 %0, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %1 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 %__qsVar0__i__)
  %2 = bitcast i8* %1 to %Qubit**
  %3 = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %3)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %4 = add i64 %__qsVar0__i__, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q0)
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 1)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = load %Qubit*, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %7, %Qubit* %q0)
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 3)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %10, %Qubit* %q0)
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 4)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %13, %Qubit* %q0)
  br label %preheader__1

preheader__1:                                     ; preds = %exit__1
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__1
  %__qsVar0____qsVar0__i____ = phi i64 [ 4, %preheader__1 ], [ %20, %exiting__2 ]
  %14 = icmp sle i64 %__qsVar0____qsVar0__i____, 0
  %15 = icmp sge i64 %__qsVar0____qsVar0__i____, 0
  %16 = select i1 false, i1 %14, i1 %15
  br i1 %16, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %17 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 %__qsVar0____qsVar0__i____)
  %18 = bitcast i8* %17 to %Qubit**
  %19 = load %Qubit*, %Qubit** %18, align 8
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %19)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %20 = add i64 %__qsVar0____qsVar0__i____, -1
  br label %header__2

exit__2:                                          ; preds = %header__2
  store i64 0, i64* %number, align 4
  br label %header__3

header__3:                                        ; preds = %exiting__3, %exit__2
  %i = phi i64 [ 0, %exit__2 ], [ %31, %exiting__3 ]
  %21 = icmp sle i64 %i, 4
  br i1 %21, label %body__3, label %exit__3

body__3:                                          ; preds = %header__3
  %22 = load i64, i64* %number, align 4
  %23 = mul i64 %22, 2
  store i64 %23, i64* %number, align 4
  %24 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qs, i64 %i)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = load %Qubit*, %Qubit** %25, align 8
  %27 = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %26)
  %28 = call %Result* @__quantum__rt__result_get_one()
  %29 = call i1 @__quantum__rt__result_equal(%Result* %27, %Result* %28)
  call void @__quantum__rt__result_update_reference_count(%Result* %27, i32 -1)
  br i1 %29, label %then0__1, label %continue__1

then0__1:                                         ; preds = %body__3
  %30 = add i64 %23, 1
  store i64 %30, i64* %number, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %body__3
  br label %exiting__3

exiting__3:                                       ; preds = %continue__1
  %31 = add i64 %i, 1
  br label %header__3

exit__3:                                          ; preds = %header__3
  %32 = load i64, i64* %number, align 4
  call void @__quantum__rt__array_update_alias_count(%Array* %qs, i32 -1)
  call void @__quantum__rt__qubit_release(%Qubit* %q0)
  call void @__quantum__rt__qubit_release_array(%Array* %qs)
  ret i64 %32
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__rt__qubit_release_array(%Array*)

declare void @__quantum__rt__array_update_alias_count(%Array*, i32)

define internal void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

define internal void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit)
  ret void
}

define internal %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %qubit) {
entry:
  %result = call %Result* @__quantum__qis__m__body(%Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PreparePostM____body(%Result* %result, %Qubit* %qubit)
  ret %Result* %result
}

declare %Result* @__quantum__rt__result_get_one()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

define internal double @Microsoft__Quantum__Math__PI__body() {
entry:
  ret double 0x400921FB54442D18
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____body(%Array* %ctls, %Array* %aux) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = srem i64 %0, 2
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %3 = sub i64 %0, 1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %3)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  %7 = sub i64 %0, 3
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %7)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = sub i64 %0, 2
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____body(%Qubit* %6, %Qubit* %10, %Qubit* %14)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  ret void
}

declare i64 @__quantum__rt__array_get_size_1d(%Array*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____adj(%Array* %ctls, %Array* %aux) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = srem i64 %0, 2
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %3 = sub i64 %0, 1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %3)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  %7 = sub i64 %0, 3
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %7)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = sub i64 %0, 2
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %11)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____adj(%Qubit* %6, %Qubit* %10, %Qubit* %14)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control1, %Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyControlledX____body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyControlledX____adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyUncontrolledH____body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyUncontrolledH____adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyUncontrolledX____body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

declare void @__quantum__qis__x__body(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__ApplyUncontrolledX____adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CCH____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__s__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__t__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CCZ____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__t__adj(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__s__adj(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CCH____adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CCNOT__adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CCZ____body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control2, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control2, %Qubit* %control1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CCZ____adj(%Qubit* %control1, %Qubit* %control2, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control2, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control2, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %target, %Qubit* %control1)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control2)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CH____body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CH____adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__S__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__S__adj(%Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 %adjustment) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = sub i64 %0, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %i = phi i64 [ 0, %preheader__1 ], [ %16, %exiting__1 ]
  %2 = icmp sle i64 %i, %1
  %3 = icmp sge i64 %i, %1
  %4 = select i1 true, i1 %2, i1 %3
  br i1 %4, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %i)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = load %Qubit*, %Qubit** %6, align 8
  %8 = add i64 %i, 1
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %8)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  %12 = sdiv i64 %i, 2
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %12)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____body(%Qubit* %7, %Qubit* %11, %Qubit* %15)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %16 = add i64 %i, 2
  br label %header__1

exit__1:                                          ; preds = %header__1
  %17 = sdiv i64 %0, 2
  %18 = sub i64 %17, 2
  %19 = sub i64 %18, %adjustment
  br label %header__2

header__2:                                        ; preds = %exiting__2, %exit__1
  %i__1 = phi i64 [ 0, %exit__1 ], [ %35, %exiting__2 ]
  %20 = icmp sle i64 %i__1, %19
  br i1 %20, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %21 = mul i64 %i__1, 2
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %21)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = load %Qubit*, %Qubit** %23, align 8
  %25 = mul i64 %i__1, 2
  %26 = add i64 %25, 1
  %27 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %26)
  %28 = bitcast i8* %27 to %Qubit**
  %29 = load %Qubit*, %Qubit** %28, align 8
  %30 = sdiv i64 %0, 2
  %31 = add i64 %i__1, %30
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %31)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____body(%Qubit* %24, %Qubit* %29, %Qubit* %34)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %35 = add i64 %i__1, 1
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 %adjustment) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = sdiv i64 %0, 2
  %2 = sub i64 %1, 2
  %3 = sub i64 %2, %adjustment
  %4 = sub i64 %3, 0
  %5 = sdiv i64 %4, 1
  %6 = mul i64 1, %5
  %7 = add i64 0, %6
  %8 = insertvalue %Range zeroinitializer, i64 %7, 0
  %9 = insertvalue %Range %8, i64 -1, 1
  %10 = insertvalue %Range %9, i64 0, 2
  %11 = extractvalue %Range %10, 0
  %12 = extractvalue %Range %10, 1
  %13 = extractvalue %Range %10, 2
  br label %preheader__1

preheader__1:                                     ; preds = %entry
  %14 = icmp sgt i64 %12, 0
  br label %header__1

header__1:                                        ; preds = %exiting__1, %preheader__1
  %__qsVar1__i__ = phi i64 [ %11, %preheader__1 ], [ %32, %exiting__1 ]
  %15 = icmp sle i64 %__qsVar1__i__, %13
  %16 = icmp sge i64 %__qsVar1__i__, %13
  %17 = select i1 %14, i1 %15, i1 %16
  br i1 %17, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %18 = mul i64 %__qsVar1__i__, 2
  %19 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %18)
  %20 = bitcast i8* %19 to %Qubit**
  %21 = load %Qubit*, %Qubit** %20, align 8
  %22 = mul i64 %__qsVar1__i__, 2
  %23 = add i64 %22, 1
  %24 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %23)
  %25 = bitcast i8* %24 to %Qubit**
  %26 = load %Qubit*, %Qubit** %25, align 8
  %27 = sdiv i64 %0, 2
  %28 = add i64 %__qsVar1__i__, %27
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %28)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____adj(%Qubit* %21, %Qubit* %26, %Qubit* %31)
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %32 = add i64 %__qsVar1__i__, %12
  br label %header__1

exit__1:                                          ; preds = %header__1
  %33 = sub i64 %0, 2
  %34 = sub i64 %33, 0
  %35 = sdiv i64 %34, 2
  %36 = mul i64 2, %35
  %37 = add i64 0, %36
  %38 = insertvalue %Range zeroinitializer, i64 %37, 0
  %39 = insertvalue %Range %38, i64 -2, 1
  %40 = insertvalue %Range %39, i64 0, 2
  %41 = extractvalue %Range %40, 0
  %42 = extractvalue %Range %40, 1
  %43 = extractvalue %Range %40, 2
  br label %preheader__2

preheader__2:                                     ; preds = %exit__1
  %44 = icmp sgt i64 %42, 0
  br label %header__2

header__2:                                        ; preds = %exiting__2, %preheader__2
  %__qsVar0__i__ = phi i64 [ %41, %preheader__2 ], [ %59, %exiting__2 ]
  %45 = icmp sle i64 %__qsVar0__i__, %43
  %46 = icmp sge i64 %__qsVar0__i__, %43
  %47 = select i1 %44, i1 %45, i1 %46
  br i1 %47, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %48 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %__qsVar0__i__)
  %49 = bitcast i8* %48 to %Qubit**
  %50 = load %Qubit*, %Qubit** %49, align 8
  %51 = add i64 %__qsVar0__i__, 1
  %52 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %51)
  %53 = bitcast i8* %52 to %Qubit**
  %54 = load %Qubit*, %Qubit** %53, align 8
  %55 = sdiv i64 %__qsVar0__i__, 2
  %56 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %55)
  %57 = bitcast i8* %56 to %Qubit**
  %58 = load %Qubit*, %Qubit** %57, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__PhaseCCX____adj(%Qubit* %50, %Qubit* %54, %Qubit* %58)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %59 = add i64 %__qsVar0__i__, %42
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CRz____body(%Qubit* %control, double %theta, %Qubit* %target) {
entry:
  %0 = fdiv double %theta, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %0, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  %1 = fneg double %theta
  %2 = fdiv double %1, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %2, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__body(double %theta, %Qubit* %qubit) {
entry:
  call void @__quantum__qis__rz__body(double %theta, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CRz____adj(%Qubit* %control, double %theta, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  %0 = fneg double %theta
  %1 = fdiv double %0, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %1, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  %2 = fdiv double %theta, 2.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %2, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %0, %Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CS____body(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %control)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CS____adj(%Qubit* %control, %Qubit* %target) {
entry:
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__body(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__adj(%Qubit* %control)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  call void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %__controlQubits__, %Qubit* %control)
  call void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %__controlQubits__, %Qubit* %target)
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { %Qubit*, %Qubit* }*
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 1
  store %Qubit* %control, %Qubit** %5, align 8
  store %Qubit* %target, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %4)
  call void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %__controlQubits__, %Qubit* %target)
  %7 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %8 = bitcast %Tuple* %7 to { %Qubit*, %Qubit* }*
  %9 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i32 0, i32 0
  %10 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i32 0, i32 1
  store %Qubit* %control, %Qubit** %9, align 8
  store %Qubit* %target, %Qubit** %10, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %8)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__t__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CT____body(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %7 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = sub i64 %7, 1
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %8)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 0)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____body(%Array* %ctls, %Array* %aux)
  %9 = sub i64 %7, 2
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %9)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CT____body(%Qubit* %12, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____adj(%Array* %ctls, %Array* %aux)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 0)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %ctls, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %target)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %9, %Qubit* %control, %Qubit* %target)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %10 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %11 = sub i64 %10, 1
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %11)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 0)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____body(%Array* %ctls, %Array* %aux)
  %12 = sub i64 %10, 2
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %12)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %15, %Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____adj(%Array* %ctls, %Array* %aux)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 0)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare %Tuple* @__quantum__rt__tuple_create(i64)

define internal void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__t__adj(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CT____adj(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %7 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = sub i64 %7, 1
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %8)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 0)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____body(%Array* %ctls, %Array* %aux)
  %9 = sub i64 %7, 2
  %10 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %9)
  %11 = bitcast i8* %10 to %Qubit**
  %12 = load %Qubit*, %Qubit** %11, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CT____adj(%Qubit* %12, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____adj(%Array* %ctls, %Array* %aux)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 0)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32)

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { %Qubit*, %Qubit* }*
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 1
  store %Qubit* %control, %Qubit** %5, align 8
  store %Qubit* %target, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %4)
  call void @Microsoft__Quantum__Intrinsic__T__ctl(%Array* %__controlQubits__, %Qubit* %target)
  %7 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %8 = bitcast %Tuple* %7 to { %Qubit*, %Qubit* }*
  %9 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i32 0, i32 0
  %10 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %8, i32 0, i32 1
  store %Qubit* %control, %Qubit** %9, align 8
  store %Qubit* %target, %Qubit** %10, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %8)
  call void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %__controlQubits__, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__T__ctladj(%Array* %__controlQubits__, %Qubit* %control)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %7, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %target = load %Qubit*, %Qubit** %2, align 8
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { %Qubit*, %Qubit* }*
  %5 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 0
  %6 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %4, i32 0, i32 1
  store %Qubit* %control, %Qubit** %5, align 8
  store %Qubit* %target, %Qubit** %6, align 8
  call void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CT____body(%Qubit* %control, %Qubit* %target) {
entry:
  %0 = call double @Microsoft__Quantum__Math__PI__body()
  %angle = fdiv double %0, 8.000000e+00
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %angle, %Qubit* %control)
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %angle, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %angle, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__CT____adj(%Qubit* %control, %Qubit* %target) {
entry:
  %0 = call double @Microsoft__Quantum__Math__PI__body()
  %__qsVar0__angle__ = fdiv double %0, 8.000000e+00
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__Rz__body(double %__qsVar0__angle__, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__CNOT__adj(%Qubit* %control, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %__qsVar0__angle__, %Qubit* %target)
  call void @Microsoft__Quantum__Intrinsic__Rz__adj(double %__qsVar0__angle__, %Qubit* %control)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic____QsRef21__PreparePostM____body(%Result* %result, %Qubit* %qubit) {
entry:
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__ctl(%Array* %ctls, { %Qubit*, %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control1 = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %control2 = load %Qubit*, %Qubit** %2, align 8
  %3 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 2
  %target = load %Qubit*, %Qubit** %3, align 8
  %4 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %then0__1, label %else__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %control1, %Qubit* %control2, %Qubit* %target)
  br label %continue__1

else__1:                                          ; preds = %entry
  %6 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 2)
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %6, i64 1)
  %10 = bitcast i8* %9 to %Qubit**
  store %Qubit* %control1, %Qubit** %8, align 8
  store %Qubit* %control2, %Qubit** %10, align 8
  %11 = call %Array* @__quantum__rt__array_concatenate(%Array* %ctls, %Array* %6)
  call void @__quantum__rt__array_update_reference_count(%Array* %11, i32 1)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %11, %Qubit* %target)
  call void @__quantum__rt__array_update_reference_count(%Array* %6, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %11, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %11, i32 -1)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %control = load %Qubit*, %Qubit** %5, align 8
  call void @__quantum__qis__cnot__body(%Qubit* %control, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %6 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %7 = icmp eq i64 %6, 2
  br i1 %7, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %10, %Qubit* %13, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %14 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %15 = sub i64 %14, 2
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %15)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %16 = srem i64 %14, 2
  %17 = sub i64 1, %16
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 %17)
  %18 = srem i64 %14, 2
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %then0__2, label %else__2

then0__2:                                         ; preds = %else__1
  %20 = sub i64 %14, 1
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %20)
  %22 = bitcast i8* %21 to %Qubit**
  %23 = load %Qubit*, %Qubit** %22, align 8
  %24 = sub i64 %14, 3
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %24)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %23, %Qubit* %27, %Qubit* %qubit)
  br label %continue__2

else__2:                                          ; preds = %else__1
  %28 = sub i64 %14, 3
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %28)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  %32 = sub i64 %14, 4
  %33 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %32)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = load %Qubit*, %Qubit** %34, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__body(%Qubit* %31, %Qubit* %35, %Qubit* %qubit)
  br label %continue__2

continue__2:                                      ; preds = %else__2, %then0__2
  %36 = srem i64 %14, 2
  %37 = sub i64 1, %36
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 %37)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %continue__2, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*)

declare void @__quantum__rt__array_update_reference_count(%Array*, i32)

define internal void @Microsoft__Quantum__Intrinsic__CCNOT__ctladj(%Array* %__controlQubits__, { %Qubit*, %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 0
  %control1 = load %Qubit*, %Qubit** %1, align 8
  %2 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 1
  %control2 = load %Qubit*, %Qubit** %2, align 8
  %3 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %0, i32 0, i32 2
  %target = load %Qubit*, %Qubit** %3, align 8
  %4 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* null, i32 1) to i64))
  %5 = bitcast %Tuple* %4 to { %Qubit*, %Qubit*, %Qubit* }*
  %6 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 0
  %7 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 1
  %8 = getelementptr inbounds { %Qubit*, %Qubit*, %Qubit* }, { %Qubit*, %Qubit*, %Qubit* }* %5, i32 0, i32 2
  store %Qubit* %control1, %Qubit** %6, align 8
  store %Qubit* %control2, %Qubit** %7, align 8
  store %Qubit* %target, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic__CCNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit*, %Qubit* }* %5)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %4, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CH____body(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %7 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = icmp eq i64 %7, 2
  br i1 %8, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  %12 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %13 = bitcast i8* %12 to %Qubit**
  %14 = load %Qubit*, %Qubit** %13, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CCH____body(%Qubit* %11, %Qubit* %14, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %15 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %16 = sub i64 %15, 1
  %17 = srem i64 %15, 2
  %18 = sub i64 %16, %17
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %18)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 0)
  %19 = srem i64 %15, 2
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %then0__2, label %else__2

then0__2:                                         ; preds = %else__1
  %21 = sub i64 %15, 1
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %21)
  %23 = bitcast i8* %22 to %Qubit**
  %24 = load %Qubit*, %Qubit** %23, align 8
  %25 = sub i64 %15, 3
  %26 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %25)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = load %Qubit*, %Qubit** %27, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CCH____body(%Qubit* %24, %Qubit* %28, %Qubit* %qubit)
  br label %continue__2

else__2:                                          ; preds = %else__1
  %29 = sub i64 %15, 3
  %30 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %29)
  %31 = bitcast i8* %30 to %Qubit**
  %32 = load %Qubit*, %Qubit** %31, align 8
  %33 = sub i64 %15, 4
  %34 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %33)
  %35 = bitcast i8* %34 to %Qubit**
  %36 = load %Qubit*, %Qubit** %35, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CCH____body(%Qubit* %32, %Qubit* %36, %Qubit* %qubit)
  br label %continue__2

continue__2:                                      ; preds = %else__2, %then0__2
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 0)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %continue__2, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

declare %Result* @__quantum__qis__m__body(%Qubit*)

declare void @__quantum__qis__rz__body(double, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %ctls, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__rz__body(double %theta, %Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %then1__1, label %else__1

then1__1:                                         ; preds = %test1__1
  %7 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %8 = bitcast i8* %7 to %Qubit**
  %9 = load %Qubit*, %Qubit** %8, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CRz____body(%Qubit* %9, double %theta, %Qubit* %qubit)
  br label %continue__1

else__1:                                          ; preds = %test1__1
  %10 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %11 = sub i64 %10, 1
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %11)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 0)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____body(%Array* %ctls, %Array* %aux)
  %12 = sub i64 %10, 2
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %12)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CRz____body(%Qubit* %15, double %theta, %Qubit* %qubit)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__AdjustForSingleControl____adj(%Array* %ctls, %Array* %aux)
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 0)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %else__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__Rz__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  %1 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 0
  %theta = load double, double* %1, align 8
  %2 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %0, i32 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2, align 8
  %3 = fneg double %theta
  %4 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ double, %Qubit* }* getelementptr ({ double, %Qubit* }, { double, %Qubit* }* null, i32 1) to i64))
  %5 = bitcast %Tuple* %4 to { double, %Qubit* }*
  %6 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %5, i32 0, i32 0
  %7 = getelementptr inbounds { double, %Qubit* }, { double, %Qubit* }* %5, i32 0, i32 1
  store double %3, double* %6, align 8
  store %Qubit* %qubit, %Qubit** %7, align 8
  call void @Microsoft__Quantum__Intrinsic__Rz__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %5)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %4, i32 -1)
  ret void
}

declare void @__quantum__qis__s__body(%Qubit*)

declare void @__quantum__qis__s__adj(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__S__ctl(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__s__body(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____body(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %7 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = icmp eq i64 %7, 2
  br i1 %8, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  %12 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %12, i64 0)
  %14 = bitcast i8* %13 to %Qubit**
  store %Qubit* %11, %Qubit** %14, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  %18 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %19 = bitcast %Tuple* %18 to { %Qubit*, %Qubit* }*
  %20 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %19, i32 0, i32 0
  %21 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %19, i32 0, i32 1
  store %Qubit* %17, %Qubit** %20, align 8
  store %Qubit* %qubit, %Qubit** %21, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctl(%Array* %12, { %Qubit*, %Qubit* }* %19)
  call void @__quantum__rt__array_update_reference_count(%Array* %12, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %18, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %22 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %23 = sub i64 %22, 2
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %23)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %24 = srem i64 %22, 2
  %25 = sub i64 1, %24
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 %25)
  %26 = srem i64 %22, 2
  %27 = icmp ne i64 %26, 0
  br i1 %27, label %then0__2, label %else__2

then0__2:                                         ; preds = %else__1
  %28 = sub i64 %22, 1
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %28)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  %32 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %33 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %32, i64 0)
  %34 = bitcast i8* %33 to %Qubit**
  store %Qubit* %31, %Qubit** %34, align 8
  %35 = sub i64 %22, 3
  %36 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %35)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = load %Qubit*, %Qubit** %37, align 8
  %39 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %40 = bitcast %Tuple* %39 to { %Qubit*, %Qubit* }*
  %41 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %40, i32 0, i32 0
  %42 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %40, i32 0, i32 1
  store %Qubit* %38, %Qubit** %41, align 8
  store %Qubit* %qubit, %Qubit** %42, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctl(%Array* %32, { %Qubit*, %Qubit* }* %40)
  call void @__quantum__rt__array_update_reference_count(%Array* %32, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %39, i32 -1)
  br label %continue__2

else__2:                                          ; preds = %else__1
  %43 = sub i64 %22, 3
  %44 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %43)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  %47 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %48 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %47, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  store %Qubit* %46, %Qubit** %49, align 8
  %50 = sub i64 %22, 4
  %51 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %50)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = load %Qubit*, %Qubit** %52, align 8
  %54 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %55 = bitcast %Tuple* %54 to { %Qubit*, %Qubit* }*
  %56 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %55, i32 0, i32 0
  %57 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %55, i32 0, i32 1
  store %Qubit* %53, %Qubit** %56, align 8
  store %Qubit* %qubit, %Qubit** %57, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctl(%Array* %47, { %Qubit*, %Qubit* }* %55)
  call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %continue__2

continue__2:                                      ; preds = %else__2, %then0__2
  %58 = srem i64 %22, 2
  %59 = sub i64 1, %58
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 %59)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %continue__2, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__S__ctladj(%Array* %ctls, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 1)
  %0 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %then0__1, label %test1__1

then0__1:                                         ; preds = %entry
  call void @__quantum__qis__s__adj(%Qubit* %qubit)
  br label %continue__1

test1__1:                                         ; preds = %entry
  %2 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %3 = icmp eq i64 %2, 1
  br i1 %3, label %then1__1, label %test2__1

then1__1:                                         ; preds = %test1__1
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  %6 = load %Qubit*, %Qubit** %5, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____adj(%Qubit* %6, %Qubit* %qubit)
  br label %continue__1

test2__1:                                         ; preds = %test1__1
  %7 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %8 = icmp eq i64 %7, 2
  br i1 %8, label %then2__1, label %else__1

then2__1:                                         ; preds = %test2__1
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 0)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  %12 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %12, i64 0)
  %14 = bitcast i8* %13 to %Qubit**
  store %Qubit* %11, %Qubit** %14, align 8
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 1)
  %16 = bitcast i8* %15 to %Qubit**
  %17 = load %Qubit*, %Qubit** %16, align 8
  %18 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %19 = bitcast %Tuple* %18 to { %Qubit*, %Qubit* }*
  %20 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %19, i32 0, i32 0
  %21 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %19, i32 0, i32 1
  store %Qubit* %17, %Qubit** %20, align 8
  store %Qubit* %qubit, %Qubit** %21, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctladj(%Array* %12, { %Qubit*, %Qubit* }* %19)
  call void @__quantum__rt__array_update_reference_count(%Array* %12, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %18, i32 -1)
  br label %continue__1

else__1:                                          ; preds = %test2__1
  %22 = call i64 @__quantum__rt__array_get_size_1d(%Array* %ctls)
  %23 = sub i64 %22, 2
  %aux = call %Array* @__quantum__rt__qubit_allocate_array(i64 %23)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 1)
  %24 = srem i64 %22, 2
  %25 = sub i64 1, %24
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____body(%Array* %ctls, %Array* %aux, i64 %25)
  %26 = srem i64 %22, 2
  %27 = icmp ne i64 %26, 0
  br i1 %27, label %then0__2, label %else__2

then0__2:                                         ; preds = %else__1
  %28 = sub i64 %22, 1
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %ctls, i64 %28)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  %32 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %33 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %32, i64 0)
  %34 = bitcast i8* %33 to %Qubit**
  store %Qubit* %31, %Qubit** %34, align 8
  %35 = sub i64 %22, 3
  %36 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %35)
  %37 = bitcast i8* %36 to %Qubit**
  %38 = load %Qubit*, %Qubit** %37, align 8
  %39 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %40 = bitcast %Tuple* %39 to { %Qubit*, %Qubit* }*
  %41 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %40, i32 0, i32 0
  %42 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %40, i32 0, i32 1
  store %Qubit* %38, %Qubit** %41, align 8
  store %Qubit* %qubit, %Qubit** %42, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctladj(%Array* %32, { %Qubit*, %Qubit* }* %40)
  call void @__quantum__rt__array_update_reference_count(%Array* %32, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %39, i32 -1)
  br label %continue__2

else__2:                                          ; preds = %else__1
  %43 = sub i64 %22, 3
  %44 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %43)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  %47 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %48 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %47, i64 0)
  %49 = bitcast i8* %48 to %Qubit**
  store %Qubit* %46, %Qubit** %49, align 8
  %50 = sub i64 %22, 4
  %51 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %aux, i64 %50)
  %52 = bitcast i8* %51 to %Qubit**
  %53 = load %Qubit*, %Qubit** %52, align 8
  %54 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Qubit*, %Qubit* }* getelementptr ({ %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* null, i32 1) to i64))
  %55 = bitcast %Tuple* %54 to { %Qubit*, %Qubit* }*
  %56 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %55, i32 0, i32 0
  %57 = getelementptr inbounds { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %55, i32 0, i32 1
  store %Qubit* %53, %Qubit** %56, align 8
  store %Qubit* %qubit, %Qubit** %57, align 8
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CS____ctladj(%Array* %47, { %Qubit*, %Qubit* }* %55)
  call void @__quantum__rt__array_update_reference_count(%Array* %47, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %54, i32 -1)
  br label %continue__2

continue__2:                                      ; preds = %else__2, %then0__2
  %58 = srem i64 %22, 2
  %59 = sub i64 1, %58
  call void @Microsoft__Quantum__Intrinsic____QsRef21__CollectControls____adj(%Array* %ctls, %Array* %aux, i64 %59)
  call void @__quantum__rt__array_update_alias_count(%Array* %aux, i32 -1)
  call void @__quantum__rt__qubit_release_array(%Array* %aux)
  br label %continue__1

continue__1:                                      ; preds = %continue__2, %then2__1, %then1__1, %then0__1
  call void @__quantum__rt__array_update_alias_count(%Array* %ctls, i32 -1)
  ret void
}

declare void @__quantum__qis__t__body(%Qubit*)

declare void @__quantum__qis__t__adj(%Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__X__adj(%Qubit* %qubit) {
entry:
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__X__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

define i64 @Tests__Samples__BernVaz__BernsteinVaziraniTestCase__Interop() #0 {
entry:
  %0 = call i64 @Tests__Samples__BernVaz__BernsteinVaziraniTestCase__body()
  ret i64 %0
}

define void @Tests__Samples__BernVaz__BernsteinVaziraniTestCase() #1 {
entry:
  %0 = call i64 @Tests__Samples__BernVaz__BernsteinVaziraniTestCase__body()
  %1 = call %String* @__quantum__rt__int_to_string(i64 %0)
  call void @__quantum__rt__message(%String* %1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__int_to_string(i64)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
