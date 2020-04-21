

(defun null-matrix? (matrix)
  (every?
    (lambda (line) 
      (every?
	    (lambda (coll-item)
		  (zerop coll-item)) line)) matrix))

(defun null-matrix (m n / aux result)
  (repeat m
    (setq aux '())
    (repeat n
      (setq aux (cons 0 aux)))
    (setq result (append result (list aux)))))