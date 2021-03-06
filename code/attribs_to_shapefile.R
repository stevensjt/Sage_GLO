##Combine the sage data from datasheets into the section lines shapefiles
##Jens Stevens, stevensjt@gmail.com, 1/26/21
library(sf)
library(tidyverse)
library(readxl)

####1. Process an individual layer####
#Read spatial data
id <- "T31R11" #set the township you want to work on
lines <- read_sf(paste0("./GIS/section lines/",id,"_lines.shp"))
plot(lines$geometry)

#Read survey data
d_1940 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1940Survey") %>%
  filter(Survey_type == "transect_summary") %>%
  select(Segment_id,Sage) %>%
  rename(Sage_1940 = Sage)
d_1880 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1880Survey") %>%
  filter(Survey_type == "transect_summary") %>%
  select(Segment_id,Sage) %>%
  rename(Sage_1880 = Sage)
d_simple <- full_join(d_1940,d_1880)

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

####2. Process all available layers####
#ids <- c("T29R11","T30R11","T31R11") #First batch of three townships
#ids <- c("T29R09","T29R10","T30R09","T30R10","T31R09","T31R10") #Second batch of six townships
ids <- c("T29R09","T29R10","T29R11","T30R09","T30R10","T30R11","T31R09","T31R10","T31R11")
l <- list()
for(id in ids){
  d_1940 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1940Survey") %>%
    filter(Survey_type == "transect_summary") %>%
    select(Segment_id,Sage) %>%
    rename(Sage_1940 = Sage)
  d_1880 <- read_xlsx(paste0("./data/",id,"_data.xlsx"), sheet = "1880Survey") %>%
    filter(Survey_type == "transect_summary") %>%
    select(Segment_id,Sage) %>%
    rename(Sage_1880 = Sage)
  lines <- read_sf(paste0("./GIS/section lines/",id,"_lines.shp")) %>%
    select(lndkey,sectn,Segment_id,geometry)
  
  
  l[[id]] <- full_join(d_1940,d_1880)
  if(id == ids[1]){
    d_full <- l[[id]]
    lines_full <- lines
  } else {
    d_full <- full_join(d_full,l[[id]])
    lines_full <- rbind(lines_full,lines)
  }
    
}

attribs <- left_join(lines_full,d_full)
plot(attribs["Sage_1940"])
plot(attribs["Sage_1880"])

attribs$Sage_1940_simple <- ifelse(attribs$Sage_1940%in%c("present","understory","dense"),
                                   "present",attribs$Sage_1940)
attribs$Sage_1880_simple <- ifelse(attribs$Sage_1880%in%c("present","understory","dense"),
                                   "present",attribs$Sage_1880)
plot(attribs["Sage_1940_simple"])
plot(attribs["Sage_1880_simple"])


write_sf(attribs,paste0("./GIS/section lines/all_lines_attrib_v2.kml"))
