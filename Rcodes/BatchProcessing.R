# Batch Processing in R
#####################################
# FUNCITON: FileBuilder
# create a set of random files for regression
# input: fileN - number of files to create
#      : fileFolder - name of folder for files
#      : fileSize - c(min,max) number of rows in file
#      : fileNA - number on average of NA per column
# output: set of random files
#-----------------------------------
FileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles",
                        fileName = "randomXY",
                        fileSize=c(15,100),
                        fileNA=3){
  for (i in seq_len(fileN)){
    if(dir.exists(fileFolder)){}else{dir.create(fileFolder)}
    fileLength <- sample(fileSize[1]:fileSize[2],size=1)
    varX <- runif(fileLength) #random x values
    varY <- runif(fileLength) #random y values
    df <- data.frame(varX,varY) #bind to dataframe
    badVals <- rpois(n=1,lambda=fileNA) #random poisson gives an integer
    df[sample(nrow(df),size=badVals),1]<-NA# random sample of a vector in x col
    df[sample(nrow(df),size=badVals),2]<-NA# y column
    fileLabel <- paste0(fileFolder,"/",fileName,
                        formatC(i,width=3,format="d",flag="0"), 
                        # adds padding of zeros infront of i
                        ".csv")
    #set up data file and incorporate time stamp
    # METADATA using cat()
    write.table(cat("# Simulated random data file for batch processing \n",
                    "# timestamp: ", as.character(Sys.time()),"\n",
                    "# Adrian Wiegman \n",
                    "------------------------------- \n",
                file=fileLabel,
                row.names="",
                col.names="",
                sep=""))
    write.table(x=df,file=fileLabel,sep=",",row.names=FALSE,append=TRUE)
  }# end for loop 
  
}# end function FileBuilder
#FileBuilder() 

#############################################
# FUNCTION: regStats
# fit linear regression model, get stats
# input: 2 column data frame
# output: slope,p-value,r2
#------------------------
regStats <- function(d=NULL){
  if(is.null(d)){
    xVar <- runif(10)
    yVar <- runif(10)
    d <- data.frame(xVar,yVar)
  }
  . <- lm(data=d,d[,2]~d[,1]) # column y 
  . <- summary(.)
  statsList <- list(Slope=.$coefficients[2,1],
                    pVal=.$coefficients[2,4],
                    r2=.$r.squared)
  return(statsList)
} #end function regStats
#regStats()

#MAIN PROGRAM-----------------
library(TeachingDemos)
char2seed("Freezing March")

#---------------------------
#Global Variables
fileFolder <- "RandomFiles"
nFiles <- 100
fileOut <- "StatsSummary.csv"

# create 100 files
FileBuilder(fileN=nFiles)
  
  
    