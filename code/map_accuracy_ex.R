#map accuracy - for the GLO sagebrush mapping
#1/21/22
#E.Q. Margolis

#Ex 2 below is the easiest - it takes a 2X2 matrix


install.packages("rfUtilities")

library (rfUtilities)

# Examples

#1 Two classes (vectors - x=mapped, y = observed)
observed <- sample(c(rep("Pres",50),rep("Abs",50)), 100, replace=TRUE )
accuracy(observed[sample(1:length(observed))], observed)


#2 Two classes (contingency table)
accuracy(cbind(c(15,11), c(2,123))) #this is the easiest data format to provide - cbind(c(number true positive, number false positive), (number false negative, number true negative))

#landfire1
accuracy(cbind(c(61,68), c(5,48)))
#landfire2
accuracy(cbind(c(61,68), c(7,46)))
#RCMAP1
accuracy(cbind(c(95,34), c(13,40)))
#RCMAP2
accuracy(cbind(c(75,54), c(7,46)))
#RCMAP3
accuracy(cbind(c(84,45), c(11,42)))
#RCMAP4
accuracy(cbind(c(93,36), c(13,40)))
#Landfire3
accuracy(cbind(c(102,27), c(10,43)))
#RCMAP_PercentCover_v1
accuracy(cbind(c(95,34), c(13,40)))
#3 Multiple classes
accuracy(iris[sample(1:150),]$Species, iris$Species)

