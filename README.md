# Cathedral

<img src="https://svgshare.com/i/F6A.svg" width="250" alt="Cathedral">

<br>

Cathedral is a collection of functions to be used in developing AutoLISP routines for AutoCAD. These functions provide  
new functionality for data processing in AutoLISP.

<br>

### Contribute  
Fork the project and create a Pull Request :)   
or send a sugestion in Issues :)    
Start the project and share! ;P   

<br>

#### Installation  

Download or clone the project.   
Add de root directory ``cathedral`` in ``Suport File Search Path`` of AutoCAD ``options`` configutarion.   
After you can load de file ``cathedral-load``   
```lsp
(load path-to-cathedral-load-file)
```  

Or add the file to load at AutoCAD initialization in ``appload`` configuration.  
And functions will be available from the autocad command line and its AutoLISP codes.   


<br>
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
  - [if-not](#coreif-not)
  - Date-Time
	- [date-time](#coredate-time-1)
- **Math**
  - [null-matrix?] (#null-matrix?)
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
    - [first](#listsimple-listfirst)
    - [rest](#listsimple-listrest)
    - [take-while](#listsimple-listtake-while)
    - [keep](#listsimple-listkeep)
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
	- [read-sheet](#filesexcell-filesread-sheet)
	- [read-row-while-get](#filesexcell-filesread-row-while-get)
	- [read-col-while-get](#filesexcell-filesread-col-while-get)
	- [read-row-at](#filesexcell-filesread-row-at)
	- [read-col-at](#filesexcell-filesread-col-at)
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
###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
<br>
<br>


##### __core/if-not__   
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
(if-not (= num 1)
  (+ num 5)) ; nil

(setq num 2)
(if-not (= num 1)
  (+ num 5)) ; 7
```

###### [Summary](#summary)
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

###### [Summary](#summary)
<br>
<br>
<br>

### __math__  


##### __math/null-matrix?__ 
null-matrix? function check if the matrix argument is a null matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to check.  

###### Return  
``bool`` : If the matrix is a null matrix return T else return nill.  

###### Exemple  
If the matrix is a null matrix return T else return nill.  

```lsp
(setq matrix '((1 2 3) (4 5 6)))
(null-matrix? matrix) ;; nill

(setq matrix '((0 0 0) (0 0 0)))
(null-matrix? matrix) ;; T
```

###### [Summary](#summary)
<br>
<br>


##### __math/null-matrix__ 
null-matrix function create a MxN null matrix.   

###### Parameters  
``int`` : ``m`` : Number of rows in the matrix.  
``int`` : ``n`` : Number of columns in the matrix.  

###### Return  
``list`` : Null matrix MxN.  

###### Exemple  
Return a Null matrix MxN.  

```lsp
(null-matrix 2 3) ; ((0 0 0) (0 0 0)
(null-matrix 4 4) ; ((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

###### [Summary](#summary)
<br>
<br>


##### __math/square-matrix?__ 
square-matrix? function check if a matrix is an square matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to check.   

###### Return  
``boll`` : Return T if the matriz is a square matrix, else return nill.  

###### Exemple  
Return T if the matriz is a square matrix, else return nill.  

```lsp
(setq matrix '((1 2 3) (4 5 6) (7 8 9)))
(setq matrix2 '((1 2 3) (4 5 6)))

(square-matrix? matrix) ; T
(square-matrix? matrix2) ; nill
```

###### [Summary](#summary)
<br>
<br>


##### __math/diagonal-matrix?__ 
Function diagonal-matrix? verify if the matrix is an diagonal matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to check.   

###### Return  
``boll`` : Return T if the matriz is a diagonal matrix, else return nill.  

###### Exemple  
Return T if the matriz is a diagonal matrix, else return nill.  

```lsp
(setq matrix '((1 0 0) (0 5 0) (0 0 9)))
(setq matrix2 '((1 2 3) (4 5 6)))

(diagonal-matrix? matrix) ; T
(diagonal-matrix? matrix2) ; nill
```

###### [Summary](#summary)
<br>
<br>


##### __math/nullify-diagonal-matrix__ 
Function nullify-diagonal-matrix nullify the main diagonal of a matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to alter.  

###### Return  
``list`` : Return a matrix with the main diagonal null (0).  

###### Exemple  
Return a matrix with the main diagonal null.  

```lsp
(setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))

(nullify-diagonal-matrix matrix) ; ((0 2 3) (4 0 6) (7 8 0)
```

###### [Summary](#summary)
<br>
<br>


##### __math/main-diagonal-matrix__ 
Function main-diagonal-matrix get the items of a main diagonal matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to get main diagonal.   

###### Return  
``list`` : Return values of main diagonal matrix.  

###### Exemple  
Return values of main diagonal matrix.  

```lsp
(setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))

(main-diagonal-matrix matrix) ; (1 5 9)
```

###### [Summary](#summary)
<br>
<br>


##### __math/identity-matrix?__ 
identity-matrix? function checks if a matrix is ​​identity matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to check.    

###### Return  
``bool`` : Return T if the matriz is ​​identity matrix, else return nill.  

###### Exemple  
Return T if the matriz is ​​identity matrix, else return nill.  

```lsp
(setq matrix '((1 0 0) (0 1 0) (0 0 1))
(setq matrix2 '((1 2 3) (4 5 6) (7 8 9)))

(square-matrix? matrix) ; T

(square-matrix? matrix2) ; nill
```

###### [Summary](#summary)
<br>
<br>


##### __math/identity-matrix__ 
identity-matrix returns an identity matrix.  

###### Parameters  
``int`` : ``n`` : Matrix size.  

###### Return  
``list`` : Returns an identity matrix of size n.  

###### Exemple  
Returns an identity matrix of size n.  

```lsp
(identity-matrix 4) ; ((1 0 0 0) (0 1 0 0) (0 0 1 0) (0 0 0 1))

(identity-matrix 3) ; ((1 0 0) (0 1 0) (0 0 1))
```

###### [Summary](#summary)
<br>
<br>


##### __math/transpose-matrix__ 
transpose-matrix returns the matrix transposed from a matrix.  

###### Parameters  
``list`` : ``matrix`` : Matrix to transpose.  

###### Return  
``list`` : Returns the transposed matrix.   

###### Exemple  
Returns the matrix transposed from a matrix.   

```lsp
(setq matrix '((1 2) (3 4) (5 6)))

(transpose-matrix matrix) ; ((1 3 5) (2 4 6))
```

###### [Summary](#summary)
<br>
<br>


##### __math/+matrix__ 
+matrix function adds two matrices.  

###### Parameters  
``list`` : ``matrix-a`` : Matrix to sum.   
``list`` : ``matrix-b`` : Matrix to sum.   

###### Return  
``list`` : Returns the sum of two matrices.  

###### Exemple  
Returns the sum of two matrices.  

```lsp
(setq matrix-a '((1 2) (3 4) (5 6)))
(setq matrix-b '((1 2) (3 4) (5 6)))

(+matrix matrix-a matrix-b) ; ((2 4) (6 8) (10 12))
```

###### [Summary](#summary)
<br>
<br>


##### __math/-matrix__ 
-matrix function subtracts two matrices.  

###### Parameters  
``list`` : ``matrix-a`` : Matrix to sub.   
``list`` : ``matrix-b`` : Matrix to sub.   

###### Return  
``list`` : Returns the subtraction of two matrices.  

###### Exemple  
Returns the sum of two matrices.  

```lsp
(setq matrix-a '((1 2) (3 4) (5 6)))
(setq matrix-b '((2 1) (8 4) (5 10)))

(-matrix matrix-a matrix-b) ; ((-1 1) (-5 0) (0 -4))
```

###### [Summary](#summary)
<br>
<br>


##### __math/*smatrix__ 
*smatrix function multiplies a scalar by an matrix.  

###### Parameters  
``int`` : ``scalar`` : Scalar to multiply.  
``list`` : ``matrix`` : Matrix to multiply.  

###### Return  
``list`` : Returns a matrix resulting from multiplication.  

###### Exemple  
Returns a matrix resulting from multiplication.  

```lsp
(setq matrix '((2 3) (4 6)))

(*smatrix 2 matrix) ; ((4 6) (8 12))
```

###### [Summary](#summary)
<br>
<br>


##### __math/*matrix__ 
*matrix function multiplies two matrices.  

###### Parameters  
``list`` : ``matrix-a`` : Matrix to multiply.  
``list`` : ``matrix-b`` : Matrix to multiply.  

###### Return  
``list`` : Returns a matrix resulting from multiplication.  

###### Exemple  
Returns a matrix resulting from multiplication.  

```lsp
(setq matrix-a '((2 3) (4 6)))
(setq matrix-b '((1 2 0) (2 1 1)))

(*matrix matrix-a matrix-b) ; ((8 9 3) (16 18 6))
```

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
<br>
<br>

##### __list/simple-list/first__  
Return the first element of a list, like car.   

###### Parameters   
``list`` : ``list-values`` : List of values.   

###### Return  
``any`` : First element of a list.  

###### Exemple  
Return the first element of a list.  

```lsp
(first '(5 6 2 7 9 8)) ; 5
```

###### [Summary](#summary)
<br>
<br>

##### __list/simple-list/rest__  
Returns the elements of a list except the first item, like cdr.   

###### Parameters   
``list`` : ``list-values`` : List of values.   

###### Return  
``list`` : Elements of a list except the first item.   

###### Exemple  
Returns the elements of a list except the first item.   

```lsp
(rest '(5 6 2 7 9 8)) ; (6 2 7 9 8)
```

###### [Summary](#summary)
<br>
<br>

##### __list/simple-list/take-while__  
Returns a list of elements where the passed function returns True.   
Stop when the function returns nil for any element.   

###### Parameters   
``function`` : ``callback`` : Function for test elements.    
``list`` : ``list-values`` : List of values.    

###### Return  
``list`` : List of elements while returning function True.   

###### Exemple  
Returns a list of elements while the function returned True.   

```lsp
(setq list-values '(-1 -2 -3 -4 8 9 3 7 -6 -3))
(take-while neg? list-values) ; (-1 -2 -3 -4)
```

###### [Summary](#summary)

<br>
<br>

##### __list/simple-list/keep__  
Return a list of result application a callback function in elements of a list.   

###### Parameters   
``function`` : ``callback`` : Function for apply in elements.    
``list`` : ``list-values`` : List of values.    

###### Return  
``list`` : List of result application function in elements of a list.   

###### Exemple  
Sum 2 for each element in a list.   

```lsp
(setq list-values '(1 2 3 4 5))
(keep (lambda (x) (+ x 2)) list-values) ; (3 4 5 6 7)
```

###### [Summary](#summary)

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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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

###### [Summary](#summary)
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


###### [Summary](#summary)
<br>
<br>

##### __block/b-attr-description__  
Returns the description from a attribute entity.   

###### Parameters  
``list`` : ``data-attrib-entity`` : List of data from a entity name get with (entget) for exemple.  

###### Return  
``string`` : Description of the attribute entity.  


###### [Summary](#summary)
<br>
<br>

##### __block/b-attr-value__  
Returns the value from a attribute entity.  

###### Parameters  
``Entity Name`` : ``entity-name`` : List of data from a entity name get with (entget) for exemple.  

###### Return  
``string`` : Value of the attribute entity.  


###### [Summary](#summary)
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

###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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


###### [Summary](#summary)
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
###### [Summary](#summary)

<br>
<br>

##### __files/excell-files/read-row-while-get__  
The function read-row-while-get reads the contents of the parameter row as long as it has contents in the columns.   
If find a column without content stop the reading.   

###### Parameters  
``int`` : ``row`` : Line number for reading.   
``function`` : ``reader-sheet`` : "Reader" obtained with the ``read-sheet-default`` or `` read-sheet`` function.   

###### Return  
``list`` : List containing the content read from the line in the file.   

###### Exemple  
Read line from a file in C:.  

```lsp
(setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
(read-row-while-get 1 reader-sheet) ; ("A" "B" "C" "D" "E")
(read-row-while-get 2 reader-sheet) ; ("Line 2 A" "Line 2 B" "Line 2 C" "Line 2 D" "Line 2 E")

; For close file.
(reader-sheet 0 0)
```
###### [Summary](#summary)

<br>
<br>

##### __files/excell-files/read-row-at__  
The function read-row-at reads the contents of the parameter row from the first column to the column    
indicated in the second parameter, including empty columns.    

###### Parameters   
``int`` : ``row`` : Line number for reading.   
``int`` : ``col-limit`` : Indicates up to which column to read.   
``function`` : ``reader-sheet`` : "Reader" obtained with the ``read-sheet-default`` or `` read-sheet`` function.   

###### Return  
``list`` : List containing the content read from the line in the file from column 1 to col-limit.    

###### Exemple  
Read line from a file in C:.    

```lsp
(setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
(read-row-at 1 5 reader-sheet) ; ("A" "B" "C" "D" "E")
(read-row-at 1 8 reader-sheet) ; ("A" "B" "C" "D" "E" "" "" "")
(read-row-at 2 7 reader-sheet) ; ("Line 2 A" "Line 2 B" "Line 2 C" "Line 2 D" "Line 2 E" "" "Line 2 G")

; For close file.
(reader-sheet 0 0)
```
###### [Summary](#summary)

<br>
<br>

##### __files/excell-files/read-col-while-get__  
The function read-col-while-get reads the contents of the parameter col as long as it has     
contents in the rows. If find a row without content stop the reading.    

###### Parameters   
``int`` : ``col`` : Column number for reading.   
``function`` : ``reader-sheet`` : "Reader" obtained with the ``read-sheet-default`` or `` read-sheet`` function.   

###### Return   
``list`` : List containing the content read from the rows in the file.    

###### Exemple   
Read line from a file in C:.    

```lsp
(setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
(read-col-while-get 1 reader-sheet) ; ("A" "F" "K")
(read-col-while-get 2 reader-sheet) ; ("B" "G" "L")

; For close file.
(reader-sheet 0 0)
```
###### [Summary](#summary)

<br>
<br>

##### __files/excell-files/read-col-at__  
The function read-col-at reads the contents of the parameter col from the first row   
to the row indicated in the second parameter, including empty row.    

###### Parameters   
``int`` : ``col`` : Column number for reading.    
``int`` : ``row-limit`` : Indicates up to which row to read.     
``function`` : ``reader-sheet`` : "Reader" obtained with the ``read-sheet-default`` or `` read-sheet`` function.   

###### Return  
``list`` : List containing the content read from the column in the file from row 1 to row-limit.    

###### Exemple  
Read column from a file in C:.    

```lsp
(setq reader-sheet (read-sheet-default "C:\\test.xlsx"))
(read-col-at 1 5 reader-sheet) ; ("A" "F" "K" "" "")

; For close file.
(reader-sheet 0 0)
```
###### [Summary](#summary)


___

<div>
	Icons made by
	<a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">
		Eucalyp
	</a>
	from
	<a href="https://www.flaticon.com/" title="Flaticon">
		www.flaticon.com
	</a>
</div>
