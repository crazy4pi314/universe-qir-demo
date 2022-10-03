namespace BellMeas {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation CheckBellState() : Int {
        use (q0, q1) = (Qubit(), Qubit());

        H(q0);
        CNOT(q0,q1);

        mutable number = 0;
        if M(q0) == One {
            set number += 2;
        }
        if M(q1) == One {
            set number += 1;
        }
        return number;
    }
}
