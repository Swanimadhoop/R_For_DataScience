library(ggplot2)

ggplot(mtcars, aes(x = wt, y = disp, color = as.factor(carb), size = as.factor(carb)))+
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE)+
  labs(
    title = "Scatter Plot of Displacement vs. Weight",
    x = "Weight(wt)",
    y = "Displacement(disp)",
    color = "Number of Carburetors",
    size = "Number of Carburetors"
  )+
  theme_minimal()
