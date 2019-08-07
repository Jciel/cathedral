
;;; @description Returns association list with the description and attribute value of a Block.
;;;
;;; @parameters Entity Name : entity-name : Entity name of the block for extract the attributes.
;;;
;;; @return list : List association with description and values of the attributes.
;;;
;;; @exempleDescription The code below receives a Entity name from a Block and return a list of attributes.
;;;
;;; @exempleCode (setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple
;;; @exempleCode (block-attr-values entity-name) ; (("SNAME" . "name block") ("ZSIZE" . "56") ("LFXYZ" . "0,0,0") ("BEAMDI" . "0.0") ("CONEDE" . "34") ("CONEAN" . "10.0") ("BIASMAX" . "-1"))
;;;
(defun block-attr-values (block-entity-name)
  (attr-values (entnext block-entity-name) '()))


(defun attr-values(attrib-entity list-values)
  (if (eq (type-entity attrib-entity) "ATTRIB")
    (progn
      (setq list-values (append list-values (list (cons (b-attr-description (entget attrib-entity)) (b-attr-value (entget attrib-entity))))))
      (attr-values (entnext attrib-entity) list-values))
    list-values))
  

;;; @description Returns the description from a attribute entity.
;;;
;;; @parameters list : data-attrib-entity : List of data from a entity name get with (entget) for exemple.
;;;
;;; @return string : Description of the attribute entity.
;;;
(defun b-attr-description(data-attrib-entity)
  (cdr (assoc 2 data-attrib-entity)))


;;; @description Returns the value from a attribute entity.
;;;
;;; @parameters list : data-attrib-entity : List of data from a entity name get with (entget) for exemple.
;;;
;;; @return string : Value of the attribute entity.
;;;
(defun b-attr-value(data-attrib-entity)
  (cdr (assoc 1 data-attrib-entity)))


;;; @description Returns the type of entity.
;;;
;;; @parameters Entity Name : entity-name : Entity name to get type.
;;;
;;; @return string : Type of the entity.
;;;
;;; @exempleDescription The code below receives a Entity name and return the type.
;;;
;;; @exempleCode (setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple
;;; @exempleCode (type-entity entity-name) ; "INSERT"
;;;
(defun type-entity(entity-name)
  (cdr (assoc 0 (entget entity-name))))


;;; @description Returns only the description of the attributes of a block..
;;;
;;; @parameters Entity Name : entity-name : Entity name of the block.
;;;
;;; @return list : List containing description of attributes.
;;;
;;; @exempleDescription The code below receives a Entity name and return a list of description attributes.
;;;
;;; @exempleCode (setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple
;;; @exempleCode (block-attr entity-name) ; ("SNAME" "ZSIZE" "LFXYZ" "BEAMDI" "CONEDE" "CONEAN" "BIASMAX" "BIASMIN" "COLOR" "INTENSITY" "GNAME" "LAZ" "LAY" "LAX")
;;;
(defun block-attr(block-entity-name)
  (only-keys (block-attr-values block-entity-name)))


;;; @description Returns only the values of the attributes of a block.
;;;
;;; @parameters Entity Name : entity-name : Entity name of the block.
;;;
;;; @return list : List containing values of attributes.
;;;
;;; @exempleDescription The code below receives a Entity name and return a list of values attributes.
;;;
;;; @exempleCode (setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple
;;; @exempleCode (block-values entity-name) ; ("name block" "56" "0,0,0" "0.0" "34" "10.0" "-1" "-1" "1,1,1" "1" "" "" "" "")
;;;
(defun block-values(block-entity-name)
  (only-values (block-attr-values block-entity-name)))


;;; @description Returns the value corresponding to the attribute passed by parameter.
;;;
;;; @parameters Entity Name : entity-name : Entity name of the block.
;;;
;;; @return any : Value of the attribute.
;;;
;;; @exempleDescription The code below receives a Entity name and a attribute and returne the value of attribute.
;;;
;;; @exempleCode (setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple
;;; @exempleCode (block-value-by-attr entity-name "SNAME") ; "name block"
;;;
(defun block-value-by-attr(block-entity-name attr-name)
  (cdr (assoc attr-name (block-attr-values block-entity-name))))
