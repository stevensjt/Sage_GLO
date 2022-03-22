#attempting to modify y axis lable

library(sf)
library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggalluvial)


#idk whatim doing but im trying
#survey=year
#response=sage

all_townships <- read.csv("data/all_townships_final.csv")

all_townships$Sage <- factor(all_townships$Sage)
all_townships$Year <- factor(all_townships$Year)
all_townships$Township <- factor(all_townships$Township)
all_townships$Segment <- factor(all_townships$Segment)

all_townships$Township <-factor("T31R09","T31R10","T31R11","T30R09","T30R10","T30R11","T29R09","T29R10","T29R11")

all_townships$Township <- factor(all_townships$Township, levels=c("T31R09","T31R10","T31R11","T30R09","T30R10","T30R11","T29R09","T29R10","T29R11"))

#all_townships$Township <-factor("T31R09", "T31R10", "T31R11","T30R09", "T30R10", "T30R11","T29R09", "T29R10", "T29R11")
#all_townships$Township <-factor("T29R09", "T29R10", "T29R11", "T30R09", "T30R10", "T30R11", "T31R09", "T31R10", "T31R11")
levels(all_townships$Sage)
levels(all_townships$Township)
levels(all_townships$Segment)

all_townships <- all_townships(x = runif(100), y = runif(100), 
                  Group = gl(5, 20, labels = LETTERS[1:5]))
head(dat)
with(dat, levels(Group))
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
  facet_wrap(~ Township , scales = "fixed") +
  labs(y="Number of section lines") +
  #geom_text(stat = "stratum", size = 3) +
  theme(legend.position = "bottom") +
  theme(text = element_text(size=24))
  #ggtitle("Sagebrush presence through time")                                  
  


ggsave(plot = final, width = 20, height = 20, filename = "sage_all_final.png")

ggsave("sage_overall_all_twnsps_final.png")
