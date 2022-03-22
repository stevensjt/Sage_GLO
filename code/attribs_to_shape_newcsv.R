#kara updating code to work with new large csv that is the most updated

library(sf)
library(tidyverse)
library(readxl)
library(dplyr)

####1. Process an individual layer####
#Read spatial data 
##do I need to set the township if the csv has all?
#id <- "T31R11" #set the township you want to work on

lines <- read_sf(paste0("./GIS/section lines/",id,"_lines.shp"))
plot(lines$geometry)

#Read survey data

#all_town <- read_xlsx(paste0("./data/",id,"all_townships.xlsx"), sheet = "Sheet1") %>%
 # filter(Survey_type == "Sage") %>%
  
all_town <-read_csv("./data/all_townships.csv")

#all_townships <-select(Segment,Sage,Year) %>%


#plot
attribs <- all_town
plot(attribs["Sage_1880"])
plot(attribs["Sage_2019"])

