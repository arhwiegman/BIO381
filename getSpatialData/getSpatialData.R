# `getSpatialData`
# https://github.com/16EAGLE/getSpatialData
if (!require('getSpatialData'))devtools::install_github("16EAGLE/getSpatialData")

## Load packages
library(getSpatialData)
library(sf)
library(sp)

# aoi - AREA OF INTEREST --------------------
# Define aoi either matrix, sf or sp object)
data("aoi_data") # example aoi

aoi <- aoi_data[[3]] # AOI as matrix object, or better:
aoi <- aoi_data[[2]] # AOI as sp object, or:
aoi <- aoi_data[[1]] # AOI as sf object
#instead, you could define an AOI yourself, e.g. as simple matrix

# set AOI for this session
set_aoi(aoi)
view_aoi() #view AOI in viewer, which will look like this:

# manually set aoi by calling set_aoi() default
set_aoi()

## After defining a session AOI, define time range and platform
time_range <-  c("2017-08-01", "2017-08-30")
platform <- "Landsat-8"

# Login to coperinicus or USGS
set_archive("/path/to/archive/")
login_USGS(username='awiegman',password='sp8iald4t4')

# Use getSentinel_query to search for data (using the session AOI)
products <- getSentinel_query(time_range = time_range, platform = platform)
