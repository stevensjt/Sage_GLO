##Combine the sage data from datasheets into the section lines shapefiles
##Jens Stevens, stevensjt@gmail.com, 1/26/21
library(sf)
library(tidyverse)
library(readxl)

#Read spatial data
id <- "T31R11" #set the township you want to work on
lines <- read_sf(paste0("./GIS/section lines/",id,"_lines.shp"))
plot(lines$geometry)

#Read survey data
d_1940 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1940Survey")
d_simple_1940 <- d_1940[d_1940$Survey_type=="transect_summary",c("Segment_id","Sage")]
names(d_simple_1940)[2] = "Sage_1940"
d_1880 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1880Survey")
d_simple_1880 <- d_1880[d_1880$Survey_type=="transect_summary",c("Segment_id","Sage")]
names(d_simple_1880)[2] = "Sage_1880"
d_simple <- merge.data.frame(d_simple_1940,d_simple_1880, all = TRUE)

attribs <- left_join(lines,as.data.frame(d_simple))
plot(attribs["Sage_1940"])
plot(attribs["Sage_1880"])

write_sf(attribs,paste0("./GIS/section lines/",id,"_lines_attrib.shp"))
