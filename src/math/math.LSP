
;;; @description null-matrix? function check if the matrix argument is a null matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bool : If the matrix is a null matrix return T else return nill.
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



;;; @description square-matrix? function check if a matrix is an square matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bool : Return T if the matriz is a square matrix, else return nill.
;;;
;;; @exempleDescription	Return T if the matriz is a square matrix, else return nill.
;;;
;;; @exempleCode (setq matrix '((1 2 3) (4 5 6) (7 8 9)))
;;; @exempleCode (setq matrix2 '((1 2 3) (4 5 6)))
;;;
;;; @exempleCode (square-matrix? matrix) ; T
;;; @exempleCode (square-matrix? matrix2) ; nill
;;;
(defun square-matrix? (matrix / rows colls)
  (setq rows (length matrix)
        colls (mapcar '(lambda (row) (length row)) matrix))
  (every? (lambda (x) (= x rows)) colls))



;;; @description Function diagonal-matrix? verify if the matrix is an diagonal matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bool : Return T if the matriz is a diagonal matrix, else return nill.
;;;
;;; @exempleDescription	Return T if the matriz is a diagonal matrix, else return nill.
;;;
;;; @exempleCode (setq matrix '((1 0 0) (0 5 0) (0 0 9)))
;;; @exempleCode (setq matrix2 '((1 2 3) (4 5 6)))
;;;
;;; @exempleCode (diagonal-matrix? matrix) ; T
;;; @exempleCode (diagonal-matrix? matrix2) ; nill
;;;
(defun diagonal-matrix? (matrix / alter-matrix)
	(if (null-matrix? matrix)
		T
		(progn 
			(setq alter-matrix (nullify-diagonal-matrix matrix))
			(null-matrix? alter-matrix))))


;;; @description Function nullify-diagonal-matrix nullify the main diagonal of a matrix.
;;;
;;; @parameters list : matrix : Matrix to alter.
;;;
;;; @return list : Return a matrix with the main diagonal null (0).
;;;
;;; @exempleDescription	Return a matrix with the main diagonal null.
;;;
;;; @exempleCode (setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))
;;;
;;; @exempleCode (nullify-diagonal-matrix matrix) ; ((0 2 3) (4 0 6) (7 8 0)
;;;
(defun nullify-diagonal-matrix(matrix / len index n aux v)
  (setq len (length matrix)
	    index 0
	    n 0
		aux '())
		
  (mapcar '(lambda (row)
             (setq aux '())
             (while (< n len)
               (if (= index n)
	             (setq v 0)
	             (setq v (nth n row)))
	
               (setq aux (append aux (list v))
		             n (+ n 1)))
				
            (setq index (+ 1 index)
	              n 0)
              aux) matrix))



;;; @description Function main-diagonal-matrix get the items of a main diagonal matrix.
;;;
;;; @parameters list : matrix : Matrix to get main diagonal.
;;;
;;; @return list : Return values of main diagonal matrix.
;;;
;;; @exempleDescription	Return values of main diagonal matrix.
;;;
;;; @exempleCode (setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))
;;;
;;; @exempleCode (main-diagonal-matrix matrix) ; (1 5 9)
;;;
(defun main-diagonal-matrix(matrix / index item)
  (setq index 0)
  (mapcar
    '(lambda (row)
	  (setq item (nth index row))
	  (setq index (+ index 1))
	  item)
	matrix))


;;; @description identity-matrix? function checks if a matrix is ​​identity matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bool : Return T if the matriz is ​​identity matrix, else return nill.
;;;
;;; @exempleDescription	Return T if the matriz is ​​identity matrix, else return nill.
;;;
;;; @exempleCode (setq matrix '((1 0 0) (0 1 0) (0 0 1))
;;; @exempleCode (setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))
;;;
;;; @exempleCode (square-matrix? matrix) ; T
;;; @exempleCode (square-matrix? matrix2) ; nill
;;;
(defun identity-matrix?(matrix)
  (setq dm (diagonal-matrix? matrix)
        diagonal (main-diagonal-matrix matrix)
        d (every? (lambda (x) (= x 1)) diagonal))
		
  (if (and dm d)
    T
    nill))



	