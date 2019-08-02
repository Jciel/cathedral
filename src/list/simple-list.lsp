
;;; @description Filter elements of a list using a callback function, 
;;; @description the calback function should return T (true) for the element 
;;; @descriptione to enter the new list and nil for the element not to enter the new list.
;;;
;;; @parameters function : calback : Callback function.
;;; @parameters	list : list-values : List of elements to be filtered.
;;;
;;; @return list : List with elements filtered according to the callback function.
;;;
;;; @exempleDescription	Example that filters a list of numbers and returns only even numbers.
;;;
;;; @exempleCode (filter (lambda (num)
;;; @exempleCode		(= (rem num 2) 0)) '(1 2 3 4 5 6 7 8 9))
;;;
(defun filter(callback list-values / aux el)
  (setq aux '())
  (foreach el list-values
    (if (callback el)
      (setq aux (append aux (list el)))))
	  aux)


;;; @description Divides a list into parts of the same size as the one received as a parameter.
;;; @description If the size is negative, the list values are reversed.  
;;;
;;; @parameters integer : size : Size of the resulting sublists.
;;; @parameters list : list-values : List to be divided.
;;;
;;; @return list : List containing the sublists.
;;;
;;; @exempleDescription Example divides a list into sublists of 4 elements.
;;;
;;; @exempleCode (setq lista '(1 2 3 4 5 6 7 8 9))
;;; @exempleCode (chunk 4 lista)
;;;
(defun chunk(size list-values / aux aux-final el)
  (setq aux '()
	    aux-final '())
  (if (neg? size)
	(setq list-values (reverse list-values)
	      size (abs size)))
  (while (notnull list-values)
    (repeat size
	  (setq el (car list-values)
	    list-values (cdr list-values))
	  (if (notnull el)
	    (setq aux (append aux (list el)))))
    (setq aux-final (append aux-final (list aux))
		  aux '()))
  aux-final)


;;; @description Returns the items in a list except those defined as a parameter.
;;;
;;; @parameters list : list-values : List with all values.
;;; @parameters list : list-values-except : List with values ​​to be removed.
;;;
;;; @return list : List containing the values ​​except those defined to be removed.
;;;
;;; @exempleDescription Example returns values ​​from a list except those defined as a parameter.
;;;
;;; @exempleCode (setq lista '(1 2 3 4 5 6 7 8 9))
;;; @exempleCode (except lista '(2 5 7))
;;; @exempleCode (1 3 4 6 8 9)
;;;
(defun except(list-values list-values-except / el)
  (filter (lambda (el)
	    (not (member el list-values-except))) list-values))


;;; @description Returns the intersection of the elements of the first list 
;;; @description with the elements of the second list.
;;;
;;; @parameters list : list-values-intersect : List with the values ​​to be searched for.
;;; @parameters list : list-values : List with values ​​to be tested.
;;;
;;; @return list : List containing the intersection of the first list with the second list.
;;;
;;; @exempleDescription Example that returns the intersection of the first list in the second.
;;;
;;; @exempleCode (setq firstList '(1 4 6 9))
;;; @exempleCode (setq secondList '(1 2 3 5 7 8 9))
;;; @exempleCode (intersect firstList secondList)
;;; @exempleCode (1 9)
;;;
(defun intersect(list-values-intersect list-values / el)
  (intersect-base (lambda (el list-values)
		   (member el list-values)) list-values-intersect list-values))


;;; @description Return True (T) if Callback return True for every items in list-values.
;;;
;;; @parameters function : callback : Function to be applied to all items.
;;; @parameters list : list-values : List of values.
;;;
;;; @return bool : True (T) if Callback is True for every items.
;;;
;;; @exempleDescription Check if all numbers are odd.
;;;
;;; @exempleCode (every? odd? '(1 3 5 7)) ; T
;;; @exempleCode (every? odd? '(1 2 5 4)) ; nill
;;;


(defun every?(callback list-values / aux el)
  (foreach el list-values
    (setq aux (callback el)))
  aux)


;;; @description Return False (nil) if Callback return True for every items in list-values
;;;
;;; @parameters function : callback : Function to be applied to all items
;;; @parameters list : list-values : List of values
;;;
;;; @return bool : False (nill) if Callback is True for every items
;;;
;;; @exempleDescription Check if all numbers are odd
;;;
;;; @exempleCode (not-every? odd? '(1 3 5 7)) ; nill
;;; @exempleCode (not-every? odd? '(1 2 5 4)) ; T
;;;
(defun not-every?(callback list-values)
  (not (every? callback list-values)))


;;; @description Execute a function reducer to alements in list.
;;;
;;; @parameters function : callback : Function reducer to be applied to all items
;;; @parameters list : list-values : List of values
;;;
;;; @return any : 
;;;
;;; @exempleDescription Sum all items in a list
;;;
;;; @exempleCode (reduce + '(1 2 3) 0) ; 6
;;;
(defun reduce(callback list-values accumulator)
  (foreach value list-values
    (setq accumulator (callback accumulator value))))


;;; @description Return False (nil) if Callback return True for any item in list-values
;;;
;;; @parameters function : callback : Function to be applied to items
;;; @parameters list : list-values : List of values
;;;
;;; @return bool : False (nill) if Callback is True for any item
;;;
;;; @exempleDescription Check if exist one numbers odd
;;;
;;; @exempleCode (not-any? odd? '(1 3 5 7)) ; nil
;;; @exempleCode (not-any? odd? '(1 2 6 8)) ; T
;;;
(defun not-any?(callback list-values / find n)
	(setq n 0)
	(while (setq find (callback (nth n list-values)))
		(setq n (+ 1 n)))
	(if (= n (length list-values))
		find
		(not find)))


;;; @description Return True (T) if the list-values contains de value find.
;;;
;;; @parameters any : find : value to look for.
;;; @parameters list : list-values : List of values.
;;;
;;; @return bool : True (T) if exist value in list.
;;;
;;; @exempleDescription Check if exist value 2 in list.
;;;
;;; @exempleCode (contains? 2 '(5 3 8 2 9)) ; T
;;; @exempleCode (contains? 2 '(5 3 8 14 9)) ; nil
;;;
(defun contains?(find list-values)
	(not= (member find list-values) nil))


;;; @description Take the count first element from a list.
;;; @description If the count is negative, the take element from the end of list.
;;;
;;; @parameters int : count : value to look for.
;;; @parameters list : list-values : List of values.
;;;
;;; @return list : True (T) if exist value in list.
;;;
;;; @exempleDescription Check if exist value 2 in list.
;;;
;;; @exempleCode (contains? 2 '(5 3 8 2 9)) ; T
;;; @exempleCode (contains? 2 '(5 3 8 14 9)) ; nil
;;;
(defun take(count list-values)
	(car (chunk count list-values)))
