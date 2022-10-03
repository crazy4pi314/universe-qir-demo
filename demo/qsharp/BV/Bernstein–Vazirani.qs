namespace Tests.Samples.BernVaz {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation BernsteinVaziraniTestCase () : Int {
        // Simple BV looking for marked state 11 on five qubits, |01011⟩
        let nQubits = 5;
        use (q0, qs) = (Qubit(), Qubit[nQubits]);
        X(q0);
        within {
            for i in 0..nQubits-1 {
                H(qs[i]);
            }
        }
        apply {
            H(q0);
            CNOT(qs[1], q0);
            CNOT(qs[3], q0);
            CNOT(qs[4], q0);
        }
        mutable number = 0;
        for i in 0..nQubits-1 {
            set number *= 2;
            if M(qs[i]) == One {
                set number += 1;
            }
        }
        return number;
    }

}