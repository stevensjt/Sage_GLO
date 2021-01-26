##Combine the sage data from datasheets into the section lines shapefiles
##Jens Stevens, stevensjt@gmail.com, 1/26/21
library(sf)
library(tidyverse)
library(readxl)

lines <- read_sf("./GIS/section lines/T29R11_lines.shp")
lines_sf <- st_cast(lines)
plot(lines$geometry)
d<- read_xlsx("./data/T29R11_data.xlsx", sheet = "1940Survey")
d_simple <- d[d$Survey_type=="transect_summary",c("Segment_id","Sage")]
#tmp <- left_join(lines,d[d$Survey_type=="transect_summary",c("Segment_id","Sage")])
attribs <- left_join(lines,as.data.frame(d_simple))
plot(attribs["Sage"])

write_sf(attribs,"./GIS/section lines/T29R11_lines_attrib.shp")
