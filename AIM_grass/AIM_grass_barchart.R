#kara making bar chart for grass comparison
#kara becomes r master
#5/18/2022
#5/26/updating for final grass figs

library(sf)
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)

#tryinggplot2
#this worked for not stacked

library(dplyr)
library(tidyr)
library(ggplot2)

dat <- data.frame(
  High = c(37.7, 30.7),
  Moderate = c(39.5, 24.6),
  Low = c(20.2, 44.7),
  Year = as.factor(c("1881", "2020"))
)
  dat_long <- dat %>%
    gather("Stat", "Value", -Year)
  dat_long
dat

ggplot(dat_long, aes(x = Year, y = Value, fill = Stat)) +
  geom_col(position = "dodge") +
  labs(x="Year", y= "Grass Index")


#stacked bar graph  

bar <- read.csv("barchart.csv") 

ggplot(bar, aes(x = bar$Year, y = bar$Percent))+
  geom_col(aes(fill = factor(bar$Grass_Index, levels=c("High","Moderate","Low"))), width = 100)+
  labs(x="1881                                                  2020", y= "Percent", fill= "Grass Index") +
  scale_colour_manual(values =c("green", "yellow", "grey")) +
  scale_x_discrete(labels=c("1881" = "1881", "1" = "1881",
                            "2020" = "2020")) 
  

ggplot(bar, aes(x = Year, fill = grass_index)) + 
    geom_bar()

#stacked trying with colors 

ggplot(bar, aes(x = 'Year', y = 'Percent'))+
  geom_col(aes(fill = factor('Grass_Index', levels=c("High","Moderate","Low"))), width = 100)+
  labs(x="1881                                                  2020", y= "Percent", fill= "Grass Index") +
  scale_colour_manual(values =c("green", "yellow", "grey")) +
  scale_x_discrete(labels=c("1881" = "1881", "1" = "1881",
                            "2020" = "2020"))



  



  






