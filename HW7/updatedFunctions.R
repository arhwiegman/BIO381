#########################################################################
#FUNCTION: creatExperiment
# function to simulate random normal data for a specified balanced experimental setup
#inputs: 
# number of factors, blocks, levels, replications in experiment
# sample mean and standard deviation of all samples
# the effect size of factors, blocks, treatments, replications

#outputs:
# a datafram containing random data and treatment factors
#notes on updates:
# - This is a revised version of simulateData, which operated very slowly
# because the function called c() to build vectors within a for loop. This version pre-assigns the mode and length of vectors based on the number of factors, blocks, levels and replications. 
# - The response variable model can now be specified in a string using the same notation as lm() 
#   y~x1+x2 --> y = b0 + b1*x1 + b2*x2 + E
    
#-------------------------------------------------------------------------
createExperiment <- function(nFactors = 1, #number of treatment factors
                         nBlocks = 1, #number of study blocks or sites
                         nLevels = 3, #number of treatment levels for each factor
                         nReps = 10, #number of observations or reps per treatment level per block
){
  nTotal <- nFactors*nBlocks*nLevels
  ID <- vector(mode = "numeric", length = 0)
  fact <- NULL
  block <- NULL
               level <- NULL
               observation <- NULL
               response <- NULL
               i <- 0
               for (f in seq(1,nFactors)){
                 for (b in seq(1,nBlocks)){
                   for (trt in seq(1,nTreats)){
                     for (r in seq(1,nReps)){
                       i <- i + 1
                       ID[i] <- i
                       fact[f] <- f
                       block[b] <- b
                       level[l] <- l
                       repetition[r] <- r
                     } # end o loop
                   } # end t loop
                 } # end b loop
               } # end f loop
               df <- data.frame(ID,
                                  as.factor(fact),
                                  as.factor(block),
                                  as.factor(treatment),
                                  repetition,
                                  response)
               return(df)
} 
#########################################################
#simulateData()
# function to simulate random normal data for a specified balanced experimental setup
#inputs: 
# number of factors, blocks, levels, replications in experiment
# sample mean and standard deviation of all samples
# the effect size of factors, blocks, treatments, replications

#outputs:
# a datafram containing random data and treatment factors
#notes on updates:
# - This is a revised version of simulateData, which operated very slowly
# because the function called c() to build vectors within a for loop. This version pre-assigns the mode and length of vectors based on the number of factors, blocks, levels and replications. 
# - The response variable model can now be specified in a string using the same notation as lm() 
#   y~x1+x2 --> y = b0 + b1*x1 + b2*x2 + E

#-------------------------------------------------------------------------
AVG = 20, #average accross all samples 
SD = 5, #standard deviation across all samples
Bf = 0, #factor effect or Beta factor
Bb = 0, #block effect or Beta block
Bl = 5, #treatment effect or Beta block
Br = 0 #observation effect if time series trend
eqn = "AVG + Xf*Bf + Xb*Bb + Xl*Bl + Xr*Br + SD*rnorm(n=1)"
response[i] <- eval(parse(text=paste(eqn))
                  
