is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  if (n %% 2 == 0) return(FALSE)
  
  for (i in 3:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

find_primes_in_range <- function(start, end) {
  primes <- c()
  for (num in start:end) {
    if (is_prime(num)) {
      primes <- c(primes, num)
    }
  }
  return(primes)
}

# Check a single number
while (TRUE) {
  num <- as.integer(readline(prompt = "Enter a number to check if it's prime (or 0 to skip): "))
  if (is.na(num)) {
    cat("Please enter a valid integer.\n")
  } else if (num == 0) {
    break
  } else {
    if (is_prime(num)) {
      cat(num, "is prime.\n")
    } else {
      cat(num, "is not prime.\n")
    }
  }
}

# Find primes in a range
while (TRUE) {
  start <- as.integer(readline(prompt = "Enter the start of the range: "))
  end <- as.integer(readline(prompt = "Enter the end of the range: "))
  
  if (is.na(start) || is.na(end) || start > end) {
    cat("Please enter valid integers for the range (start <= end).\n")
  } else {
    primes_in_range <- find_primes_in_range(start, end)
    cat("Prime numbers in the range", start, "to", end, "are:\n")
    cat(primes_in_range, sep = ", ")
    cat("\n")
    break
  }
}