# Load the mtcars dataset
data(mtcars)

# Convert gear to a factor
mtcars$gear <- as.factor(mtcars$gear)

# Create the box plot
boxplot(mtcars$hp ~ mtcars$gear,
        xlab = "Number of Gears",
        ylab = "Horsepower",
        main = "Box Plot of Horsepower by Number of Gears",
        col = "lightgray",    
        border = "black",      
        notch = TRUE)          

# Add points for each gear group
points(jitter(as.numeric(mtcars$gear)), mtcars$hp,
       pch = as.numeric(mtcars$gear) + 15, 
       col = as.numeric(mtcars$gear) + 1)  

# Add a legend
legend("topright", legend = levels(mtcars$gear), 
       pch = 15:17, col = 2:4, 
       title = "Number of Gears")

# Identify and label outliers
outliers <- boxplot(mtcars$hp ~ mtcars$gear, plot = FALSE)$out
for (i in seq_along(outliers)) {
  text(x = which(mtcars$hp == outliers[i]), y = outliers[i], 
       labels = rownames(mtcars)[mtcars$hp == outliers[i]], 
       pos = 4, col = "red", cex = 0.7)
}
