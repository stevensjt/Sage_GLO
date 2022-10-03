
library(ggplot2)

setwd("S:/Ecology/Student_folders_&_files/Kara 2020/GLO/sage_dating")

dat<-read.csv("sage_age.csv")

p<-ggplot(dat, aes(x=inner_year)) + 
  geom_histogram(binwidth=1)+
  facet_grid(section ~ .)

ggsave("sage_age_hist_may.png", p, device = png)
