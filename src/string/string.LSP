
;;; @description The strSplit function splits a string into substrings by having a character as a reference.
;;;
;;; @parameters string : string : String to be split.
;;; @parameters string : delimiter : Character used as a delimiter for division.
;;;
;;; @return list : list-splits : List with resulting substrings
;;;
;;; @exempleDescription Receives a string and splits into parts with a reference delimiter.
;;;
;;; @exempleCode (strSplit "testing-the-function" "-")
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