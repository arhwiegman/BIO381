#Cluster Analysis
# 20180425
library(cluster)
library(factoextra)
library(ggplot2)
library(NbClust)

# prepare data
iris.scaled <- scale(iris[,-5])
head(iris.scaled)

# Step 1: do clusters exist?

Hopkins <- get_clust_tendency(iris.scaled,
                              n=nrow(iris.scaled) -1,
                              seed=123)
Hopkins$hopkins_stat

# Step 2: caclulate distance 

distgower <- daisy(iris.scaled,
                  metric = 'gower',
                  stand = TRUE)

DistanceMap <- fviz_dist(dist.obj = distgower,
                         show_labels = TRUE,
                         lab_size = 4)
DistanceMap

# Step 3: cluster using K-means
set.seed(123)
km.res <- kmeans(iris.scaled,
                 centers=6, #NOT CORRECT
                 iter.max=250,
                 nstart=25) #how many random centers to we set
head(km.res)

fviz_cluster(km.res,
             data=iris,
             choose.var = c('Sepal.Length','Petal.Width'),
             stand= TRUE)

# What is the right number of Clusters

# Method 1: Elbow Method

fviz_nbclust(iris.scaled,
             FUNcluster = kmeans,
             method = 'wss')
# looks for marginal decrease in sum of squares with additional cluster

# Method 2: sulhouette
fviz_nbclust(iris.scaled,
             FUNcluster = kmeans,
             method = 'silhouette') + theme_classic()

# method 3: gap_stat
fviz_nbclust(iris.scaled,
             FUNcluster = kmeans,
             nstart = 25,
             method = 'gap_stat',
             nboot = 500) + theme_classic()
# the standard nboot is 1000

# Method 4: Test All

nb <- NbClust(iris.scaled,
              distance = 'euclidean',
              max.nc = 10,
              min.nc = 2,
              method = 'kmeans') + theme_classic()

# Validating the results

km.res <- eclust(iris.scaled,
                 stand = FALSE,
                 'kmeans',
                 hc_metric = 'manhattan',
                 k = 3)

fviz_silhouette(km.res,palette = 'jco')
# the goal is to minimize negative values

#### Approach 2: Herarchical Cluster
# starts with each individual as a cluster
res.agnes <- agnes(x = distgower,
                   diss = TRUE,
                   stand = TRUE,
                   metric = 'euclidian',
                   method = 'ward')
fviz_dend(res.agnes,
         cex = 0.6)


nb <- NbClust(iris.scaled,
              distance = 'euclidean',
              max.nc = 10,
              min.nc = 2,
              method = 'ward.D2') + theme_classic()
# ***** Conclusion *****                            
#   
#   * According to the majority rule, the best number of clusters is  2 
fviz_dend(res.agnes,
          cex = 0.6,
          k = 2,
          rect = TRUE)

# Visualizing Dendrograms

fviz_dend(res.agnes,
          k = 2,
          k_color = "jco",
          type = "phylogenic",
          repel = TRUE,
          phylo_layout = "layout.gem")

fviz_dend(res.agnes,
          k=

# get p values for clusters            
install.packages('pvclust')
data('lung')

ss <- sample (1:73,30)
newdata <- lung[,ss]
res.pv <- pvclust(newdata, method.hclust = 'average', 
                  method.dist = 'correlation',
                  nboot = 300)
plot(res.pv)
#this can take a very long time
# there are packages to parallel compute 



