# plotCrossSection
library(raster)

# xy coordinates of transect
coords <- rbind(c(-100, -90), c(80, 90), c(80, 0), c(40, -40))
# define projection 
crs <- sp::CRS("+init=epsg:4326")
# projected transect
transect <- sp::SpatialPoints(coords, proj4string = crs)

# create empty 1 band raster and specify x y location
r <- raster(nrows = 10, ncols = 10, ymn = -80, ymx = 80, crs = crs)
# name the raster band 1
names(r)[1] <- "band 1 value"
set.seed(0)
r[] <- runif(ncell(r))
r[4, 6] <- NA
plot(r, xlab = "x", ylab = "y")
lines(SpatialLines(list(sp::Lines(list(sp::Line(coords)), ID = "Transect")), proj4string = crs))
points(transect, pch = 21, bg = "red")
segs <- ExtractAlongTransect(transect, r)
for (i in 1:length(segs)) points(segs[[i]], col = "blue")

dev.new()
xlab <- "Distance along transect"
ylab <- "Raster value"
xlim <- range(vapply(segs, function(seg) range(seg@data[, "dist"]), c(0, 0)))
ylim <- range(vapply(segs, function(seg) range(seg@data[, "value"], na.rm = TRUE),
                     c(0, 0)))
plot(NA, type = "n", xlab = xlab, ylab = ylab, xlim = xlim, ylim = ylim)
for (i in 1:length(segs))
  lines(segs[[i]]@data[, c("dist", "value")], col = rainbow(length(segs))[i])
coords <- sp::coordinates(transect)
n <- length(transect)
d <- cumsum(c(0, as.matrix(dist((coords)))[cbind(1:(n - 1), 2:n)]))
abline(v = d, col = "grey", lty = 2)
mtext(paste0("(", paste(head(coords, 1), collapse = ", "), ")"), adj = 0)
mtext(paste0("(", paste(tail(coords, 1), collapse = ", "), ")"), adj = 1)