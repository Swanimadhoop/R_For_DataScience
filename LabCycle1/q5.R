
num_terms <- as.integer(readline(prompt = "Enter the required number of terms: "))

sum_series <- 0

for(i in 1:num_terms) {
  term <- i / ((2 * i) - 1)
  
  if(i %% 2 == 1) {
    sum_series <- sum_series + term
  } else {
    sum_series <- sum_series - term
  }
}

cat("The sum of the series: ", sum_series, "\n")
