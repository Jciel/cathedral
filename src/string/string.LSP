
;;; @description The str-split function splits a string into substrings by having a character as a reference.
;;;
;;; @parameters string : string : String to be split.
;;; @parameters string : delimiter : Character used as a delimiter for division.
;;;
;;; @return list : list-splits : List with resulting substrings
;;;
;;; @exempleDescription Receives a string and splits into parts with a reference delimiter.
;;;
;;; @exempleCode (str-split "testing-the-function" "-")
;;; @exempleCode ("testing" "the" "function")
;;;
(defun str-split(string delimiter / symbol-position first-part list-splits)
  (while (/= "" string)
    (setq symbol-position (vl-string-search delimiter string))
    (if (= nil symbol-position)
      (setq symbol-position (strlen string)))
    (setq first-part (substr string 1 symbol-position)
	  string (substr string (+ 2 symbol-position))
	  list-splits (append list-splits (list first-part)))))


;;; @description The str-is-empty? function return True (T) if string is empty ("") and Nil otherwise.
;;;
;;; @parameters string : string : String to be check.
;;;
;;; @return bool :  True (T) if string is empty ("") and nill otherwise.
;;;
;;; @exempleDescription Receives a string and return True if the string is not empty ("").
;;;
;;; @exempleCode (str-is-empty? "testing")
;;; @exempleCode nill
;;;
;;; @exempleCode (str-is-empty? "")
;;; @exempleCode T
;;;
(defun str-is-empty?(string)
  (eq string ""))


;;; @description The str-join function gets a list of string and joins these string abd returns a string only.
;;;
;;; @parameters string : list-string : List of string.
;;;
;;; @return string : A string being the join of the string list.
;;;
;;; @exempleDescription Receives a list of string and return a string.
;;;
;;; @exempleCode (str-join '("a" "b" "o" "u" "t"))
;;; @exempleCode "about"
;;;
;;; @exempleCode (str-join '("hello " "world"))
;;; @exempleCode "hello world"
;;;
(defun str-join(list-string)
	(apply 'strcat list-string))


;;; @description The str-left function take n characters from left side of a string.
;;;
;;; @parameters int : n : Quantity of characters to take.
;;; @parameters string : string : String to take n characters.
;;;
;;; @return string : A string containing n caracters.
;;;
;;; @exempleDescription Receives a int n and a string, return n characters of the left side string.
;;;
;;; @exempleCode (str-left 2 "testing")
;;; @exempleCode "te"
;;;
(defun str-left(n string)
  (substr string 1 n))


;;; @description The str-right function take n characters from right side of a string.
;;;
;;; @parameters int : n : Quantity of characters to take.
;;; @parameters string : string : String to take n characters.
;;;
;;; @return string : A string containing n caracters.
;;;
;;; @exempleDescription Receives a int n and a string, return n characters of the right side string.
;;;
;;; @exempleCode (str-right 2 "testing")
;;; @exempleCode "ng"
;;;
(defun str-right(n string / size init)
  (setq size (strlen string)
	init (1+ (- size n)))
  (substr string init))