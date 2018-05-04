# manipulating strings in R
# Adiran Wiegman
# 20180501

# I. Define Functions --------------------------------------------
##################################################################
# I.1
# pkg.info() 
# returns list of info on loaded non-base R packages
pkg.info <- function() sessionInfo()$otherPkgs
pkg.info()

##################################################################
# I.2
# pkg.names() 
# returns character vector of load non-base R packages
pkg.names <- function() names(sessionInfo()$otherPkgs)
pkg.names()

##################################################################
# I.3
# require.pkgs()
# checks to see if package is installed, then installs and loads 
require.pkgs <- function(p=c('vector of','packages')){
  ifelse(!is.element(p,installed.packages()[,1]),
         sapply(p, install.packages, character.only=T),
         sapply(p, require, character.only=T))
}
require.pkgs()

##################################################################
# I.4
# detach.pkgs()
# detaches all non-base R packages
detach.pkgs <- function(){
  . <- menu(c("Yes", "No"),title="Do you want to detach all packages?")
  if(.!=1){stop('function aborted')}else{
    lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),detach,character.only=TRUE,unload=TRUE)
  }
}
detach.pkgs()
######################################################################
# I.5
# find.links()
# searches for hyperlinks (http...) in character strings
find.links <- function(x){
  require('stringr')
  require('magrittr')
  str_extract_all(x,"http[^[:space:]]*") %>% unlist()
}

##################################################################
# I.6
# file.remove.warning
# insert warning requiring user feedback before deleting a vector of files
file.remove.warning <- function(x=NULL){
  xfiles <- paste(x,collapse=', ')
  warning <- paste("WARNING: Do you want to delete",xfiles,"from the following path? \n",getwd())
  . <- menu(c("Yes", "No"),title=warning)
  if(.!=1){stop('function aborted')}else{
    cat("deleting files...")
    file.remove(x)
  }
}
file.remove.warning()

##################################################################
# I.7
# parent.dir()'
# returns the parent of working directory
parent.dir <- function(){
  require('stringr')
  require('magrittr')
  x <- getwd()
  # get names of subdirectories
  x <- str_split(x,"/") %>% unlist()
  # get path minus working directory folder 
  x <- str_c(x[-length(x)],collapse='/')
  return(x)
}
parent.dir()

# II. Preliminaries ----------------------------------------------
set.seed(1) #for repeatable random numbers
pkg.names()
require.pkgs(c('stringr',"magrittr",'openxlsx'))

#III. Stringr practice ---------------------------------

# start by getting some strings to work with
s1 <- pkg.names()
s1

# capture.output() return a vector of console print lines
s2 <- capture.output(pkg.info())
s2

# random sample of s2
s3 <- sample(s2,5,replace=FALSE)
s3

# characert lenght of a vector of stringr
str_length(s3)
str_length

# wrap text after a certain number of chars
str_wrap(s3,1)
str_wrap(s1,1) #doesnt cut of words

# returns TRUE if arg is element
str_detect(s3,"a")

str_replace(s3,"a","(>*_*)>")

# str_trim to remove space on edges
str_trim(s3)
s3

# str_split split on a character
str_split(s3," ")

#str_sub subsets a line or single character string on a start and end position
str_sub(s1,1,3)
str_sub(s3,-5,8) #if you structure this right you grab text in reverse order

# similar to paste but more complex
str_c(s1,s3, sep=" %>% ") # creates warning error
str_c(s1, sep=" %>% ") # doesnt do anything
str_c(s1, collapse="%>%")


#works with pipes
str_trim(s3) %>%
  str_split(" ") %>%
  unlist() %>%
  str_to_upper()

# REGULAR EXPRESSIONS
str_extract_all(s2,"http[^[:space:]]*") %>% unlist()
mylinks <- find.links(s2)

# BATCH PROCESSING AND FILE MANIPULATION

#create a tmp folder
tmp <- paste0('tmp',Sys.Date())
dir.create(tmp)
setwd(tmp)

# create some files
f <- paste0(rep("file",10),1:10,".tmp")
for (i in seq_along(f)) readr::write_file("empty",f[i])

f <- paste0('tmp',1:10,'.xlsx')

mydata <- c(str_c("# ",s1),str_c(" l, ",mylinks,", data"))
for (i in seq_along(f))write.xlsx(mydata,f[i],overwrite=TRUE)

. <- str_extract(dir(),"^tmp.*")
f <- .[!is.na(.)]
s <- NULL*length(f) 
for (i in seq_along(f)){
  s <- capture.output(read.xlsx(f[i]))
  cat(i,'doing something with data..')
  mylinks == findlinks(s2)
}
dir()






