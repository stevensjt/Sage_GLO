#using AIM data to get modern grass cover in RGdN
#kf 5/10/22
#updating for quantiles

library(sf)
library(tidyverse)
library(readxl)
library(dplyr)


#cover
zscore <- read_csv("grass_AIM_GLO_4.csv")
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
png("total_both_may.png")

##histos of raw data
raw_hgt <- read_csv("grass_AIM_GLO_4.csv")
hist(raw_hgt$Average_Grass_Height_cm)
png("raw_hgt")

hist(raw_hgt$Grass_Cover_PCT_Any_Hit_Minus_Noixious)
png("raw_cover")

#quantiles for total
total <- read_csv("grass_AIM_GLO_5.csv")
min(total$Total)
max(total$Total)
#quantile(total$Total)
quantile(total$Total, probs = seq(0, 1, 1/3))
