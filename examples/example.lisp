(let ((q (make-qubit :id 1))
      (circuit (make-quantum-circuit :gates nil)))
  (add-gate circuit (hadamard-gate q))
  (add-gate circuit (pauli-x-gate q))
  (compile-circuit circuit)
  (simulate-circuit '(1 0)))