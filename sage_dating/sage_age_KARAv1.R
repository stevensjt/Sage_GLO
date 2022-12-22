library(ggplot2)
library(here) # a cool package that helps with relative pathnames, so you don't have to use setwd

#using "here" instead of setwd
setwd("S:/Ecology/Student_folders_&_files/Kara 2020/GLO/sage_dating")

dat<-read.csv(here("sage_dating", "sage_age.csv")) 

p<-ggplot(dat, aes(x=inner_year)) + 
  geom_histogram(binwidth=1)+
  facet_grid(section ~ .)+
  labs(x = " Inner year", y = "Count")

ggsave("sage_age_histV2.png", p, device = png)
