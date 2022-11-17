#using AIM data to get modern grass cover in RGdN
#kf 4/13/22

library(sf)
library(tidyverse)
library(readxl)
library(dplyr)


#cover
zscore <- read_csv("grass_AIM_GLO_3.csv")
view(zscore)

min(cover)

hist(zscore$Z_cover)
cover
cover$Z_cover

#z_hgt
zscore <- read_csv("grass_AIM_GLO_3.csv")
view(zscore)
hist(zscore$Z_hgt)
#together
png("zscore_hgt_cvr.png")
par(
  mfrow=c(2,1)
) 
hist(zscore$Z_cover)
hist(zscore$Z_hgt)
dev.off()

#addedzscore
total <- read_csv("grass_AIM_GLO_4.csv")
min(total$Total)
max(total$Total)

hist(total$Total)
png("total_both.png")
