
library(ggplot2)

setwd("D:/ellis/research/Taos/BLM_RGDN_monument/GLO/data/sage_dendro")

dat<-read.csv("sage_age.csv")

p<-ggplot(dat, aes(x=inner_year)) + 
  geom_histogram(binwidth=1)+
  facet_grid(section ~ .)

ggsave("fake_sage_age_hist.png", p, device = png)
