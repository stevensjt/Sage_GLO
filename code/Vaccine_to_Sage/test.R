#using old csv
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
T29R11 <- read.csv("test_3.csv")

T29R11$Sage <- factor(T29R11$Sage)
T29R11$Year <- factor(T29R11$Year)
T29R11$Township <- factor(T29R11$Township)
#dat <- transform(dat,
#                          Sage = factor(Sage, rev(levels(Sage))))

#notown <- select(T29R11, -Township)


ggplot(T29R11,
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

notown <- select(T29R11, -?..Township)  
ggplot(notown,
       aes(x = Year, stratum = Sage, alluvium = Segment_id,
           y = Freq,
           fill = Sage, label = Sage)) +
  scale_x_discrete(expand = c(.1, .1)) +
  geom_flow() +
  geom_stratum(alpha = .5) +
  geom_text(stat = "stratum", size = 3) +
  theme(legend.position = "none")

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
