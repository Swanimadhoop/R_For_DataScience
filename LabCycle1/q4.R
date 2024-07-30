generate_password <- function(length){
  lowercase <- letters
  uppercase <- LETTERS
  DIGITS <- as.character(0:9)
  special_chars <- c("!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "=", "[", "]", "{", "}", "|", ";", ":", ",", ".", "<", ">", "?", "/")
  
  all_chars <- c(lowercase,uppercase,digits,special_chars)
  
  password <- c(
    sample(lowercase,1),
    sample(uppercase, 1),
    sample(digits, 1),
    sample(special_chars, 1)
  )
  
  password <- c(password, sample(all_chars, length - 4, replace = TRUE))
  
  # Shuffle the password characters
  password <- sample(password)
  
  # Convert the vector of characters to a string
  return(paste(password, collapse = ""))
}

# Get password length from user
while (TRUE) {
  length <- as.integer(readline(prompt = "Enter the desired password length (minimum 8 characters): "))
  if (is.na(length)) {
    cat("Please enter a valid number.\n")
  } else if (length < 8) {
    cat("Password length must be at least 8 characters.\n")
  } else {
    break
  }
}

# Generate and display the password
password <- generate_password(length)
cat("Your generated password is:", password, "\n")
}