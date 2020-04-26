
;;; @description null-matrix? function check if the matrix argument is a null matrix.
;;;
;;; @parameters list : matrix : Matrix to check.
;;;
;;; @return bool : If the matrix is a null matrix return T else return nill.
;;;
;;; @exempleDescription	If the matrix is a null matrix return T else return nill.
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
;;; @exempleDescription	Return a Null matrix MxN.
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
		
  (mapcar
    '(lambda (row)
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
	  item) matrix))


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
(defun identity-matrix?(matrix / dm diagonal d)
  (setq dm (diagonal-matrix? matrix)
        diagonal (main-diagonal-matrix matrix)
        d (every? (lambda (x) (= x 1)) diagonal))
		
  (if (and dm d)
    T
    nill))


;;; @description identity-matrix returns an identity matrix.
;;;
;;; @parameters int : n : Matrix size.
;;;
;;; @return list : Returns an identity matrix of size n.
;;;
;;; @exempleDescription	Returns an identity matrix of size n.
;;;
;;; @exempleCode (identity-matrix 4) ; ((1 0 0 0) (0 1 0 0) (0 0 1 0) (0 0 0 1))
;;; @exempleCode (identity-matrix 3) ; ((1 0 0) (0 1 0) (0 0 1))
;;;
(defun identity-matrix(n / index c v aux final)
  (setq index 0
        c 0
        aux '()
        final '())
	
  (repeat n
    (while (< c n)
      (if (= index c)
        (setq v 1)
        (setq v 0))
      (setq aux (append aux (list v)))
      (setq c (+ c 1)))
		
    (setq final (append final (list aux)))
    (setq aux '())
    (setq index (+ index 1))
    (setq c 0))
  final)


;;; @description transpose-matrix returns the matrix transposed from a matrix.
;;;
;;; @parameters list : matrix : Matrix to transpose.
;;;
;;; @return list : Returns the transposed matrix.
;;;
;;; @exempleDescription	Returns the matrix transposed from a matrix.
;;;
;;; @exempleCode (setq matrix '((1 2) (3 4) (5 6)))
;;; @exempleCode (transpose-matrix matrix) ; ((1 3 5) (2 4 6))
;;;
(defun transpose-matrix(matrix / index len final aux)
  (setq index 0
  len (length (first matrix))
  final '())
	
  (defun get-items(matrix index)
    (mapcar
      '(lambda (row)
        (nth index row)) matrix))

  (repeat len
    (setq aux (get-items matrix index)
          final (append final (list aux))
          index (+ index 1)
          aux '()))
  final)


;;; @description +matrix function adds two matrices.
;;;
;;; @parameters list : matrix-a : Matrix to sum.
;;; @parameters list : matrix-b : Matrix to sum.
;;;
;;; @return list : Returns the sum of two matrices.
;;;
;;; @exempleDescription	Returns the sum of two matrices.
;;;
;;; @exempleCode (setq matrix-a '((1 2) (3 4) (5 6)))
;;; @exempleCode (setq matrix-b '((1 2) (3 4) (5 6)))
;;; @exempleCode (+matrix matrix-a matrix-b) ; ((2 4) (6 8) (10 12))
;;;
(defun +matrix(matrix-a matrix-b)
  (mapcar '+vector matrix-a matrix-b))


;;; @description -matrix function subtracts two matrices.
;;;
;;; @parameters list : matrix-a : Matrix to sub.
;;; @parameters list : matrix-b : Matrix to sub.
;;;
;;; @return list : Returns the subtraction of two matrices.
;;;
;;; @exempleDescription	Returns the sum of two matrices.
;;;
;;; @exempleCode (setq matrix-a '((1 2) (3 4) (5 6)))
;;; @exempleCode (setq matrix-b '((2 1) (8 4) (5 10)))
;;; @exempleCode (-matrix matrix-a matrix-b) ; ((-1 1) (-5 0) (0 -4))
;;;
(defun -matrix(matrix-a matrix-b)
  (defun sub-row(row-a row-b)
    (mapcar '- row-a row-b))
	
  (mapcar 'sub-row matrix-a matrix-b))


;;; @description *smatrix function multiplies a scalar by an matrix.
;;;
;;; @parameters number : scalar : Scalar to multiply.
;;; @parameters list : matrix : Matrix to multiply.
;;;
;;; @return list : Returns a matrix resulting from multiplication.
;;;
;;; @exempleDescription	Returns a matrix resulting from multiplication.
;;;
;;; @exempleCode (setq matrix '((2 3) (4 6)))
;;;
;;; @exempleCode (*smatrix 2 matrix) ; ((4 6) (8 12))
;;;
(defun *smatrix(scalar matrix)
  (defun mult-row(row)
    (mapcar '(lambda (x) (* scalar x)) row))
	
  (mapcar 'mult-row matrix))



;;; @description *matrix function multiplies two matrices.
;;;
;;; @parameters list : matrix-a : Matrix to multiply.
;;; @parameters list : matrix-b : Matrix to multiply.
;;;
;;; @return list : Returns a matrix resulting from multiplication.
;;;
;;; @exempleDescription	Returns a matrix resulting from multiplication.
;;;
;;; @exempleCode (setq matrix-a '((2 3) (4 6)))
;;; @exempleCode (setq matrix-b '((1 2 0) (2 1 1)))
;;; @exempleCode (*matrix matrix-a matrix-b) ; ((8 9 3) (16 18 6))
;;;
(defun *matrix(matrix-a matrix-b)
  (setq b-tranpose (transpose-matrix matrix-b))
	
  (defun mult-matrix(row-a)
    (mapcar
	  '(lambda (row-b)
	    (apply '+ (mapcar '* row-a row-b))) b-tranpose))
		
  (mapcar 'mult-matrix matrix-a))


;;; @description opposite-matrix function returns the opposite matrix from a matrix.
;;;
;;; @parameters list : matrix : Matrix to get opposite.
;;;
;;; @return list : Returns the opposite matrix from a matrix.
;;;
;;; @exempleDescription	Returns the opposite matrix from a matrix.
;;;
;;; @exempleCode (setq matrix '((2 -3) (-4 6)))
;;;
;;; @exempleCode (opposite-matrix matrix) ; ((-2 3) (4 -6))
;;;
(defun opposite-matrix(matrix)
	(mapcar 'opposite-vector matrix))



;;; @description *svector function multiplies a scalar by an vector.
;;;
;;; @parameters number : scalar : Scalar to multiply.
;;; @parameters list : vector : Vector to multiply.
;;;
;;; @return list : Returns a vector resulting from multiplication.
;;;
;;; @exempleDescription	Returns a vector resulting from multiplication.
;;;
;;; @exempleCode (setq vector '(2 4 6 8))
;;;
;;; @exempleCode (*svector 2 vector) ; (4 8 12 16)
;;;
(defun *svector(scalar vector)
  (mapcar '(lambda (x) (* scalar x)) vector))


;;; @description +vector function adds two vectors.
;;;
;;; @parameters list : vector-a : vector to sum.
;;; @parameters list : vector-b : vector to sum.
;;;
;;; @return list : Returns the sum of two vectors.
;;;
;;; @exempleDescription	Returns the sum of two vectors.
;;;
;;; @exempleCode (setq  vector-a '(1 2 3))
;;; @exempleCode (setq  vector-b '(1 2 3)
;;; @exempleCode (+vector vector-a vector-b) ; (2 4 6)
;;;
(defun +vector(vector-a vector-b)
  (defun add-vec(v-a v-b)
    (mapcar '+ vector-a vector-b))
  (add-vec vector-a vector-b))


;;; @description *i-vector function result in a internal product between two vectors.
;;;
;;; @parameters list : vector-a : vector to process.
;;; @parameters list : vector-b : vector to process.
;;;
;;; @return list : Returns a internal product between two vectors.
;;;
;;; @exempleDescription	Returns a internal product between two vectors.
;;;
;;; @exempleCode (setq  vector-a '(2 3 ))
;;; @exempleCode (setq  vector-b '(4 3)
;;; @exempleCode (*i-vector vector-a vector-b) ; 17
;;;
(defun *i-vector(vector-a vector-b / vals)
  (setq vals (mapcar
               '(lambda (va vb)
			     (* va vb)) vector-a vector-b))
  (reduce
    (lambda (acc v)
	  (+ acc v)) vals 0))


;;; @description -vector function subtracts two vectors.
;;;
;;; @parameters list : vector-a : vector to subtract.
;;; @parameters list : vector-b : vector to subtract.
;;;
;;; @return list : Returns the subtraction of two vectors.
;;;
;;; @exempleDescription	Returns the subtraction of two vectors.
;;;
;;; @exempleCode (setq  vector-a '(1 2))
;;; @exempleCode (setq  vector-b '(1 2)
;;; @exempleCode (-vector vector-a vector-b) ; (0 0)
;;;
(defun -vector(vector-a vector-b)
  (+vector vector-a (opposite-vector vector-b)))


;;; @description opposite-vector function returns the opposite vector of a vector.
;;;
;;; @parameters list : vector : vector to preocess.
;;;
;;; @return list : Returns the opposite vector of a vector.
;;;
;;; @exempleDescription	Returns the opposite vector of a vector.
;;;
;;; @exempleCode (setq  vector '(7 -3))
;;; @exempleCode (opposite-vector vector) ; (-7 3)
;;;
(defun opposite-vector (vector)
  (mapcar '(lambda (x) (* x -1)) vector))


;;; @description norm-vector function returns the norm of a vector.
;;;
;;; @parameters list : vector : vector to preocess.
;;;
;;; @return int : Returns the norm of a vector.
;;;
;;; @exempleDescription	Returns the norm of a vector.
;;;
;;; @exempleCode (setq  vector '(3 -4))
;;; @exempleCode (norm-vector vector) ; 5
;;;
(defun norm-vector(vector)
  (sqrt
    (reduce
      (lambda (acc v)
        (+ acc (expt v 2))) vector 0)))




	