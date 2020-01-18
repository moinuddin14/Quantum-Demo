namespace quantum_console_demo

{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation HelloQ () : Unit {
        Message("Hello quantum world!");

        mutable case00 = 0;
        mutable case01 = 0;
        mutable case02 = 0;
        mutable case03 = 0;

        // mutable zeroCount = 0;
        // mutable oneCount = 0;

        for(i in 1..1000) 
        {
            // using(qubits = Qubit[1])
            // {
            //     let r = M(qubits[0]);
            //     Message($"Before {r} ");

            //     // H(qubits[0]);
            //     X(qubits[0]);

            //     let result = M(qubits[0]);
            //     Message($"After {result}");
            //     if(result == Zero) {
            //         set zeroCount = zeroCount + 1;
            //     } else {
            //         set oneCount = oneCount + 1;
            //     }

            //     ResetAll(qubits);
            // }

            using(qubits = Qubit[2]) {
                H(qubits[0]);
                H(qubits[1]);

                CNOT(qubits[0], qubits[1]);

                DumpRegister("", qubits);

                let r1 = M(qubits[0]);
                let r2 = M(qubits[1]);

                Message($"Qubit set {i} : ");
                Message($"Value of 1st Qubit : {r1}");
                Message($"Value of 2nd Qubit : {r2}");

                if(r1 == Zero && r2 == Zero) {
                    set case00 = case00 + 1;
                }
                if(r1 == Zero && r2 == One) {
                    set case01 = case01 + 1;
                }
                if(r1 == One && r2 == Zero) {
                    set case02 = case02 + 1;
                }
                if(r1 == One && r2 == One) {
                    set case03 = case03 + 1;
                }

                ResetAll(qubits);
            }

        }
        // Message($"Zero Count {zeroCount} ; One Count {oneCount}");
        Message($"Case 00 : {case00} Case01 : {case01} Case02 : {case02} Case03 : {case03}");
    }
}
