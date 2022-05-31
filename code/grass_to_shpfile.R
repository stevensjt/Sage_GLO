#kara modify code for grass

library(sf)
library(tidyverse)
library(readxl)
library(dplyr)

lines <- read_sf("./GIS/section lines/T30R10_lines.shp)
plot(lines$geometry)

grass <-read_csv(./data/grass_GLO.csv)