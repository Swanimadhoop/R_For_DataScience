reverse_list <- function(lst) {
  if (length(lst) <= 1) {
    return(lst)
  } else {
    return(c(reverse_list(lst[-1]), lst[1]))
  }
}

# Function to read user input and convert it to a list
read_input <- function() {
  cat("Enter the elements of the list separated by spaces: ")
  input <- readline()
  numbers <- as.numeric(strsplit(input, " ")[[1]])
  return(as.list(numbers))
}

# Read user input
original_list <- read_input()

# Reverse the list
reversed_list <- reverse_list(original_list)

# Print the reversed list
cat("Reversed list: ")
print(reversed_list)