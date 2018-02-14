

#Regular Expressions (regex)

Regular expressions are great for data cleaning or data wrangling. Always make a duplicate file before you work with regex. Use of regex is best for one time data file editing in an advanced text editor such as *notepad++*. For documentation on using regular expressions with *notepad++*  click [here](http://docs.notepad-plus-plus.org/index.php/Regular_Expressions),  for iterative string editing use the package `stringr()` documented [here](http://stringr.tidyverse.org/articles/regular-expressions.html), For searching strings use `grep()`, for iterating regular expressions use `regexpr() ` click [here](https://gotellilab.github.io/Bio381/Scripts/Feb07/HandlingAndProcessingStringsInR.pdf), For string search and editing in *Python* use the module `re` use this [link](https://docs.python.org/3/howto/regex.html) . See this [link](https://www.regular-expressions.info/tools.html) for more information on regular expressions.



### Use of literal searches


- a backslash `\` escapes the metacharacter (e.g. `.`, see below)
###​Wildcards
`.` finds any character other than a line return
`\w` a single word character [letter, number or ` `]
`\d` is a single number character [0-9]
`\t` a single tab
`\s` a single space, tab or linebreak
`\n` a single line break (or `\r` in notepad++)

### Quantifiers 

`\w+` one or more consecutive word characters (search for whole words)

`\w*` zero or more consecutive word characters, 

`\w{4}` find exactly 4 consecutive word characters

`\w{4,}` find three or more consecutive word characters

`\w{4,6}` find 4, 5, or 6 consecutive word characters

`.*` find everything "else on the line after the last character"

#### Examples 

- removing line breaks from .pdf copy paste
```
Cutting and pasting 
from a pdf 
is a pain 
in the butt
```
find: `\r` replace with: ``



- cleaning .csv style text

` crow, raven , grackle,starling, robin,    parrot ` 

find: ` \s*,\s*` , replace with: `,  ` 

`crow, raven, grackle, starling, robin, parrot`

- select an entire line

```
x, myword othejunk. ,
12, myword2, otherstuff, ,
x13, mythirdword, moretrash|##
xxx, lastword        x. 
```

find:`\w+,\s+\w+.*`  or find: `.+` 

### Capture 

`()` capture text 

`\1,\2` specify consecutive capture elements

in replacement string we can mix captured text with literal text. Its easier to build the capture string first then pick out what you will capture

**example 1:** 

``` 
x, myword othejunk. ,
12, myword2, otherstuff, ,
x13, mythirdword, moretrash|##
xxx, lastword        x. 
```

find: `\w+,\s+(\w+).*` replace with: `Important Stuff: \1`

```
Important Stuff: myword
Important Stuff: myword2
Important Stuff: mythirdword
Important Stuff: lastword
```

**example 2**



```
x, myword othejunk. ,
12, myword2, otherstuff, ,
x13, mythirdword, moretrash|##
xxx, lastword        x. 
```
find: (\w+),\s+(\w+)(.*) replace with: \2 \1 #\3
```
myword x # othejunk. ,
myword2 12 #, otherstuff, ,
mythirdword x13 #, moretrash|##
lastword xxx #        x. 
```

**example 3**
```
Lasius neoniger
Lasius umbratus
Myrmica lobifrons
```
find: `(\w)\w+\s(\w+)` replace with: `\1_\2`
```
L_neoniger
L_umbratus
M_lobifrons
```
find `(\w)\_(\w*)` replace with: `\1, \2`
```
L, neoniger
L, umbratus
M, lobifrons
```

### Create custom character sets

`\[A,C,T,G]+` find a single sequence of nucleotides
`\[^A,C,T,G]+` find a string that is NOT a sequence
`\[A,C,T,G]{20}`










