#include "QirRuntime.hpp"
#include "QirContext.hpp"

#include "OpenSimRuntime.hpp"
#include "QSharpCoreShim.hpp"

using namespace Microsoft::Quantum;
using namespace std;

extern "C" void BellMeas__CheckBellState(
); // QIR interop function.

const char* NOISE_MODEL = "{\"initial_state\":{\"n_qubits\":1,\"data\":{\"Mixed\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[0,0]]}}},\"cnot\":{\"n_qubits\":2,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[4,4],\"data\":[[1,0],[0,0],[0,0],[0,0],[0,0],[1,0],[0,0],[0,0],[0,0],[0,0],[0,0],[1,0],[0,0],[0,0],[1,0],[0,0]]}}},\"i\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[1,0]]}}},\"s\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[0,1]]}}},\"s_adj\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[0,-1]]}}},\"t\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[0.7071067811865476,0.7071067811865476]]}}},\"t_adj\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[1,0],[0,0],[0,0],[0.7071067811865476,-0.7071067811865476]]}}},\"h\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[0.7071067811865476,0],[0.7071067811865476,0],[0.7071067811865476,0],[-0.7071067811865476,0]]}}},\"x\":{\"n_qubits\":1,\"data\":{\"KrausDecomposition\":{\"v\":1,\"dim\":[4,2,2],\"data\":[[0,0],[0.961769203083567,0],[0.9617692030835675,0],[0,0],[0,0],[0.15811388300841897,0],[-0.1581138830084189,0],[0,0],[0.22360679774997896,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0.22360679774997896,0]]}}},\"y\":{\"n_qubits\":1,\"data\":{\"Unitary\":{\"v\":1,\"dim\":[2,2],\"data\":[[0,0],[0,1],[0,-1],[0,0]]}}},\"z\":{\"n_qubits\":1,\"data\":{\"KrausDecomposition\":{\"v\":1,\"dim\":[2,2,2],\"data\":[[0.9746794344808962,0],[0,0],[0,0],[-0.9746794344808962,0],[0.2236067977499789,0],[0,0],[0,0],[0.22360679774997896,0]]}}},\"z_meas\":{\"effects\":[{\"n_qubits\":1,\"data\":{\"KrausDecomposition\":{\"v\":1,\"dim\":[1,2,2],\"data\":[[0.975,0],[0,0],[0,0],[0.025000000000000022,0]]}}},{\"n_qubits\":1,\"data\":{\"KrausDecomposition\":{\"v\":1,\"dim\":[1,2,2],\"data\":[[0.025000000000000022,0],[0,0],[0,0],[0.9749999999999999,0]]}}}]}}";

int main(int argc, char* argv[])
{
    // Initialize simulator.
    auto sim = COpenSimDriver();
    QirContextScope qirctx(&sim, true /*trackAllocatedObjects*/);

    set_noise_model(1, NOISE_MODEL);

    // Execute the entry point operation.
    BellMeas__CheckBellState();

    return 0;
}