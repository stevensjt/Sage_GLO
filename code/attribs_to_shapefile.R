##Combine the sage data from datasheets into the section lines shapefiles
##Jens Stevens, stevensjt@gmail.com, 1/26/21
library(sf)
library(tidyverse)
library(readxl)

#Read spatial data
lines <- read_sf("./GIS/section lines/T29R11_lines.shp")
#lines_sf <- st_cast(lines)
plot(lines$geometry)

#Read survey data
d_1940 <- read_xlsx("./data/T29R11_data.xlsx", sheet = "1940Survey")
d_simple_1940 <- d_1940[d_1940$Survey_type=="transect_summary",c("Segment_id","Sage")]
names(d_simple_1940)[2] = "Sage_1940"
d_1880 <- read_xlsx("./data/T29R11_data.xlsx", sheet = "1880Survey")
d_simple_1880 <- d_1880[d_1880$Survey_type=="transect_summary",c("Segment_id","Sage")]
names(d_simple_1880)[2] = "Sage_1880"
d_simple <- merge.data.frame(d_simple_1940,d_simple_1880, all = TRUE)
#d_simple <- cbind(d_simple_1940,d_simple_1880)

#tmp <- left_join(lines,d[d$Survey_type=="transect_summary",c("Segment_id","Sage")])
attribs <- left_join(lines,as.data.frame(d_simple))
plot(attribs["Sage"])

write_sf(attribs,"./GIS/section lines/T29R11_lines_attrib.shp")
