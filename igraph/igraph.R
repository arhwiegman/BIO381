# igraph
# network visualization and stats
# 20180426

install.packages('igraph')
install.packages('igraphdata')
library(igraph)
library(igraphdata)

g1 <- graph(edges = c(1,2,2,3,3,1),n=3,directed=FALSE)
g1
plot(g1)

#directed
g2 <- graph(edges=c(1,2,2,3,3,1,5,6,6,7,8,1),n=18)
plot(g2)

g3 <- graph(edges = c('carol','george','george','paul','paul','carol'))
plot(g3)

g4 <- graph(edges = c('carol','george','george','paul','paul','carol'), isolates = c('jeremy','nick','sherry'))
plot(g4)

# based edges
plot(graph_from_literal(a--b,b-c))
plot(graph_from_literal(a--+b,b-+c))

#edges
E(g4)

#Vertices
V(g4)

#look at network matrix
g4[]

V(g4)$name
V(g4)$gender <- c('f','m','m','m','m','f')
vertex_attr(g4)

# add color based on category
plot(g4, edge.arrow.size=1,vertex.label.color='black',vertex.label.list=2,vertex.color=c('pink','blue')[1+(V(g4)$gender=='m')])

# add color based on category
plot(g4, edge.arrow.size=1,vertex.label.color='black',vertex.label.list=2,vertex.color=c('pink','blue')[1+(V(g4)$gender=='m')],vertex.shape='rectangle',edge.color='green',edge.width=4,frame=TRUE)

#graph with no connections
eg <- make_empty_graph(100)
plot(eg)

#
fg <- make_full_graph(50)
plot(fg)

st <- make_star(50)
plot(st)

tr <- make_tree(50, children=3, mode= 'undirected')
plot(tr)

data(package="igraphdata")
data("immuno")
class(immuno)
immuno

plot(immuno, vertex.label=NA, vertex.size=4)

# centrality measures

#degree
deg <- degree(immuno, mode='all')
str(deg)
plot(deg)
hist(deg)

# centralization and max
deg2 <- centr_degree(immuno, normalized=TRUE)
str(deg2)

#closeness 
clos <- closeness(immuno,weights=NA)
str(clos)
plot(clos)
centr_clo()

#eigenvectors
eig <- eigen_centrality(immuno, directed=FALSE)
str(eig)
plot(eig[[1]])
centr_eigen()

#betweenness
bet <- betweenness(immuno,directed=FALSE,weights=NA)
str(bet)
plot(bet)
bet2 <- edge_betweenness(immuno, directed=FALSE, weights=NA)
centr_betw()

# hub and authority nodes 
hs <- hub_score(immuno, weights=NA)
str(hs)
hs$vector

as <- authority_score(immuno,wieghts=NA)$vector
par