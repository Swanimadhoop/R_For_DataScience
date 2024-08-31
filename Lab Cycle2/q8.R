#part a

# Load necessary libraries
library(ggplot2)

# Load the Titanic dataset
titanic <- read.csv("C:/Users/swani/OneDrive/Documents/lab cycle 2/titanic.csv")  # Replace with the actual path

# Plot the histogram of the 'parch' variable
ggplot(titanic, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Number of Parents and Children Aboard",
       x = "Number of Parents and Children Aboard (Parch)",
       y = "Frequency") +
  theme_minimal()

#part b

summary(titanic)

sapply(titanic, function(x) sum(is.na(x)))


ggplot(titanic, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(title = "Survival Rate by Gender", x = "Gender", y = "Proportion", fill = "Survived") +
  theme_minimal()

ggplot(titanic, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(title = "Survival Rate by Class", x = "Passenger Class", y = "Proportion", fill = "Survived") +
  theme_minimal()

#statistical test
chisq.test(table(titanic$Sex, titanic$Survived))
chisq.test(table(titanic$Pclass, titanic$Survived))

#logistic regression

logistic_model <- glm(Survived ~ Pclass + Sex + Age + Parch, data = titanic, family = "binomial")
summary(logistic_model)


#part c
ggplot(titanic, aes(x = factor(Survived), y = Age, fill = factor(Survived))) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 2) +
  labs(title = "Age Distribution of Survivors and Non-Survivors",
       x = "Survived",
       y = "Age",
       fill = "Survived") +
  theme_minimal()