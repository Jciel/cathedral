# Cathedral


Cathedral is a collection of functions to be used in developing AutoLISP routines for AutoCAD. These functions provide  
new functionality for data processing in AutoLISP.


<br>
<br>
<br>

## Documentations

*******
### Summary
- **Core**
  - [|>>](#core-1)
  - [|>](#core-2)
  - [not=](#corenot)
  - [notnull](#corenotnull)
  - [neg?](#coreneg)
  - [even?](#coreeven)
  - [odd?](#coreodd)
  - [when](#corewhen)
  - [when-not](#corewhen-not)
  - [type-entity](#coretype-entity)
  - Date-Time
	- [date-time](#coredate-time-1)
- **String**
  - [str-split](#stringstr-split)
  - [str-is-empty](#stringstr-is-empty)
  - [str-join](#stringstr-join)
  - [str-left](#stringstr-left)
  - [str-right](#stringstr-right)
- **List**
  - Simple List
    - [filter](#listsimple-listfilter)
    - [chunk](#listsimple-listchunk)
    - [except](#listsimple-listexcept)
    - [intersect](#listsimple-listintersect)
    - [every?](#listsimple-listevery)
    - [not-every?](#listsimple-listnot-every)
    - [reduce](#listsimple-listreduce)
    - [not-any?](#listsimple-listnot-any)
    - [contains?](#listsimple-listcontains)
    - [take](#listsimple-listtake)
  - Association List
    - [only-keys](#listassociation-listonly-keys)
    - [only-values](#listassociation-listonly-values)
    - [where](#listassociation-listwhere)
    - [contains-key?](#listassociation-listcontains-key)
    - [contains-value?](#listassociation-listcontains-value)
- **Block**
  - [block-attr-values](#blockblock-attr-values)
  - [b-attr-description](#blockb-attr-description)
  - [b-attr-value](#blockb-attr-value)
  - [block-attr](#blockblock-attr)
  - [block-values](#blockblock-values)
  - [block-value-by-attr](#blockblock-value-by-attr)
- **Files**
  - Excell files
    - [write-sheet-default](#filesexcell-fileswrite-sheet-default)
    - [write-sheet](#filesexcell-fileswrite-sheet)
	- [read-sheet-default](#filesexcell-filesread-sheet-default)
	- [read-sheet](#filesexcell-filesread-sheett)
    - [def-sheets](#filesexcell-filesdef-sheets)
    - [def-sheet](#filesexcell-filesdef-sheet)
*******

<br>
<br>

### __core__

##### __core/|>>__  

Creates a function pipe by passing the result of a function as a last parameter to the next function.  
If the functions receives multiple parameters, thar should be passed as a list.  

###### Parameters  
``list`` : ``callbackList`` : List of callback functions will be executed in the order they appear in the list.
``any`` : ``value`` : Value to be processed.

###### Return  
``any`` : Result after the application of the functions on the value.

###### Exemple  
The code below receives a string and first passes to the stlen function that returns the string size, then passes that  
result to the zerop function that checks whether it is a zero or not, thus checking whether the string is empty or not.  

```lsp
(|>> (list 
       strlen
       zerop) "testing") ; nill
	   
(|>> (list
       strlen
       zerop) "") ; T
```  
The same of:  
```lsp
(zerop (strlen ""))
```  

If the functions receives multiples params.  
The example takes the list size, adds 5 and multiplies 2 by the result .   
```lsp
(setq lstElements '("a" "b" "c" "d"))

(|>> (list
	   length
	   '(+ 5)
	   '(* 2)) lstElements) ; 18
```   
The same of:
```lsp
(setq lstElements '("a" "b" "c" "d"))

(* 2 (+ 5 (length lstElements)))
```

<br>
<br>


##### __core/|>__  

Creates a function pipe by passing the result of a function as a first parameter to the next function.  
If the functions receives multiple parameters, thar should be passed as a list.  

###### Parameters  
``list`` : ``callbackList`` : List of callback functions will be executed in the order they appear in the list.
``any`` : ``value`` : Value to be processed.

###### Return  
``any`` : Result after the application of the functions on the value.

###### Exemple  
The code below receives a string and first passes to the stlen function that returns the string size, then passes that  
result to the zerop function that checks whether it is a zero or not, thus checking whether the string is empty or not.  

```lsp
(|> (list 
      strlen
      zerop) "testing") ; nill
	   
(|> (list
      strlen
      zerop) "") ; T
```  
The same of:  
```lsp
(zerop (strlen ""))
```  

If the functions receives multiples params.  
The example takes the list size, adds 5 and 4, and multiplies the result by 2.   
```lsp
(setq lstElements '("a" "b" "c" "d"))

(|> (list
	  length
	  '(+ 5 4)
	  '(* 2)) lstElements) ; 26
```   
The same of:
```lsp
(setq lstElements '("a" "b" "c" "d"))

(* (+ (length lstElements) 5 4) 2)
```


<br>
<br>

##### __core/not=__  

Return True (T) if first parameter is not equal to second parameter  

###### Parameters  
``any`` : ``elo`` : First parameter to compare  
``any`` : ``elt`` : Second parameter to compare  

###### Return  
``bool`` : True (T) if first parameter is not equal to second parameter  

###### Exemple  
Check if first parameter is not equal to second parameter  

```lsp
(not= 1 2) ; T
(not= 1 1) ; nill
```

<br>
<br>

##### __core/notnull__  

Return True (T) if the parameter is not null  

###### Parameters  
``any`` : ``elo`` : Parameter to verify  

###### Return  
``bool`` : True (T) if the parameter is not null  

###### Exemple  
Check if the parameter is not null  

```lsp
(notnull 1) ; T
(notnull nil) ; nil
```

<br>
<br>

##### __core/neg?__  
Returns True (T) if the parameter is negative    

###### Parameters  
``int`` : ``elo`` : Parameter to verify  

###### Return  
``bool`` : True (T) if the parameter is negative  

###### Exemple  
Check if the parameter is negative  

```lsp
(neg? 1) ; nill
(neg? 0) ; nil
(neg? -2) ; T
```

<br>
<br>

##### __core/even?__  
Returns True (T) if the parameter is even  

###### Parameters  
``int`` : ``elo`` : Parameter to verify  

###### Return  
``bool`` : True (T) if the parameter is even  

###### Exemple  
Check if the parameter is even  

```lsp
(even? 1) ; nill
(even? 2) ; T
```

<br>
<br>

##### __core/odd?__  
Returns True (T) if the parameter is odd  

###### Parameters  
``int`` : ``elo`` : Parameter to verify  

###### Return  
``bool`` : True (T) if the parameter is odd  

###### Exemple  
Check if the parameter is odd  

```lsp
(odd? 1) ; T
(odd? 2) ; nil
```

<br>
<br>

##### __core/when__  
Execute body if test is True (T).   

###### Parameters  
``exp`` : ``test`` : Logical test.  
``exp`` : ``body`` : Expression to execute.  

###### Return  
``any`` : Return the result of execution body.  

###### Exemple  
Sum if num is equal 1.  

```lsp
(setq num 1)
(when (= num 1)
  (+ num 5)) ; 6
  
(setq num 2)
(when (= num 1)
  (+ num 5)) ; nil
```

<br>
<br>

##### __core/when-not__  
Execute body if test is False (nil).   

###### Parameters  
``exp`` : ``test`` : Logical test.  
``exp`` : ``body`` : Expression to execute.  

###### Return  
``any`` : Return the result of execution body.  

###### Exemple  
Sum if num is different 1.  

```lsp
(setq num 1)
(when-not (= num 1)
  (+ num 5)) ; nil
  
(setq num 2)
(when-not (= num 1)
  (+ num 5)) ; 7
```

<br>
<br>

##### __core/type-entity__   
Returns the type of entity.  

###### Parameters  
``Entity Name`` : ``entity-name`` : Entity name to get type.   

###### Return  
``string`` : Type of the entity.  

###### Exemple  
The code below receives a Entity name and return the type.  

```lsp
(setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple

(type-entity entity-name) ; "INSERT"
```


<br>
<br>

### __Date-Time__

#### __core/date-time__

##### __core/date-time__  
Return a string wit the current date and time in the format indicated.  
The format is indicated by a parameter containing the options:  
- __Y__ -> indicates the year
- __m__ -> indicates the month
- __d__ -> indicates the day
- __H__ -> indicates the hour
- __i__ -> indicates the minutes
- __s__ -> indicates the seconds

###### Parameters  
``string`` : ``format`` : String indicating the format.  

###### Return  
``string`` : String containing the date-time in the format indicated.  

###### Exemple  
1 - Return the current data and time.  
2 - Return just the current data.  
3 - Return just the current time.  

```lsp
(date-time "Y-m-d H:i:s") ; "2019-06-12 23:57:13"
(date-time "Y-m-d") ; "2019-06-12"
(date-time "H:i:s") ; "23:57:13"
```

<br>
<br>
<br>

### __string__  

##### __string/str-split__  
The str-split function splits a string into substrings by having a character as a reference.  

###### Parameters  
``string`` : ``string`` : String to be split.  
``string`` : ``delimiter`` : Character used as a delimiter for division.  

###### Return  
``list`` : ``list-splits`` : List with resulting substrings  

###### Exemple  
Receives a string and splits into parts with a reference delimiter.  

```lsp
(str-split "testing-the-function" "-")
("testing" "the" "function")
```

<br>
<br>

##### __string/str-is-empty__  
The str-is-empty function return True (T) if string is empty ("") and Nil otherwise.  

###### Parameters  
``string`` : ``string`` : String to be check.  

###### Return  
``bool`` : True (T) if string is empty ("") and Nil otherwise.  

###### Exemple  
Receives a string and return True if the string is not empty ("").  

```lsp
(str-is-empty "testing") ; nil
(str-is-empty? "") ; T
```

<br>
<br>

##### __string/str-join__  
The str-join function gets a list of string and joins these string abd returns a string only.  

###### Parameters  
``list`` : ``list-string`` : list-string : List of string.  

###### Return  
``string`` : A string being the join of the string list.  

###### Exemple  
Receives a list of string and return a string.  

```lsp
(str-join '("a" "b" "o" "u" "t"))
"about"

(str-join '("hello " "world"))
"hello world"
```

<br>
<br>

##### __string/str-left__  
The str-left function take n characters from left side of a string.  

###### Parameters  
``int`` : ``n`` : Quantity of characters to take.  
``string`` : ``string`` : String to take n characters.  

###### Return  
``string`` : A string containing n caracters.  

###### Exemple  
Receives a int n and a string, return n characters of the left side string.  

```lsp
(str-left 2 "testing")
"te"
```

<br>
<br>

##### __string/str-right__  
The str-right function take n characters from right side of a string.  

###### Parameters  
``int`` : ``n`` : Quantity of characters to take.  
``string`` : ``string`` : String to take n characters.  

###### Return  
``string`` : A string containing n caracters.  

###### Exemple  
Receives a int n and a string, return n characters of the right side string.  

```lsp
(str-right 2 "testing")
"ng"
```

<br>
<br>
<br>

### __list__

#### __list/simple-list__

##### __list/simple-list/filter__  
Filter elements of a list using a callback function, the calback function should return T (true) for the element  to  
enter the new list and nil for the element not to enter the new list.  

###### Parameters  
``function`` : ``calback`` : Callback function.  
``list`` : ``list-values`` : List of elements to be filtered.  

###### Return  
``list`` : List with elements filtered according to the callback function.  

###### Exemple  
Example that filters a list of numbers and returns only even numbers.  

```lsp
(filter (lambda (num)
    (= (rem num 2) 0)) '(1 2 3 4 5 6 7 8 9))

(2 4 6 8)
```

<br>
<br>

##### __list/simple-list/chunk__  
Divides a list into parts of the same size as the one received as a parameter.   
If the size is negative, the list values are reversed.   

###### Parameters  
``integer`` : ``size`` : Size of the resulting sublists.  
``list`` : ``list-values`` : List to be divided.  

###### Return  
``list`` : List containing the sublists.  

###### Exemple  
Example divides a list into sublists of 4 elements.  

```lsp
(setq lista '(1 2 3 4 5 6 7 8 9))
(chunk 4 lista)

((1 2 3 4) (5 6 7 8) (9))
```


<br>
<br>

##### __list/simple-list/except__  
Returns the items in a list except those defined as a parameter.  

###### Parameters  
``list`` : ``list-values`` : List with all values.  
``list`` : ``list-values-except`` : List with values ​​to be removed.  

###### Return  
``list`` : List containing the values ​​except those defined to be removed.  

###### Exemple  
Example returns values ​​from a list except those defined as a parameter.  

```lsp
(setq lista '(1 2 3 4 5 6 7 8 9))
(except lista '(2 5 7))

(1 3 4 6 8 9)
```


<br>
<br>

##### __list/simple-list/intersect__  
Returns the intersection of the elements of the first list  with the elements of the second list.  

###### Parameters  
``list`` : ``list-values-intersect`` : List with the values ​​to be searched for.  
``list`` : ``list-values`` : List with values ​​to be tested.  

###### Return  
``list`` : List containing the intersection of the first list with the second list.  

###### Exemple  
Example that returns the intersection of the first list in the second.  

```lsp
(setq firstList '(1 4 6 9))
(setq secondList '(1 2 3 5 7 8 9))
(intersect firstList secondList)

(1 9)
```


<br>
<br>

##### __list/simple-list/every?__  
Return True (T) if Callback return True for every items in list-values.  

###### Parameters  
``function`` : ``callback`` : Function to be applied to all items.  
``list`` : ``list-values`` : List of values.  

###### Return  
``bool`` : True (T) if Callback is True for every items.  

###### Exemple  
Check if all numbers are odd.  

```lsp
(every? odd? '(1 3 5 7)) ; T
(every? odd? '(1 2 5 4)) ; nill
```

<br>
<br>

##### __list/simple-list/not-every?__  
Return False (nil) if Callback return True for every items in list-values.  

###### Parameters  
``function`` : ``callback`` : Function to be applied to all items.  
``list`` : ``list-values`` : List of values.  

###### Return  
``bool`` : False (nill) if Callback is True for every items.  

###### Exemple  
Check if all numbers are odd.  

```lsp
(not-every? odd? '(1 3 5 7)) ; nill
(not-every? odd? '(1 2 5 4)) ; T
```

<br>
<br>

##### __list/simple-list/reduce__  
Execute a function reducer to alements in list.    

###### Parameters  
``function`` : ``callback`` : Function reducer to be applied to all items.  
``list`` : ``list-values`` : List of values.  

###### Return  
``any`` :   

###### Exemple  
Sum all items in a list.  

```lsp
(reduce + '(1 2 3)) ; 6
```

<br>
<br>

##### __list/simple-list/not-any?__  
Return False (nil) if Callback return True for any item in list-values.    

###### Parameters  
``function`` : ``callback`` : Function to be applied to items.  
``list`` : ``list-values`` : List of values.  

###### Return  
``bool`` : False (nill) if Callback is True for any item.  

###### Exemple  
Check if exist one numbers odd.  

```lsp
(not-any? odd? '(1 3 5 7)) ; nil
(not-any? odd? '(1 2 6 8)) ; T
```

<br>
<br>

##### __list/simple-list/contains?__  
Return True (T) if the list-values contains de value find.    

###### Parameters  
``any`` : ``find`` : value to look for.  
``list`` : ``list-values`` : List of values.  

###### Return  
``bool`` : True (T) if exist value in list.  

###### Exemple  
Check if exist value 2 in list.  

```lsp
(contains? 2 '(5 3 8 2 9)) ; T
(contains? 2 '(5 3 8 14 9)) ; nil
```

<br>
<br>

##### __list/simple-list/take__  
Take the count first element from a list.  
If the count is negative, the take element from the end of list.  

###### Parameters  
``int`` : ``count`` : value to look for.  
``list`` : ``list-values`` : List of values.  

###### Return  
``list`` : List of the count n elements from list.  

###### Exemple  
Check if exist value 2 in list.  

```lsp
(take 2 '(5 3 8 2 9)) ; (5 3)
```


<br>
<br>
<br>

#### __simple-list/association-list__

##### __list/association-list/only-keys__  
Receives an association list and returns only the keys.  

###### Parameters  
``list`` : ``association-list`` : Association list to be processed.  

###### Return  
``list`` : List containing all the keys in the association list.  

###### Exemple  
Receives an association list and returns only the keys.  

```lsp
(setq ttt '(("a" 1) ("b" 2) ("c" 5) ("d" 8) ("e" 6) ("s" 9)))
(only-keys ttt)

("a" "b" "c" "d" "e" "s")
```

<br>
<br>

##### __list/association-list/only-values__  
Receives an association list and returns only values.  

###### Parameters  
``list`` : ``association-list`` : Association list to be processed.  

###### Return  
``list`` : List containing all the keys in the associoation list.  

###### Exemple  
Receives an association list and returns only the keys.  

```lsp
(setq ttt '(("a" 1) ("b" 2) ("c" 5) ("d" 8) ("e" 6) ("s" 9)))
(only-values ttt)

(1 2 5 8 6 9)
```

<br>
<br>

##### __list/association-list/where__  
Receives a list containing list of associations and returns the lists of associations that contain the key with the  
value received by parameter.  

###### Parameters  
``any`` : ``key`` : Key to be sought.  
``any`` : ``value`` : Value to be filtered.  
``list`` : ``association-list`` : List to be processed.  

###### Return  
``list`` : List containing the sublists that contain the key with the value received per parameter.  

###### Exemple  
It receives a list with join sublists and returns only those that contain the key with the defined value.  

```lsp
(setq ttt '((("a" 1) ("b" 2) ("c" 3)) (("a" 1) ("b" 8) ("c" 5)) (("a" 3) ("b" 2) ("c" 52))))
(where "a" 1 ttt)
```

<br>
<br>

##### __list/association-list/contains-key?__  
Return True (T) if the list association contains de key 'key'.  

###### Parameters
``any`` : ``key`` : Key to look for.  
``list`` : ``list-values`` : List association of values.  

###### Return  
``bool`` : True (T) if exist key in list.  

###### Exemple  
Check if exist the key 2 in list.  

```lsp
(contains-key? 2 '((1 . "a") (2 . "b") (3 . "c"))) ; T
(contains-key? 2 '((1 . "a") (5 . "b") (3 . "c"))) ; nil
```

<br>
<br>

##### __list/association-list/contains-value?__  
Return True (T) if the list association contains the value 'find'.  

###### Parameters
``any`` : ``find`` : Value to look for.  
``list`` : ``list-values`` : List association of values.  

###### Return  
``bool`` : True (T) if exist the value in list.  

###### Exemple  
Check if exist the value "b" in list.  

```lsp
(contains-value? "b" '((1 . "a") (2 . "b") (3 . "c"))) ; T
(contains-value? "b" '((1 . "a") (5 . "h") (3 . "c"))) ; nil
```

<br>
<br>
<br>

### __block__  

##### __block/block-attr-values__  
Returns association list with the description and attribute value of a Block.  

###### Parameters  
``Entity Name`` : ``entity-name`` : Entity name of the block for extract the attributes.  

###### Return  
``list`` : List association with description and values of the attributes.  

###### Exemple  
The code below receives a Entity name from a Block and return a list of attributes.  

```lsp
(setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple

(block-attr-values entity-name) ; (("SNAME" . "name block") ("ZSIZE" . "56") ("LFXYZ" . "0,0,0") ("BEAMDI" . "0.0") ("CONEDE" . "34") ("CONEAN" . "10.0") ("BIASMAX" . "-1"))
```

<br>
<br>

##### __block/b-attr-description__  
Returns the description from a attribute entity.   

###### Parameters  
``list`` : ``data-attrib-entity`` : List of data from a entity name get with (entget) for exemple.  

###### Return  
``string`` : Description of the attribute entity.  


<br>
<br>

##### __block/b-attr-value__  
Returns the value from a attribute entity.  

###### Parameters  
``Entity Name`` : ``entity-name`` : List of data from a entity name get with (entget) for exemple.  

###### Return  
``string`` : Value of the attribute entity.  

<br>
<br>

##### __block/block-attr__  
Returns only the description of the attributes of a block.   

###### Parameters  
``Entity Name`` : ``entity-name`` : Entity name of the block.  

###### Return  
``list`` : List containing description of attributes.  

###### Exemple  
The code below receives a Entity name and return a list of description attributes.   

```lsp
(setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple

(block-attr entity-name) ; ("SNAME" "ZSIZE" "LFXYZ" "BEAMDI" "CONEDE" "CONEAN" "BIASMAX" "BIASMIN" "COLOR" "INTENSITY" "GNAME" "LAZ" "LAY" "LAX")
```

<br>
<br>

##### __block/block-values__  
Returns only the values of the attributes of a block.  

###### Parameters  
``Entity Name`` : ``entity-name`` : Entity name of the block.  

###### Return  
``list`` : List containing values of attributes.  

###### Exemple  
The code below receives a Entity name and return a list of values attributes.  

```lsp
(setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple

(block-values entity-name) ; ("name block" "56" "0,0,0" "0.0" "34" "10.0" "-1" "-1" "1,1,1" "1" "" "" "" "")
```

<br>
<br>

##### __block/block-value-by-attr__  
Returns the value corresponding to the attribute passed by parameter.  

###### Parameters  
``Entity Name`` : ``entity-name`` : Entity name of the block.  

###### Return  
``any`` : Value of the attribute.  

###### Exemple  
The code below receives a Entity name and a attribute and returne the value of attribute.   

```lsp
(setq entity-name <Entity name: 7ffffb0c8c0>) ; from (car (entsel)) for exemple

(block-value-by-attr entity-name "SNAME") ; "name block"
```

<br>
<br>

### __files__

##### __files/excell-files__  

##### __files/excell-files/write-sheet-default__  
This function is used to prepare a "writer" so that we can write by default specific spreadsheet 1.  
The "writer" function takes as a parameter the row and column of the cell to be written and the   
content to be written.   
For close file execute the "writer" function passing row or column = 0.   

###### Parameters  
``string`` : ``file-path`` : Excell file path.   

###### Return  
``function`` : Function used to write to a file.   

###### Exemple  
Write to a file in C:.   

```lsp
(setq writer-sheet (write-sheet-default "C:\\test.xlsx"))
(write-sheetr 1 1 "spreadsheet 1 by default, line 1 column 1")
(write-sheetr 1 2 "spreadsheet 1 by default, line 1 column 2")

; For save and close file.
(writer-sheet 0 0 "")
```

<br>
<br>

##### __files/excell-files/write-sheet__    
This function is used to prepare a "writer" so that we can write to a specific spreadsheet   
an xlsx file for example, so we can just pass the cell coordinate and the content we want   
to write to the file.   
The "writer" function takes as a parameter the row and column of the cell to be written and the   
content to be written.   
This function allows the user to specify which worksheet to write and can use multiple  
worksheets from the same file simultaneously.   
For close file execute execute any "writer" function passing row or column = 0.   

###### Parameters  
``list`` : ``sheet`` : List obtained with the def-sheet function.   

###### Return  
``function`` : Function used to write to a file.   

###### Exemple  
Write to a file in C: using spreadsheet 1 and spreadsheet 2 simultaneously.    
for this you must use the functions ``def-sheets`` and ``def-sheet``.   

```lsp
(setq sheets (def-sheets "C:\\test.xlsx"))

(setq sheet1 (def-sheet sheets 1)) ; Get for especific spreadsheet 1
(setq sheet2 (def-sheet sheets 2)) ; Get for especific spreadsheet 2

(setq writer-sheet-1 (write-sheet sheet1)) ; Writer to especific spreadsheet 1
(setq writer-sheet-2 (write-sheet sheet2)) ; Writer to especific spreadsheet 2

(writer-sheet-1 1 1 "spreadsheet 1, line 1 column 1") ; Writing "spreadsheet 1, line 1 column 1" in cell of line 1 and coluns 1 of spreadsheet 1
(writer-sheet-1 2 1 "spreadsheet 1, line 2 column 1") ; Writing "spreadsheet 1, line 2 column 1" in cell of line 2 and coluns 1 of spreadsheet 1

(writer-sheet-2 1 1 "spreadsheet 2, line 1 column 1") ; Writing "spreadsheet 2, line 1 column 1" in cell of line 1 and coluns 1 of spreadsheet 2
(writer-sheet-2 1 2 "spreadsheet 2, line 1 column 2") ; Writing "spreadsheet 2, line 1 column 2" in cell of line 1 and coluns 2 of spreadsheet 2

; For save and close file.
(writer-sheet-1 0 0 "")
```

<br>
<br>

##### __files/excell-files/def-sheets__    
def-sheets return a list containing a VLA-OBJECT Sheets and a VLA-OBJECT _Workbook  
for use with ``def-sheet`` function.  

###### Parameters  
``string`` : ``file-path`` : Excell file path.  

###### Return  
``list`` : List containing a VLA-OBJECT Sheets and a VLA-OBJECT _Workbook.   

###### Exemple  
Return VLA-OBJECT Sheets and a VLA-OBJECT _Workbook from a file.   

```lsp
(setq sheets (def-sheets "C:\\test.xlsx")) ; (#<VLA-OBJECT Sheets 00000000033f7278> #<VLA-OBJECT _Workbook 0000000026d1f258>)
```

<br>
<br>

##### __files/excell-files/def-sheet__    
def-sheets return a list containing a VLA-OBJECT Sheets and a VLA-OBJECT _Workbook   
for use with ``def-sheet`` function.   

###### Parameters  
``list`` : ``sheets`` : List obtained with the ``def-sheets`` function.   
``worksheet`` : ``file-path`` : Excell file path.  

###### Return  
``list`` : List containing a specific VLA-OBJECT _Worksheet and a VLA-OBJECT _Workbook.     

###### Exemple  
Return specific VLA-OBJECT _Worksheet and a VLA-OBJECT _Workbook from    
list obtained with the def-sheets function.   

```lsp
(setq sheets (def-sheets "C:\\test.xlsx")) ; (#<VLA-OBJECT Sheets 00000000033f7278> #<VLA-OBJECT _Workbook 0000000026d1f258>)

; Get específic spreadsheet 1 and 2
(setq sheet1 (def-sheet sheets 1)) ; (#<VLA-OBJECT _Worksheet 0000000032928678> #<VLA-OBJECT _Workbook 0000000026d1f258>)
(setq sheet2 (def-sheet sheets 2)) ; (#<VLA-OBJECT _Worksheet 000000003267e238> #<VLA-OBJECT _Workbook 0000000026d1f258>)
```

<br>
<br>

##### __files/excell-files/read-sheet-default__  
This function is used to prepare a "reader" so that we can read by default specific spreadsheet 1.  
The "reader" function takes as a parameter the row and column of the cell to be read.   
For close file execute the "reader" function passing row or column = 0.   

###### Parameters  
``string`` : ``file-path`` : Excell file path.   

###### Return  
``function`` : Function used to read to a file.   

###### Exemple  
Read to a file in C:.   

```lsp
(setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
(reader-sheet 1 1) ; "spreadsheet 1 by default, line 1 column 1"
(reader-sheet 1 2) ; "spreadsheet 1 by default, line 1 column 2"

; For close file.
(reader-sheet 0 0)
```

<br>
<br>

##### __files/excell-files/read-sheet__    
This function is used to prepare a "reader" so that we can read a specific spreadsheet of    
an xlsx file for example, so we can just pass the cell coordinate and we want read the file.    
The "reader" function takes as a parameter the row and column of the cell to be read.   
This function allows the user to specify which worksheet to write and can use multiple   
worksheets from the same file simultaneously.   
For close file execute execute any "reader" function passing row or column = 0.   

###### Parameters  
``list`` : ``sheet`` : List obtained with the def-sheet function.   

###### Return  
``function`` : Function used to read to a file.   

###### Exemple  
Read to a file in C: using spreadsheet 1 and spreadsheet 2 simultaneously.    
for this you must use the functions ``def-sheets`` and ``def-sheet``.   

```lsp
(setq sheets (def-sheets "C:\\test.xlsx"))

(setq sheet1 (def-sheet sheets 1)) ; Ger for especific spreadsheet 1
(setq sheet2 (def-sheet sheets 2)) ; Ger for especific spreadsheet 2

(setq reader-sheet-1 (read-sheet sheet1)) ; Read to especific spreadsheet 1
(setq reader-sheet-2 (read-sheet sheet2)) ; Read to especific spreadsheet 2

(reader-sheet-1 1 1) ; "spreadsheet 1 lina 1 column 1"
(reader-sheet-1 2 1) ; "spreadsheet 1 lina 2 column 1"

(reader-sheet-2 1 1) ; "spreadsheet 2 lina 1 column 1"
(reader-sheet-2 1 2) ; "spreadsheet 2 lina 1 column 2"

; For save and close file.
(reader-sheet-1 0 0)
```