(defstruct quantum-circuit
  (gates :type list))

(defun add-gate (circuit gate)
  (push gate (quantum-circuit-gates circuit)))
