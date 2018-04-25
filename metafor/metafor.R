# metafor for meta-analyses
# yi = theta_i + vi
# yi - observed effect 
# theta_i - true effect
# vi - variance 

# theta_i = mew_i + u_i
# mew_i - true effect 
# U_i - sample variance

# metafor functions
library(metafor)
dat <- dat.normand1999
dat
str(dat)

# standardized mean difference to generate yi vi
SMDdat <- escalc(measure='SMD',
                 m1i=m1i,
                 sd1i=sd1i,
                 n1i=n1i,
                 m2i=m2i,
                 sd2i=sd2i,
                 n2i=n2i,
                 data=dat)
SMDdat

# fit
myModel <- rma(yi=yi,vi=vi, data=SMDdat)
print(myModel)

dat<-dat.curtis1998
dat


# Correlation coefficient for comparing two continuous variables
dat <- dat.mcdaniel1994
# fischer's transform statistic, good normality adjustment
# better than raw correlation coefficient
Zdat <- escalc(measure="ZCOR", ri=ri,ni=ni, data=dat)
head(Zdat)
myModel <- rma(yi=yi,vi=vi, data=Zdat)
print(myModel)
# high I^2 score means that high proportaion of variability is due to treatment


