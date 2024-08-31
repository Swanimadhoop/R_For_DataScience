# Step 1: Load necessary libraries
library(ggplot2)
library(dplyr)

# Step 2: Load the dataset
covid_data <- read.csv("C:/Users/swani/OneDrive/Documents/lab cycle 2/time-series-19-covid-combined.csv")

# Step 3: Preprocess the data
# Convert the 'Date' column to Date type
covid_data$Date <- as.Date(covid_data$Date, format="%Y-%m-%d")

# Aggregate the data by date for global confirmed cases
global_data <- covid_data %>%
  group_by(Date) %>%
  summarise(Total_Confirmed = sum(Confirmed, na.rm = TRUE))

# Step 4: Create the time series plot

ggplot(global_data, aes(x = Date, y = Total_Confirmed)) +
  geom_line(color = "blue") +
  labs(title = "Global COVID-19 Confirmed Cases Over Time",
       x = "Date",
       y = "Total Confirmed Cases") +
  theme_minimal()
