(vl-load-com)

;;; @description def-sheets return a list containing a VLA-OBJECT Sheets and a VLA-OBJECT _Workbook
;;; @description for use with def-sheet function.
;;;
;;; @parameters string : file-path : Excell file path.
;;;
;;; @return list : List containing a VLA-OBJECT Sheets and a VLA-OBJECT _Workbook.
;;;
;;; @exempleDescription	Return VLA-OBJECT Sheets and a VLA-OBJECT _Workbook from a file.
;;;
;;; @exempleCode (setq sheets (def-sheets "C:\\test.xlsx"))
;;;
(defun def-sheets(file-path / excel-app excel-functions file sheets)
    (setq excel-app (vlax-get-or-create-object "Excel.Application")
	excel-functions (vlax-get excel-app "workbooks")
	file (vlax-invoke-method excel-functions "open" file-path)
	sheets (vlax-get file "sheets"))
  (append '() (list sheets) (list file)))


;;; @description def-sheet returns a list containing a specific spreadsheet VLA-OBJECT _Worksheet and a VLA-OBJECT _Workbook  
;;; @description for use with write-sheet function.
;;;
;;; @parameters list : sheets : List obtained with the def-sheets function.
;;;
;;; @return list : List containing a specific VLA-OBJECT _Worksheet and a VLA-OBJECT _Workbook.
;;;
;;; @exempleDescription	Return specific VLA-OBJECT _Worksheet and a VLA-OBJECT _Workbook from
;;; @exempleDescription	list obtained with the def-sheets function.
;;;
;;; @exempleCode (setq sheets (def-sheets "C:\\test.xlsx"))
;;; @exempleCode (setq sheet1 (def-sheet sheets 1))
;;; @exempleCode (setq sheet2 (def-sheet sheets 2))
;;;
(defun def-sheet(sheets worksheet / sheet)
  (setq sheet (vlax-get-property (car sheets) "item" worksheet))
  (append '() (list sheet) (cdr sheets)))


;;; @description This function is used to prepare a "writer" so that we can write to a specific spreadsheet of 
;;; @description an xlsx file for example, so we can just pass the cell coordinate and the content we want 
;;; @description to write to the file.
;;;
;;; @parameters list : sheet : List obtained with the def-sheet function.
;;;
;;; @return function : Function used to write to a file.
;;;
;;; @exempleDescription	Write to a file in C:.
;;;
;;; @exempleCode (setq sheets (def-sheets "C:\\test.xlsx"))
;;; @exempleCode (setq sheet1 (def-sheet sheets 1)) ; Ger for especific spreadsheet 1
;;; @exempleCode (setq sheet2 (def-sheet sheets 2)) ; Ger for especific spreadsheet 2
;;;
;;; @exempleCode (setq write-sheet-1 (write-sheet sheet1)) ; Writer to especific spreadsheet 1
;;; @exempleCode (setq write-sheet-2 (write-sheet sheet2)) ; Writer to especific spreadsheet 2
;;;;
;;; @exempleCode (write-sheet-1 1 1 "spreadsheet 1 lina 1 column 1")
;;; @exempleCode (write-sheet-1 2 1 "spreadsheet 1 lina 2 column 1")
;;;
;;; @exempleCode (write-sheet-2 1 1 "spreadsheet 2 lina 1 column 1")
;;; @exempleCode (write-sheet-2 1 2 "spreadsheet 2 lina 1 column 2")
;;;
(defun write-sheet(sheet / sheet-cells)
  (setq sheet-cells (vlax-get (car sheet) "cells"))
  (eval (append '(lambda (row col content))
	  (list (list 'if '(or (zerop row) (zerop col))
	    (list 'progn
	      (list vlax-invoke-method (cadr sheet) "save")
	      (list vlax-invoke-method (cadr sheet) "close"))
	    (list vlax-put-property sheet-cells "item" 'row 'col 'content))))))


;;; @description This function is used to prepare a "writer" so that we can write by default specific spreadsheet 1
;;;
;;; @parameters string : file-path : Excell file path.
;;;
;;; @return function : Function used to write to a file.
;;;
;;; @exempleDescription	Write to a file in C:.
;;;
;;; @exempleCode (setq write-sheet (write-sheet-default "C:\\test.xlsx"))
;;; @exempleCode (write-sheet 1 1 "spreadsheet 1 by default, line 1 column 1")
;;; @exempleCode (write-sheet 1 2 "spreadsheet 1 by default, line 1 column 2")
;;;
(defun write-sheet-default(file-path)
  (write-sheet (def-sheet (def-sheets file-path) 1)))


;;; @description This function is used to prepare a "reader" so that we can read a specific spreadsheet of 
;;; @description an xlsx file for example, so we can just pass the cell coordinate and we want read the file.
;;;
;;; @parameters list : sheet : List obtained with the def-sheet function.
;;;
;;; @return function : Function used to read to a file.
;;;
;;; @exempleDescription	Read to a file in C:.
;;;
;;; @exempleCode (setq sheets (def-sheets "C:\\test.xlsx"))
;;; @exempleCode (setq sheet1 (def-sheet sheets 1)) ; Ger for especific spreadsheet 1
;;; @exempleCode (setq sheet2 (def-sheet sheets 2)) ; Ger for especific spreadsheet 2
;;;
;;; @exempleCode (setq reader-sheet-1 (read-sheet sheet1)) ; Read to especific spreadsheet 1
;;; @exempleCode (setq reader-sheet-2 (read-sheet sheet2)) ; Read to especific spreadsheet 2
;;;;
;;; @exempleCode (reader-sheet-1 1 1) ; "spreadsheet 1 lina 1 column 1"
;;; @exempleCode (reader-sheet-1 2 1) ; "spreadsheet 1 lina 2 column 1"
;;;
;;; @exempleCode (reader-sheet-2 1 1) ; "spreadsheet 2 lina 1 column 1"
;;; @exempleCode (reader-sheet-2 1 2) ; "spreadsheet 2 lina 1 column 2"
;;;
(defun read-sheet(sheet / sheet-cells)
  (setq sheet-cells (vlax-get (car sheet) "cells"))
  (eval (append '(lambda (row col / value))
	  (list (list 'if '(or (zerop row) (zerop col))
	    (list vlax-invoke-method (cadr sheet) "close"))
	    (list read-value sheet-cells 'row 'col)))))


;;; @description This function is used to prepare a "reader" so that we can read by default specific spreadsheet 1
;;;
;;; @parameters string : file-path : Excell file path.
;;;
;;; @return function : Function used to read to a file.
;;;
;;; @exempleDescription	Read to a file in C:.
;;;
;;; @exempleCode (setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
;;; @exempleCode (reader-sheet 1 1) ; "spreadsheet 1 by default, line 1 column 1"
;;; @exempleCode (reader-sheet 1 2) ; "spreadsheet 1 by default, line 1 column 2"
;;;
(defun read-sheet-default(file-path)
  (read-sheet (def-sheet (def-sheets file-path) 1)))


;;; @description The function read-row-while-get reads the contents of the parameter row as long as it has 
;;; @description contents in the columns. If find a column without content stop the reading.
;;;
;;; @parameters int : row : Line number for reading.
;;; @parameters function : reader-sheet : "Reader" obtained with the `` read-sheet-default`` or `` read-sheet`` function.
;;;
;;; @return list : List containing the content read from the line in the file.
;;;
;;; @exempleDescription	Read line from a file in C:.
;;;
;;; @exempleCode (setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
;;; @exempleCode (read-row-while-get 1 reader-sheet) ; ("A" "B" "C" "D" "E")
;;; @exempleCode (read-row-while-get 2 reader-sheet) ; ("Line 2 A" "Line 2 B" "Line 2 C" "Line 2 D" "Line 2 E")
;;;
(defun read-row-while-get(row reader-sheet / result col content)
  (setq result '()
    col 1)
  (while (str-is-not-empty? (setq content (reader-sheet row col)))
	(setq result (append result (list content))
		  col (1+ col)))
  result)


;;; @description The function read-row-at reads the contents of the parameter row from the first column
;;; @description to the column indicated in the second parameter, including empty columns.
;;;
;;; @parameters int : row : Line number for reading.
;;; @parameters int : col-limit : Indicates up to which column to read.
;;; @parameters function : reader-sheet : "Reader" obtained with the `` read-sheet-default`` or `` read-sheet`` function.
;;;
;;; @return list : List containing the content read from the line in the file from column 1 to col-limit.
;;;
;;; @exempleDescription	Read line from a file in C:.
;;;
;;; @exempleCode (setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
;;; @exempleCode (read-row-at 1 5 reader-sheet) ; ("A" "B" "C" "D" "E")
;;; @exempleCode (read-row-at 1 8 reader-sheet) ; ("A" "B" "C" "D" "E" "" "" "")
;;; @exempleCode (read-row-at 2 7 reader-sheet) ; ("Line 2 A" "Line 2 B" "Line 2 C" "Line 2 D" "Line 2 E" "" "Line 2 G")
;;;
(defun read-row-at(row col-limit reader-sheet / result current-col)
  (setq result '()
		current-col 1)
  (while (<= current-col col-limit)
	(setq result (append result (list (reader-sheet row current-col)))
		  current-col (1+ current-col))
  )
  result)


(defun read-value(sheet-cells row col / read-variant-value value)
  (setq read-variant-value (vlax-get-property sheet-cells "item" row col)
	value (vlax-variant-value (vlax-variant-change-type read-variant-value vlax-vbstring)))
  value)