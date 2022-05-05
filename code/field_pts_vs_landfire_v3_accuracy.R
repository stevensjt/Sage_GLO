#map accuracy - for the GLO sagebrush mapping - field station field survey points vs landfire v3
#5/4/22
#E.Q. Margolis (hacked from map_accuracy_ex.R - used for the landfire vs AIM points)

#Ex 2 below is the easiest - it takes a 2X2 matrix

#install.packages("rfUtilities")

library (rfUtilities)

# Examples

#2 Two classes (contingency table)
accuracy(cbind(c(15,11), c(2,123))) #this is the easiest data format to provide - cbind(c(number true positive, number false positive), (number false negative, number true negative))



#landfire3 vs field station field points

accuracy(cbind(c(169,25), c(18,127)))
