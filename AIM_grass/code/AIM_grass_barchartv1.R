#kara making bar chart for grass comparison
#kara becomes r master - ha!
#5/18/2022
#5/26/updating for final grass figs
#12/20/22 - final tweaks to for Fig 8

###BUT 1881 data don't add to 100% and percentages are a little off from values in text on pg 15 (e.g., 44.7% in
#data table below for low in 2020, but says 46% in text and fig caption).


library(sf)
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)
library(dplyr)

#make data frame - prct of plots in different grass index categories
dat <- data.frame(
  High = c(37.7, 30.7),
  Moderate = c(39.5, 24.6),
  Low = c(20.2, 44.7),
  Year = as.factor(c("1881", "2020"))
)

dat #look at data

# convert to long format for ggplot
  dat_long <- dat %>%
    gather("Grass_index", "Value", -Year)

dat_long #look at data

#make "Grass_index" an ordered factor so the legend is ordered, low, med, high
dat_long$Grass_index<- ordered(dat_long$Grass_index, levels = c("Low", "Moderate", "High"))

#make stacked bar graph w custom color
final<-ggplot(dat_long, aes(x = Year, y = Value, fill = Grass_index)) +
  geom_col(position = "stack") + 
  labs(x="Year", y= "Section lines (percent)", fill = "Grass index") + #fill changes legend title
  theme_bw() +
  scale_fill_brewer(palette = "YlGn")

#save figs
ggsave(plot = final, device = tiff, width = 6, height = 7, dpi = 301, 
       filename = "./figs/Fig8_final.tiff")

ggsave(plot = final, device = jpeg, width = 6, height = 7, dpi = 301, 
       filename = "./figs/Fig8_final.jpeg")

  




