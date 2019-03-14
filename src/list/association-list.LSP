
;;; @description Receives an association list and returns only the keys.
;;;
;;; @parameters list : association-list : Association list to be processed.
;;;
;;; @return list : List containing all the keys in the associoation list.
;;;
;;; @exempleDescription Receives an association list and returns only the keys.
;;;
;;; @exempleCode (setq ttt '(("a" 1) ("b" 2) ("c" 5) ("d" 8) ("e" 6) ("s" 9)))
;;; @exempleCode (onlyKeys ttt)
;;;
(defun onlyKeys(association-list)
  (mapcar 'car association-list))

;;; @description Receives an association list and returns only values.
;;;
;;; @parameters list : association-list : Association list to be processed.
;;;
;;; @return list : List containing all the values in the associoation list.
;;;
;;; @exempleDescription Receives an association list and returns only the values.
;;;
;;; @exempleCode (setq ttt '(("a" 1) ("b" 2) ("c" 5) ("d" 8) ("e" 6) ("s" 9)))
;;; @exempleCode (onlyKeys ttt)
;;;
(defun onlyValues(association-list)
  (mapcar 'cdr association-list))

;;; @description Receives an association list and returns only elements 
;;; @description of received keys as arguments
;;;
;;; @parameters list : list-values : Association list to be processed.
;;; @parameters list : listOnly : List of keys to keep.
;;;
;;; @return list : List containing the key sets and values ​​corresponding to the keys received as parameter.
;;;
;;; @exempleDescription List containing the key sets and values ​​corresponding to the keys received as parameter.
;;;
;;; @exempleCode (setq ttt '(("a" 1) ("b" 2) ("c" 5) ("d" 8) ("e" 6) ("s" 9)))
;;; @exempleCode (only ttt '("a" "c"))
;;; @exempleCode (("a" 1) ("c" 5))
;;;
(defun only(association-list listOnly / aux el)
  (setq aux '())
  (foreach el listOnly
    (setq aux (append aux (list (assoc el association-list)))))
  aux)

(defun intersect-base(callback list-values-intersect list-values / aux el)
  (setq aux '())
  (foreach el list-values-intersect
    (if (callback el list-values)
      (setq aux (append aux (list el)))))
  aux)

;;; @description Receives a list containing list of associations and returns the lists 
;;; @description of associations that contain the key with the value received by parameter
;;;
;;; @parameters any : key : Key to be sought.
;;; @parameters any : value : Value to be filtered.
;;; @parameters list : association-list : List to be processed.
;;;
;;; @return list : List containing the sublists that contain the key with the value received per parameter.
;;;
;;; @exempleDescription It receives a list with join sublists and returns only those that contain the
;;; @exempleDescription key with the defined value.
;;;
;;; @exempleCode (setq ttt '((("a" 1) ("b" 2) ("c" 3)) (("a" 1) ("b" 8) ("c" 5)) (("a" 3) ("b" 2) ("c" 52))))
;;; @exempleCode (where "a" 1 ttt)
;;;
(defun where(key value association-list / el)
  (filter (lambda (el)
	    (setq key-value (cadr (assoc key el)))
	    (= value key-value)) association-list))
