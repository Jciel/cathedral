
;;; @description Creates a function pipe by passing the result of a 
;;; @description function as a parameter to the next function.
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
;;; @exempleCode (pipe (list strlen zerop) "testing")
;;; @exempleCode T
;;;
(defun pipe(callbacks-list value)
  (foreach callback callbacks-list
    (setq value (callback value))))

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
  (= (rem el 2) 0))

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
  (not= (rem el 2) 0))
