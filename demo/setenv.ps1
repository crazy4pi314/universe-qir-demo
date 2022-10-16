$env:LD_LIBRARY_PATH = "/workspaces/universe-qir-demo/demo/Microsoft.Quantum.Qir.Runtime.0.18.2107153383-alpha/runtimes/linux-x64/native"
$env:CPATH = "/workspaces/universe-qir-demo/demo/Microsoft.Quantum.Qir.Runtime.0.18.2107153383-alpha/runtimes/any/native/include"
. ./histogram.ps1

function global:prompt { "QIR-DEMO > " }

function global:rigetti-run {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [string]
        $bcPath,

        [Parameter()]
        [int]
        $shots
    )

    python3 /workspaces/universe-qir-demo/demo/quil-qir/pyquil_qir_demo.py $bcPath $shots | histogram
}

function global:qdk-run {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [string]
        $bcPath,

        [Parameter()]
        [int]
        $shots
    )

    if ($bcPath -like "*BellMeas*") {
        $main = "/workspaces/universe-qir-demo/demo/qdk-qir/main.cpp"
    } elseif ($bcPath -like "*Bernstein-Vazirani*") {
        $main = "/workspaces/universe-qir-demo/demo/qdk-qir/main2.cpp"
    }

    clang++-11 -w $main $bcPath -o /workspaces/universe-qir-demo/demo/qdk-qir/quantum_program `-L$env:LD_LIBRARY_PATH `-lMicrosoft.Quantum.Qir.Runtime `-lMicrosoft.Quantum.Qir.QSharp.Foundation `-lMicrosoft.Quantum.Qir.QSharp.Core
    1..$shots | %{/workspaces/universe-qir-demo/demo/qdk-qir/quantum_program} | histogram
}

function global:pnnl-run {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [string]
        $bcPath,

        [Parameter()]
        [int]
        $shots
    )

    if ($bcPath -like "*BellMeas*") {
        $target = "Bell_cpu"
    } elseif ($bcPath -like "*Bernstein-Vazirani*") {
        $target = "BernsteinVazirani_cpu"
    }

    Push-Location /workspaces/universe-qir-demo/demo/SV-Sim/svsim_qsharp_noise
    make $target
    1..$shots | %{. "./$target"} | histogram
    rm "./$target"
    Pop-Location
}

function global:compile-qsharp {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $folderPath
    )

    dotnet build $folderPath
    copy-item -Force (Join-Path $folderPath obj qsharp *.bc) .
    copy-item -Force (Join-Path $folderPath qir *.ll) .
}

function global:optimize-ir {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $bcPath
    )

    $bcOpt = Join-Path (Split-Path $bcPath -Parent) ((Split-Path $bcpath -LeafBase) + ".O3.bc")
    $llOpt = Join-Path (Split-Path $bcPath -Parent) ((Split-Path $bcpath -LeafBase) + ".O3.ll")
    clang++-11 -w -S $bcPath -emit-llvm -O3 -o $llOpt
    llvm-as-11 $llOpt -o $bcOpt
}

# clang++-11 ./main.cpp ./qsharp/BellMeas/obj/qsharp/BellMeas.bc -o bellmeas `-L$env:LD_LIBRARY_PATH `-lMicrosoft.Quantum.Qir.Runtime `-lMicrosoft.Quantum.Qir.QSharp.Foundation `-lMicrosoft.Quantum.Qir.QSharp.Core