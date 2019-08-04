
;;; @description Creates a function pipe by passing the result of a 
;;; @description function as a last or single parameter to the next function.
;;; @description If the functions receives multiple parameters, thar should be
;;; @description passed as a list.
;;;
;;; @parameters list : callbackList : List of callback functions will be executed in the order they appear in the list.
;;; @parameters any : value : Value to be processed.
;;;
;;; @return any : Result after the application of the functions on the value.
;;;
;;; @exempleDescription The code below receives a string and first passes to the stlen function that returns the string size,
;;; @exempleDescription then passes that result to the zerop function that checks whether it is a zero or not, 
;;; @exempleDescription thus checking whether the string is empty or not.
;;;
;;; @exempleCode (|>> (list strlen zerop) "testing") ; nill
;;; @exempleCode (|>> (list strlen zerop) "") ; T
;;;
(defun |>>(callbacks-list value)
  (foreach callback callbacks-list
    (cond
      ((= (type callback) 'LIST)
       (setq value (apply (car callback) (append (cdr callback) (list value)))))
      (T (setq value (callback value))))))


;;; @description Creates a function pipe by passing the result of a 
;;; @description function as a first or single parameter to the next function.
;;; @description If the functions receives multiple parameters, thar should be
;;; @description passed as a list.
;;;
;;; @parameters list : callbackList : List of callback functions will be executed in the order they appear in the list.
;;; @parameters any : value : Value to be processed.
;;;
;;; @return any : Result after the application of the functions on the value.
;;;
;;; @exempleDescription The code below receives a string and first passes to the stlen function that returns the string size,
;;; @exempleDescription then passes that result to the zerop function that checks whether it is a zero or not, 
;;; @exempleDescription thus checking whether the string is empty or not.
;;;
;;; @exempleCode (|> (list strlen zerop) "testing") ; nill
;;; @exempleCode (|> (list strlen zerop) "") ; T
;;;
(defun |>(callbacks-list value)
  (foreach callback callbacks-list
    (cond
      ((= (type callback) 'LIST)
       (setq value (apply (car callback) (cons value (cdr callback)))))
      (T (setq value (callback value))))))


;;; @description Return True (T) if first parameter is not equal to second parameter
;;;
;;; @parameters any : elo : First parameter to compare
;;; @parameters any : elt : Second parameter to compare
;;;
;;; @return bool : True (T) if first parameter is not equal to second parameter
;;;
;;; @exempleDescription Check if first parameter is not equal to second parameter
;;;
;;; @exempleCode (not= 1 2) T
;;; @exempleCode (not= 1 1) nill
;;;
(defun not=(elo elt)
  (not (= elo elt)))


;;; @description Return True (T) if the parameter is not null
;;;
;;; @parameters any : elo : Parameter to verify
;;;
;;; @return bool : True (T) if the parameter is not null
;;;
;;; @exempleDescription Check if the parameter is not null
;;;
;;; @exempleCode (notnull 1) T
;;; @exempleCode (notnull nil) nil
;;;
(defun notnull(elo)
  (not (null elo)))


;;; @description Returns True (T) if the parameter is negative
;;;
;;; @parameters int : elo : Parameter to verify
;;;
;;; @return bool : True (T) if the parameter is negative
;;;
;;; @exempleDescription Check if the parameter is negative
;;;
;;; @exempleCode (neg? 1) nill
;;; @exempleCode (neg? 0) nil
;;; @exempleCode (neg? -2) T
;;;
(defun neg?(el)
  (< el 0))


;;; @description Returns True (T) if the parameter is even
;;;
;;; @parameters int : elo : Parameter to verify
;;;
;;; @return bool : True (T) if the parameter is even
;;;
;;; @exempleDescription Check if the parameter is even
;;;
;;; @exempleCode (even? 1) nill
;;; @exempleCode (even? 2) T
;;;
(defun even?(el)
  (if (not el)
	nil
    (= (rem el 2) 0)))


;;; @description Returns True (T) if the parameter is odd
;;;
;;; @parameters int : elo : Parameter to verify
;;;
;;; @return bool : True (T) if the parameter is odd
;;;
;;; @exempleDescription Check if the parameter is odd
;;;
;;; @exempleCode (odd? 1) T
;;; @exempleCode (odd? 2) nil
;;;
(defun odd?(el)
  (if (not el)
	nil
	(not= (rem el 2) 0)))


;;; @description Execute body if test is True (T).
;;;
;;; @parameters exp : test : Logical test.
;;; @parameters exp : body : Expression to execute.
;;;
;;; @return any : Return the result of execution body.
;;;
;;; @exempleDescription Sum if num is equal 1.
;;;
;;; @exempleCode (setq num 1)
;;; @exempleCode (when (= num 1)
;;; @exempleCode   (+ num 5)) ; 6
;;;
;;; @exempleCode (setq num 2)
;;; @exempleCode (when (= num 1)
;;; @exempleCode   (+ num 5)) ; nil
;;;
(defun when(test body)
  (if test
	body))


;;; @description Execute body if test is False (nil).
;;;
;;; @parameters exp : test : Logical test.
;;; @parameters exp : body : Expression to execute.
;;;
;;; @return any : Return the result of execution body.
;;;
;;; @exempleDescription Sum if num is different 1.
;;;
;;; @exempleCode (setq num 1)
;;; @exempleCode (when-not (= num 1)
;;; @exempleCode   (+ num 5)) ; nil
;;;
;;; @exempleCode (setq num 2)
;;; @exempleCode (when-not (= num 1)
;;; @exempleCode   (+ num 5)) ; 7
;;;
(defun when-not(test body)
  (when (not test) body))
