(defstruct quantum-state
  (vector (make-array 2 :element-type 'complex))) ; for single qubit

(defun simulate-circuit (circuit initial-state)
  (let ((state (quantum-state-vector initial-state)))
    (dolist (gate (reverse (quantum-circuit-gates circuit)))
      (setf state (apply-gate gate state)))
    state))

(defun measure-state (state)
  (let ((prob (abs (aref state 0) (aref state 0))))
    (if (< (random 1.0) prob) 0 1))) ; simplified measurement
