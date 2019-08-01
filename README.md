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
  - [pipe](#corepipe)
  - [not=](#corenot)
  - [notnull](#corenotnull)
  - [neg?](#coreneg)
  - [even?](#coreeven)
  - [odd?](#coreodd)
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
  - Association List
    - [only-keys](#listassociation-listonly-keys)
    - [only-values](#listassociation-listonly-values)
    - [where](#listassociation-listwhere)
    - [contains-key?](#listassociation-listcontains-key)
    - [contains-value?](#listassociation-listcontains-value)
*******

<br>
<br>

### __core__

##### __core/pipe__  

Creates a function pipe by passing the result of a function as a parameter to the next function.

###### Parameters  
``list`` : ``callbackList`` : List of callback functions will be executed in the order they appear in the list.
``any`` : ``value`` : Value to be processed.

###### Return  
``any`` : Result after the application of the functions on the value.

###### Exemple  
The code below receives a string and first passes to the stlen function that returns the string size, then passes that  
result to the zerop function that checks whether it is a zero or not, thus checking whether the string is empty or not.  

```lsp
(pipe (list strlen zerop) "testing") ; T
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