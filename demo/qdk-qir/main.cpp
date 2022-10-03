#include "QirRuntime.hpp"
#include "QirContext.hpp"
#include "SimFactory.hpp"

using namespace Microsoft::Quantum;
using namespace std;

extern "C" void BellMeas__CheckBellState(
); // QIR interop function.

int main(int argc, char* argv[])
{
    // Initialize simulator.
    auto sim = CreateFullstateSimulator();
    QirContextScope qirctx(sim.get(), true /*trackAllocatedObjects*/);

    // Execute the entry point operation.
    BellMeas__CheckBellState();

    return 0;
}