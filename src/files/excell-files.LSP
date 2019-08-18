
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
	  (list (list 'if '(or (zerop row) (zerop column))
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