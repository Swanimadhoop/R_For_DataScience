# Install and load necessary libraries
install.packages("forecast")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tseries")

library(forecast)
library(ggplot2)
library(dplyr)
library(tseries)

# Load the COVID-19 dataset
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid_data <- read.csv(url)

# Filter the data for India from 22 January 2020 to 15 December 2020
india_data <- covid_data %>%
  filter(Country.Region == "India") %>%
  select(Date, Confirmed, Deaths)

# Convert the Date column to Date type
india_data$Date <- as.Date(india_data$Date)

# Filter the data for the specified date range
start_date <- as.Date("2020-01-22")
end_date <- as.Date("2020-12-15")
india_data <- india_data %>%
  filter(Date >= start_date & Date <= end_date)

# Display the first few rows of the data
head(india_data)



# Create a time series object for Confirmed cases (total positive COVID-19 cases)
confirmed_ts <- ts(india_data$Confirmed, start = c(2020, 1), frequency = 7)

# Visualize the time series data using a line chart
ggplot(india_data, aes(x = Date, y = Confirmed)) +
  geom_line(color = "blue") +
  labs(title = "Total Positive COVID-19 Cases in India (22 Jan 2020 - 15 Dec 2020)",
       x = "Date", y = "Total Confirmed Cases") +
  theme_minimal()


# Create a multivariate time series object for Confirmed cases and Deaths
covid_ts <- ts(cbind(india_data$Confirmed, india_data$Deaths), start = c(2020, 1), frequency = 7)

# Plot both series on a single chart
ggplot() +
  geom_line(data = india_data, aes(x = Date, y = Confirmed, color = "Confirmed"), size = 1) +
  geom_line(data = india_data, aes(x = Date, y = Deaths, color = "Deaths"), size = 1) +
  labs(title = "Confirmed COVID-19 Cases and Deaths in India (22 Jan 2020 - 15 Dec 2020)",
       x = "Date", y = "Count") +
  scale_color_manual(values = c("Confirmed" = "blue", "Deaths" = "red")) +
  theme_minimal() +
  theme(legend.title = element_blank())

# Fit an ARIMA model to the total confirmed cases
fit <- auto.arima(confirmed_ts)

# Display the ARIMA model summary
summary(fit)

# Forecast the next 5 days
forecasted_values <- forecast(fit, h = 5)

# Display the forecasted values
forecasted_values


# Plot the forecasted values along with the original series
autoplot(forecasted_values) +
  ggtitle("Forecast of Total Positive COVID-19 Cases in India (Next 5 Days)") +
  xlab("Date") +
  ylab("Total Confirmed Cases") +
  theme_minimal()


