library(terra)
library(RColorBrewer)

GREEN <- rast("D:/SPATIAL DATA/RASTER/SEN_B3.tif")
NIR <- rast("D:/SPATIAL DATA/RASTER/SEN_B8.tif")

NDWI <- (GREEN - NIR) / (GREEN + NIR)
NDWI

threshold <- 0.001
Badan_Air <- NDWI > threshold
Badan_Air


par(mfrow = c(2, 2))

plot(GREEN, col = gray.colors(100, start = 0, end = 1), main = "1.Sentinel (Green)")

plot(NIR, col = gray.colors(100, start = 0, end = 1), main = "2.Sentinel (NIR)")

pal_spectral_terbalik <- colorRampPalette(rev(brewer.pal(11, "Spectral")))
plot(NDWI, col = pal_spectral_terbalik(100), main = "3.Normalized Difference Water Index")

plot(Badan_Air, col = c("white", "blue"), main = "4. NDWI Treshold (Water)", legend = FALSE)

par(mfrow = c(1, 1))