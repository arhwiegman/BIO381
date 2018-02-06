## ----setup, include=FALSE------------------------------------------------
#local R code chunks options are controlled above 
#knitr global options are controlled below
knitr::opts_chunk$set(echo = TRUE)

## ----echo=FALSE----------------------------------------------------------
library(ggplot2)
waterTemp <-runif(50) # cammel hump cammelHump naming convention
planktonAbun <- runif(50)
# qplot does not require a dataframe
qplot(x=waterTemp, y=planktonAbun)
# assigning x and y equal sign 
# print(waterTemp) #print statement
# head(waterTemp) # prints first six elements of a vector
# use "ctrl shift c" to insert/remove # before selected lines

## ---- echo=TRUE,eval=TRUE,message=FALSE----------------------------------
qplot(x=waterTemp)

