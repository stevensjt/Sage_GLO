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

#3 Multiple classes
accuracy(iris[sample(1:150),]$Species, iris$Species)

