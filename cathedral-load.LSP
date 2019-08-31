(defun cathedral-load()
	(setq files-system (list
	  "src\\core\\core.lsp"
	  "src\\core\\date-time.lsp"
	  "src\\list\\simple-list.lsp"
	  "src\\list\\association-list.lsp"
	  "src\\block\\block.lsp"
	  "src\\files\\excell-files.lsp"
	  "src\\string\\string.lsp"))
 
 
 
 
	(foreach file-load files-system
	  (load file-load)))
(cathedral-load)