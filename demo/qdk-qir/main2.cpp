#include "QirRuntime.hpp"
#include "QirContext.hpp"
#include "SimFactory.hpp"

using namespace Microsoft::Quantum;
using namespace std;

extern "C" void Tests__Samples__BernVaz__BernsteinVaziraniTestCase(
); // QIR interop function.

int main(int argc, char* argv[])
{
    // Initialize simulator.
    auto sim = CreateFullstateSimulator();
    QirContextScope qirctx(sim.get(), true /*trackAllocatedObjects*/);

    // Execute the entry point operation.
    Tests__Samples__BernVaz__BernsteinVaziraniTestCase();

    return 0;
}

extern "C"
{

    void __quantum__qis__x__body(QUBIT*);
    void __quantum__qis__x(QUBIT* qubit)
    {
        __quantum__qis__x__body(qubit);
    }

    void __quantum__qis__h__body(QUBIT*);
    void __quantum__qis__h(QUBIT* qubit)
    {
        __quantum__qis__h__body(qubit);
    }

    void __quantum__qis__x__ctl(QirArray*, QUBIT*);
    void __quantum__qis__cnot(QUBIT* control, QUBIT* target)
    {
        auto controls = quantum__rt__array_create_1d(8, 1);
        auto ctl = (QUBIT**)quantum__rt__array_get_element_ptr_1d(controls, 0);
        *ctl = control;
        __quantum__qis__x__ctl(controls, target);
        quantum__rt__array_update_reference_count(controls, -1);
    }

    Result __quantum__qis__measure__body(QirArray*, QirArray*);
    Result __quantum__qis__m__body(QUBIT* qubit)
    {
        auto paulis = quantum__rt__array_create_1d(1, 1);
        auto pauli = quantum__rt__array_get_element_ptr_1d(paulis, 0);
        *pauli = PauliId_Z;
        auto qubits = quantum__rt__array_create_1d(8, 1);
        auto qubitptr = (QUBIT**)quantum__rt__array_get_element_ptr_1d(qubits, 0);
        *qubitptr = qubit;
        auto res = __quantum__qis__measure__body(paulis, qubits);
        quantum__rt__array_update_reference_count(paulis, -1);
        quantum__rt__array_update_reference_count(qubits, -1);
        return res;
    }

    void __quantum__qis__cz(QUBIT*, QUBIT*)
    {
        //nop
    }
    void __quantum__qis__z(QUBIT*)
    {
        //nop
    }
    void __quantum__qis__s(QUBIT*)
    {
        //nop
    }
    void __quantum__qis__sadj(QUBIT*)
    {
        //nop
    }
    void __quantum__qis__t(QUBIT*)
    {
        //nop
    }
    void __quantum__qis__tadj(QUBIT*)
    {
        //nop
    }
    void __quantum__qis__rx(double, QUBIT*)
    {
        //nop
    }
    void __quantum__qis__ry(double, QUBIT*)
    {
        //nop
    }
    void __quantum__qis__rz(double, QUBIT*)
    {
        //nop
    }
}