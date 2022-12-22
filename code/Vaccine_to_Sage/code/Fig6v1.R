#Final fig 6 10/24/22
#attempting to modify y axis label
#12/22/20 - attempting to add custom color (worked, but legend goes away!!!!)
#all good now....

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
#with(dat, levels(Group))
#dat <- transform(dat,
#                          Sage = factor(Sage, rev(levels(Sage))))

#notown <- select(all_townships, -Township)


#trying to add custom colors (instead of salmon/turqoise default)
##########################################################################################
#####Fig 6 - facetted Final (12/22/22)  ######################################################
################################

p<-ggplot(data = all_townships, 
       aes(alluvium = Segment, x = Year, stratum = Sage))+
  geom_flow(aes(fill = Sage))+ #this controls the flow between the stratum - fill controls color
  geom_stratum(aes(fill = Sage))+ #this controls the bars (stacked years) on outside - fill controls color
  #scale_fill_manual(values = c("grey", "green3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  #scale_fill_manual(values = c("grey", "seagreen3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  facet_wrap(~ Township , scales = "fixed") +
  scale_fill_manual(name = "Sagebrush",  #new legend title 
                    values = c("grey", "palegreen3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  #geom_text(stat = "stratum", size = 6,#adding text labels to "stratum" bar stacks
  #          aes(label = after_stat(stratum))) +
  theme_bw()+ #remove grey background
  ylab("Number of section lines")+
  scale_x_discrete(expand = c(.1, .1)) +
  #annotate(geom = "text", x = 1.5, y = 300, label = "Present to absent (n = 2)", size=6 , angle=64)+
  theme(legend.position = "bottom")+ 
  theme(text = element_text(size=20))

p
  
###Save the REAL final, final, final Fig6 - ha  

ggsave(plot = p, device = tiff, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig6/Fig6_sage_all_final_color.tiff")
#smaller jpeg version
ggsave(plot = p, device = jpeg, width = 10, height = 10, dpi = 301, 
       filename = "./code/Vaccine_to_Sage/figures/final/fig6/Fig6_sage_all_final_color.jpeg")



#######################################################################################################
#################################################################################
########### figure 5 - default salmon color scheme - not final
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


######################################
#######################messing around to see if we can subdivide stratum by townships
library(ggalluvial)

final_c1<-ggplot(data = all_townships, 
                aes(alluvium = Segment, x = Year, stratum = Township))+
  #geom_flow(aes(fill = Sage))+ #this controls the flow between the stratum
  geom_flow(aes(fill = Sage))+ #this controls the flow between the stratum - fill controls color
  #geom_stratum(aes(fill = Sage)) #this controls the bars (stacked years) on outside
  geom_stratum(aes(fill = Sage))+ #this controls the bars (stacked years) on outside - fill controls color
  #scale_fill_manual(values = c("grey", "green3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  scale_fill_manual(values = c("grey", "seagreen3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  #scale_fill_manual(values = c("grey", "palegreen3"))+ #this changes the color of the "stratum" and flow" between plots (and in the legend)
  geom_text(stat = "stratum", size = 6,#adding text labels to "stratum" bar stacks
            aes(label = after_stat(stratum))) +
  theme_bw()+ #remove grey background
  ylab("Number of section lines")+
  scale_x_discrete(expand = c(.1, .1)) +
  annotate(geom = "text", x = 1.5, y = 300, label = "Present to absent (n = 3)", size=6 , angle=64)+
  theme(legend.position = "bottom") +
  theme(text = element_text(size=24))

final_c1  











#ex with similar data

ggplot(majors, aes(alluvium = student, x = semester, stratum = curriculum)) + 
  geom_alluvium(color = "black") +
  geom_stratum( color = "black",aes(fill=curriculum))  + 
  # Vanilla GGplot here onwards
  ggtitle("Majors opted across semesters")+
  scale_y_discrete() +
  ylab("Number of students enrolled")+
  theme_bw()+
  theme(axis.text = element_text(size = 7))














