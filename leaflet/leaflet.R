setwd("C:/Users/Adria/Documents/R/Projects/BIO381/leaflet")
if (!require("leaflet")) install.packages("leaflet")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("maps")) install.packages("maps")
if (!require("TeachingDemos")) install.packages("TeachingDemos")
char2seed("Professor Looney")
dF <- read.csv("leafletData30.csv")
dF2<- read.csv("leafletData500.csv")
cities<- read.csv("cities.csv")

# leaflet() creates a map widget that can stre variables to be modified later on
# addTiles() adds mapping data from 'open street map'
# %>% is a pipe, which takes an output of one function and assigns it to another function

# piping notation
my_map <-  leaflet() %>% addTiles()
my_map


# without pipiing notation
my_map <- addTiles(leaflet())
my_map

# copy and paste!!!
uvmIcon <- makeIcon(iconUrl = "UVM.jpg", # call the image
                    iconWidth = 31*215/230,
                    iconHeight= 31,
                    iconAnchorX= 31*215/230/2,
                    iconAnchorY= 16
) # what i found to be the best length,height,width for marker
UVMLatLong <- data.frame(
  lat= c(44.4779),
  lng= c(-73.1965)) #lat & lng for your data point 
UVMLatLong %>%
  leaflet()%>%
  addTiles()%>%
  addMarkers(icon= uvmIcon) # what icon do u want

# Circles with radius proportional to size
print(circles)
leaflet(cities) %>%
  addTiles() %>%
  addCicles(lng=~long,lat=~lat,wieght=1,radius=~sqr(pop)*30,popup=~city)
