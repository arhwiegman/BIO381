# made4 co-inertia analysis
library(made4)
getwd()
setwd("C:/Users/Adria/Documents/R/Projects/BIO381/made4")
res_mat <- read.csv("res_mat_abun.csv")
bac_mat <- read.csv("bac_mat_abun.csv")
vf_mat <- read.csv("vf_mat_abun.csv")
str(res_mat)
#so clean thus up by setting all values to numeric, except not the gene names
res_mat_all <- res_mat[,-c(1)]
res_mat_all[] <- lapply(res_mat_all[], as.numeric)
rownames(res_mat_all) <- res_mat$Name
head(res_mat_all)
str(res_mat_all)

# find rows where all are zeros
. <- lapply(res_mat_all, function(x) all(x == 0))
. <- which(. == "TRUE")
# remove those columns
res_mat2 <- res_mat_all[,-.]
head(res_mat_all)

# repeat that
bac_mat_all <- bac_mat[,-1]
bac_mat_all[] <- lapply(bac_mat_all[], as.numeric)
rownames(bac_mat_all) <- bac_mat$Name
bac_mat2 <- bac_mat_all[,-.]
head(bac_mat2)
str(bac_mat2)

vf_mat_all <- vf_mat[,-1]
vf_mat_all[] <- lapply(vf_mat_all[], as.numeric)
rownames(vf_mat_all) <- vf_mat$Name
vf_mat2 <- vf_mat_all[,-.]
head(vf_mat2)
str(vf_mat2)

library(made4)
browseVignettes("made4")


overview(res_mat2)


res_coa<-ord(res_mat2, type= "coa")

summary(res_coa$ord)

plot(res_coa)

plotgenes(res_coa)
plotarrays(res_coa)
#including generating in 3d
do3d(res_coa$ord$li)
do3d(res_coa$ord$co)


