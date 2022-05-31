##################SAMPLING OR EXTRACTING VALUES FROM raster WITH POINTS!!!##############
#####################################################################################

library(rgdal)
library(raster)
library(sp)

setwd("D:/ellis/research/Taos/BLM_RGDN_monument/GLO/Sage_GLO/")

#1  Read raster
veg<- raster("./GIS/landfire_v3.tif")

print(proj4string(veg)) #print projection
#the last portion of each proj4 string is +towgs84=0,0,0 . This is a conversion factor that is used if a datum conversion is required.

#####
#points

####read in shapefile of field points
points<-readOGR(dsn = "D:/ellis/research/Taos/BLM_RGDN_monument/GLO/data/Points_along_lines_update2_10_22", layer = "Points_along_lines_update")

#print projection
print(proj4string(points)) # they are the same!!

#extract landfire sage from raster at field points
landfire_extract<-extract(veg, points)
#replace na's w/ 0's
landfire_extract[is.na(landfire_extract)]<-0
#replacing 1 with present and 0 with absent
landfire_extract[landfire_extract==1]<-"present"
landfire_extract[landfire_extract==0]<-"absent"

#view points shapefile attributes
points@data

#add landfire veg to attribute table
points@data$landfire_sage<-landfire_extract

#make field points attribute table a dataframe 
field_points<-data.frame()
field_points<-points@data
names(field_points)[1]<-"field_sage" #rename 1st column
field_vs_landfire_sage<-field_points[,c(16,17,1,20)] #extracting and re-ordering columns we want

write.csv(field_vs_landfire_sage, file = "field_vs_landfire_sage.csv")

pie(table(field_vs_landfire_sage[,3]))
pie(table(field_vs_landfire_sage[,4]))

png("./figures/field_vs_landfire_sage.png")

par(mfrow=c(1,2))

pie(table(field_vs_landfire_sage[,3]), main = "field")
pie(table(field_vs_landfire_sage[,4]), main = "landfire")

dev.off()


