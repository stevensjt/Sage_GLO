#Final fig 5 10/24/22
#attempting to modify y axis label

#library(sf)
#library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggalluvial)

#idk whatim doing but im trying
#survey=year
#response=sage

#all_townships <- read.csv("data/all_townships_final.csv")
all_townships <- read.csv("./code/Vaccine_to_Sage/data/all_townships_final.csv") #added pathname to get to data folder in Vaccine_to_Sage folder

all_townships$Sage <- factor(all_townships$Sage)
all_townships$Year <- factor(all_townships$Year)
all_townships$Township <- factor(all_townships$Township)
all_townships$Segment <- factor(all_townships$Segment)

#all_townships$Township <-factor("T31R09","T31R10","T31R11","T30R09","T30R10","T30R11","T29R09","T29R10","T29R11")

#all_townships$Township <- factor(all_townships$Township, levels=c("T31R09","T31R10","T31R11","T30R09","T30R10","T30R11","T29R09","T29R10","T29R11"))

#all_townships$Township <-factor("T31R09", "T31R10", "T31R11","T30R09", "T30R10", "T30R11","T29R09", "T29R10", "T29R11")
#all_townships$Township <-factor("T29R09", "T29R10", "T29R11", "T30R09", "T30R10", "T30R11", "T31R09", "T31R10", "T31R11")
#levels(all_townships$Sage)
#levels(all_townships$Township)
#levels(all_townships$Segment)
Sagebrush <- all_townships$Sage
all_townships$Township <- factor(all_townships$Township, levels=c("T31R09","T31R10","T31R11","T30R09","T30R10","T30R11","T29R09","T29R10","T29R11"))

#all_townships <- all_townships(x = runif(100), y = runif(100), 
                  #Group = gl(5, 20, labels = LETTERS[1:5]))
#head(dat)
#with(dat, levels(Group))
#dat <- transform(dat,
#                          Sage = factor(Sage, rev(levels(Sage))))

#notown <- select(all_townships, -Township)

final <-ggplot(all_townships,
       aes(x = Year, stratum = Sagebrush, alluvium = Segment,
           y = c(1),
           fill = Sagebrush, label = Sagebrush)) + 
  scale_x_discrete(expand = c(.1, .1)) +
  geom_flow() +
  geom_stratum(alpha = .5) + 
  #aes(fill=c("green","gray")) + this doesn't work
  #facet_wrap(~ Township , scales = "fixed") +
  labs(y="Number of section lines") +
  #scale_fill_brewer(palette = "YlGn", direction = 1) +
  #geom_text(stat = "stratum", size = 3)  + #for some reason it messes up graph when i add color?
  theme(legend.position = "bottom") +
  theme(text = element_text(size=28)) + 
  theme_bw()+  
  annotate(geom = "text", x = 1.5, y = 300, label = "Present to absent", size=7 , angle=64)
  #ggtitle("Sagebrush presence through time")                                  
  
#ggsave(plot = final, width = 10, height = 10, filename = "./code/Vaccine_to_Sage/figures/final/fig5/sage_all_final_no_text_label.png")

#ggsave(plot = final, device = tiff, width = 10, height = 10, dpi = 301, 
#       filename = "./code/Vaccine_to_Sage/figures/final/fig5/sage_all_final_no_text_label.tiff")

#ggsave(plot = final, device = tiff, width = 10, height = 10, dpi = 301, 
#       filename = "./code/Vaccine_to_Sage/figures/final/fig5/sage_all_final_w_label.tiff")

############################################################################
#final pub ready tiff version w/ label slanted, even!! Boooyaaa!
ggsave(plot = final, device = tiff, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/Fig5_sage_all_final_w_label1_color.tiff")
#smaller jpeg version
ggsave(plot = final, device = jpeg, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/Fig5_sage_all_final_w_label1.jpeg")

