

;;; @description Return a string wit the current date and time in the format indicated.
;;; @description The format is indicated by a parameter containing the options:
;;; @description Y -> indicates the year
;;; @description m -> indicates the month
;;; @description d -> indicates the day
;;; @description H -> indicates the hour
;;; @description i -> indicates the minutes
;;; @description s -> indicates the seconds
;;;
;;; @parameters string : format : String indicating the format.
;;;
;;; @return string : String containing the date-time in the format indicated.
;;;
;;; @exempleDescription	1 - Return the current data and time.
;;; @exempleDescription	2 - Return just the current data.
;;; @exempleDescription	3 - Return just the current time.
;;;
;;; @exempleCode (date-time "Y-m-d H:i:s") ; "2019-06-12 23:57:13"
;;; @exempleCode (date-time "Y-m-d") ; "2019-06-12"
;;; @exempleCode (date-time "H:i:s") ; "23:57:13"
;;;
(defun date-time (format / index date letter current-date-time)
	(setq current-date-time (rtos (getvar "CDATE") 2 6)
		  date ""
		  index 1)
	(while (/= (setq letter (substr format index 1)) "")
		(setq index (+ 1 index))
		(setq date (strcat date (date-time-parse letter current-date-time)))))


(defun date-time-parse(item-format date-time)
	(cond
		((= item-format "Y")
			(substr date-time 1 4))
		((= item-format "m")
			(substr date-time 5 2))
		((= item-format "d")
			(substr date-time 7 2))
		((= item-format "H")
			(substr date-time 10 2))
		((= item-format "i")
			(substr date-time 12 2))
		((= item-format "s")
			(substr date-time 14 2))
		(t
			item-format)))


