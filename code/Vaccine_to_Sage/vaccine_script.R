#Kara attempt to make cool figure for sagebrush
#2/23/2022 KF
#2/28/2022 update for actual csv
#3/1/2022 solving issues from csv

library(sf)
library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggalluvial)


#idk whatim doing but im trying
  #survey=year
  #response=sage
#why is this not working i am sad, i can import but not read .csv?????
all_townships <- read.csv("all_townships_v1.csv")

all_townships$Sage <- factor(all_townships$Sage)
all_townships$Year <- factor(all_townships$Year)
all_townships$Township <- factor(all_townships$Township)
all_townships$Segment <- factor(all_townships$Segment)

levels(all_townships$Sage)
levels(all_townships$Township)
levels(all_townships$Segment)
#dat <- transform(dat,
#                          Sage = factor(Sage, rev(levels(Sage))))

#notown <- select(all_townships, -Township)


ggplot(all_townships,
       aes(x = Year, stratum = Sage, alluvium = Segment,
           y = Freq,
           fill = Sage, label = Sage)) +
scale_x_discrete(expand = c(.1, .1)) +
geom_flow() +
geom_stratum(alpha = .5) +
geom_text(stat = "stratum", size = 3) +
theme(legend.position = "none") +
#facet_wrap(~ Township , scales = "fixed") +
ggtitle("Sagebrush presence through time")  +
labs(y="Number of section lines")

ggsave("sage_overall.png")

#using notown instead 

ggplot(notown,
       aes(x = Year, stratum = Sage, alluvium = Segment,
           y = Freq,
           fill = Sage, label = Sage)) +
  scale_x_discrete(expand = c(.1, .1)) +
  geom_flow() +
  geom_stratum(alpha = .5) +
  geom_text(stat = "stratum", size = 3) +
  theme(legend.position = "none") +
  facet_wrap(~ Township , scales = "fixed") +
  ggtitle("Sagebrush presence through time")  
  
  ###original code 
#survey=year
#response=sage
data(vaccinations)
##maybe done need vaccinations <- transform(vaccinations,
                          #response = factor(response, rev(levels(response))))
ggplot(vaccinations,
       aes(x = survey, stratum = response, alluvium = subject,
           y = freq,
           fill = response, label = response)) +
  scale_x_discrete(expand = c(.1, .1)) +
  geom_flow() +
  geom_stratum(alpha = .5) +
  geom_text(stat = "stratum", size = 3) +
  theme(legend.position = "none") +
  ggtitle("vaccination survey responses at three points in time")




#find triple values
happy <- data.frame (summary(all_townships$Segment))
happy 
