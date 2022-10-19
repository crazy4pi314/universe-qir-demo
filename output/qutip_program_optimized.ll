; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque
%Result = type opaque

define void @main() #0 {
entry:
  call void @__quantum__qis__rz__body(double 1.230000e-01, %Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__mz__body(%Qubit* null, %Result* null)
  call void @__quantum__qis__mz__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*), %Result* nonnull inttoptr (i64 1 to %Result*))
  %0 = call i1 @__quantum__qis__read_result__body(%Result* null)
  br i1 %0, label %then, label %continue

then:                                             ; preds = %entry
  call void @__quantum__qis__x__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue

continue:                                         ; preds = %entry, %then
  %1 = call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  br i1 %1, label %then1, label %continue3

then1:                                            ; preds = %continue
  call void @__quantum__qis__z__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  br label %continue3

continue3:                                        ; preds = %continue, %then1
  ret void
}

declare void @__quantum__qis__rz__body(double, %Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare void @__quantum__qis__mz__body(%Qubit*, %Result*)

declare i1 @__quantum__qis__read_result__body(%Result*)

declare void @__quantum__qis__x__body(%Qubit*)

declare void @__quantum__qis__z__body(%Qubit*)

declare void @__quantum__rt__array_start_record_output()

declare void @__quantum__rt__result_record_output(%Result*)

declare void @__quantum__rt__array_end_record_output()

attributes #0 = { "EntryPoint" "maxQubitIndex"="2" "maxResultIndex"="1" "requiredQubits"="3" "requiredResults"="2" }

