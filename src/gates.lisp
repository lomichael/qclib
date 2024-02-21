(defstruct gate
  (name :type symbol)
  (matrix :type array))

(defparameter *hadamard-matrix*
  (make-array '(2 2) :element-type 'complex :initial-contents '((0.7071067811865475d0 0.7071067811865475d0) (0.7071067811865475d0 -0.7071067811865475d0))))

(defparameter *pauli-x-matrix*
  (make-array '(2 2) :element-type 'complex :initial-contents '((0 1) (1 0))))

(defun apply-gate (gate state)
  (let ((result (make-array (length state) :element-type 'complex)))
    (dotimes (i (length state))
      (setf (aref result i) (complex 0 0))
      (dotimes (j (length state))
	(setf (aref result i) (+ (aref result i) (* (aref (gate-matrix gate) i j) (aref state j))))))
    result))
