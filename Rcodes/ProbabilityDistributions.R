# Using Probability Simulation in R
# February 15 2018
# Adrian Wiegman
# stochastic vs deterministic models

# install/load necessary packages
library(ggplot2)

#generate random uniform data
testData <- runif(1000)
qplot(x=testData)

#creating a function in R to make custom graphs
#functions must go at the top of programs so that 
#they can be compiled into the memory 
#///FUNCTIONS-----------------------

#_Function Histo
# better histogram plot
# input xData = numeric vector
# input fColor = fill color
# output = corrected ggplot histogram
# output = summary statistics 
# output = 95% interval
Histo <- function(xData=runif(1000),fColor='salmon') {z <-qplot(x=xData,color=I('black'),fill=I(fColor),xlab='X',boundary=0) 
print(z)
print(summary(xData))
print(quantile(x=xData,probs=c(0.025,0.975)))
}
#function(){} is an R function for building functions
#qplot() is a ggplot function
#I() is a variable for passing arguments?????

#Function IHisto
#works better than histo for integer values!
#input xData = vector of integers
#input fColor = fill color
#output = summary of x data 
#output = 95% confidence interval
iHisto <- function(xData=runif(1000),fColor='salmon') {z <-qplot(x=factor(xData),color=I('black'),fill=I(fColor),xlab='X',boundary=0) 
print(z)
print(summary(xData))
print(quantile(x=xData,probs=c(0.025,0.975)))
}


#///MAIN PROGRAM-------------------------
Histo()
temp <- rnorm(1000)
Histo(xData=temp,fColor='yellow1')
IHisto()
#Poisson distribution
temp2 <- rpois(n=1000,lambda=0.5) #poisson distribution, lamba represents the average rate of events per sampling interval
#poisson gets more course as lambda approaches zero
iHisto(temp2)
iHisto(xData=temp2, fColor='springgreen')
mean(temp2==0) # mean of a string of TRUE FALS that were coerced to integer

# Binomial distribution
# integer from 0 to number of trials
# input parameters...
# n= number of trials
# size= number of replications per trial
# p= probaility of success
zz <- rbinom(n=1000,size=40,p=0.75)
iHisto(xData=zz,fColor='slateblue')
