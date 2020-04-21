
;;; @description null-matrix? function check if the matrix argument is a null matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bolean : If the matrix is a null matrix return T else return nill.
;;;
;;; @exempleDescription	.
;;;
;;; @exempleCode (setq matrix '((1 2 3) (4 5 6)))
;;; @exempleCode (null-matrix? matrix) ;; nill
;;;
;;; @exempleCode (setq matrix '((0 0 0) (0 0 0)))
;;; @exempleCode (null-matrix? matrix) ;; T
;;;
(defun null-matrix? (matrix)
  (every?
    (lambda (line) 
      (every?
	    (lambda (coll-item)
		  (zerop coll-item)) line)) matrix))


;;; @description null-matrix function create a MxN null matrix.
;;;
;;; @parameters int : m : Number of rows in the matrix.
;;; @parameters int : n : Number of columns in the matrix.
;;;
;;; @return list : Null matrix MxN.
;;;
;;; @exempleDescription	.
;;;
;;; @exempleCode (null-matrix 2 3) ; ((0 0 0) (0 0 0)
;;; @exempleCode (null-matrix 4 4) ; ((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
;;;
(defun null-matrix (m n / aux result)
  (repeat m
    (setq aux '())
    (repeat n
      (setq aux (cons 0 aux)))
    (setq result (append result (list aux)))))