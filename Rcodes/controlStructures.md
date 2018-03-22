Control Structure 
executes expression if condition is TRUE
```
if (condition){expression...} 
```

two branch control structure IF ELSE 
single line
```
if(condition){expression1}else{expression2}
```
three or more branched control structure
```
if(condition){expression1}else
if(condition2){expression2}else{expression3}
```
branched control structure

there is also a switch function for long branching control structures

readability is an issue in with long control structures
it is very nice to collapse expressions of control structures into functions
```
if(condition) function1() else
	if(condition2) {function2()}
	function3
```

if for working with vector
`ifelse(test,yes,no)`
'object' that can be coerced to a yes(TRUE) or no(FALSE) value
yes = return values for false elements
no = return value for false elements

insect that lays eggs(~poisson lambda = 10.2)
parasitism p = 0.35


for loops in R 
-are often not necessary
-becaus most of R is vectorized
-very slow with bunding operations: `c(),rbind(),cbind(),list()` beacuse these functions must store a copy of arguments in memory
```
for (var in seq){
	body of loop
} #end of loop
```
`var` is our counter variable it is an integer that holds the current iteration number of the loop
use i,j,k,m,n 
BE CAREFUL using t because it is also a function t(x)  which transposes rows and columns of matrix x

`seq` is an integer vector, 1:10

