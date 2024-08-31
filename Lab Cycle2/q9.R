data(iris)
# Perform ANOVA
anova_result <- aov(Sepal.Length ~ Species, data = iris)

# Summary of the ANOVA
summary(anova_result)

#part b
install.packages("GGally")  # Install GGally if you haven't already
library(GGally)
# Create pair plot
ggpairs(iris, aes(color = Species))
