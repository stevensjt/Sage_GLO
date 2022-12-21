#Final fig 5 10/24/22
#attempting to modify y axis label
#attempting to add custom color (worked, but legend goes away!!!!)

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

#################################################################################
###########final figure 5 - default salmon color scheme
final <-ggplot(all_townships,
       aes(x = Year, stratum = Sagebrush, alluvium = Segment,
           y = c(1), 
           #label = Sagebrush)) + 
          fill = Sagebrush, label = Sagebrush)) + 
  scale_x_discrete(expand = c(.1, .1)) +
  geom_flow()+
  geom_stratum(alpha = 0.5)+
  #geom_flow(fill = c("grey","grey", "green3","green3", "green3","green3", "green3","green3")) +
  #geom_stratum(alpha = .5, fill = c("green3","grey", "green3","grey"))+
  #aes(fill=c("green","gray")) + this doesn't work
  #facet_wrap(~ Township , scales = "fixed") +
  labs(y="Number of section lines") +
  #scale_fill_brewer(palette = "YlGn", direction = 1) +
  #geom_text(stat = "stratum", size = 3)  + #for some reason it messes up graph when i add color?
  theme(legend.position = "bottom") +
  theme(text = element_text(size=28)) + 
  #theme_bw()+  #changes legend position and text label size - may need to change that in parentheses of theme_bw()  
  annotate(geom = "text", x = 1.5, y = 300, label = "Present to absent", size=7 , angle=64)
#scale_color_identity(guide = "legend")
  
#scale_colour_manual(name = "Legend", 
  #                    values = c("Absent" = "grey", 
  #                               "Present" = "green3"))  #because I changed the color, then need to make manual legend
  #ggtitle("Sagebrush presence through time")                                  
  
#####################################
#save final pub ready tiff version w/ label slanted, even!! Boooyaaa!
ggsave(plot = final, device = tiff, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/sage_all_final_w_label.tiff")

ggsave(plot = final, device = jpeg, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/sage_all_final_w_label.jpeg")


#last attempt - trying to add custom colors (instead of salmon/turqoise default)
##########################################################################################
####trying to add custom color, but then legend goes away - ugh.......
###########final figure 5 - default salmon color scheme
final_c <-ggplot(all_townships,
               aes(x = Year, stratum = Sagebrush, alluvium = Segment,
                   y = c(1), 
                   #label = Sagebrush)) + 
                   fill = Sagebrush, label = Sagebrush)) + 
  scale_x_discrete(expand = c(.1, .1)) +
  #geom_flow()+
  #geom_stratum(alpha = 0.5)+
  geom_flow(fill = c("grey","grey", "green3","green3", "green3","green3", "green3","green3")) +
  geom_stratum(alpha = .5, fill = c("green3","grey", "green3","grey"))+
  #aes(fill=c("green","gray")) + this doesn't work
  #facet_wrap(~ Township , scales = "fixed") +
  labs(y="Number of section lines") +
  #scale_fill_brewer(palette = "YlGn", direction = 1) +
  #geom_text(stat = "stratum", size = 3)  + #for some reason it messes up graph when i add color?
  theme(legend.position = "bottom") +
  theme(text = element_text(size=28)) + 
  #theme_bw()+  #adding this messes up the text size (may need to change that in theme_bw(size =....?))
  annotate(geom = "text", x = 1.5, y = 300, label = "Present to absent", size=7 , angle=64)
#scale_color_identity(guide = "legend")

#scale_colour_manual(name = "Legend", 
#                    values = c("Absent" = "grey", 
#                               "Present" = "green3"))  #because I changed the color, then need to make manual legend

ggsave(plot = final_c, device = tiff, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/Fig5_sage_all_final_w_label1_color.tiff")
#smaller jpeg version
ggsave(plot = final_c, device = jpeg, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig5/Fig5_sage_all_final_w_label1_color.jpeg")

