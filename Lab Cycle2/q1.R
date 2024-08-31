data(iris)

plot(iris$Sepal.Length, iris$Petal.Length,
     xlab = "Sepal Length (cm)",   
     ylab = "Petal Length (cm)",   
     main = "Scatterplot of Sepal Length vs Petal Length", 
     pch = 19,   
     col = "blue")  


png(filename = "scatterplot.png", width = 1200, height = 1200, res = 300)
plot(iris$Sepal.Length, iris$Petal.Length,
     xlab = "Sepal Length (cm)",   
     ylab = "Petal Length (cm)",   
     main = "Scatterplot of Sepal Length vs Petal Length", 
     pch = 19,   
     col = "blue")
dev.off() 

getwd()

setwd("C:\\Users\\swani\\OneDrive\\Documents\\lab cycle 2")
