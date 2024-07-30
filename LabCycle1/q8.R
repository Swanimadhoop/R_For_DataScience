clean_str <- function(input_str){
  cleaned_string <- gsub("[[:punct:][:space:]]","",input_str)
  cleaned_string <- tolower(cleaned_string)
  return(cleaned_string)
}

is_palindrome <- function(input_str){
  cleaned_string <- clean_str(input_str)
  reversed_string <- paste(rev(strsplit(cleaned_string, NULL)[[1]]), collapse = "")
  return(cleaned_string == reversed_string)
}

input_str <- readline(prompt = "Enter the string to check if it's a palindrome: ")

if (is_palindrome(input_str)) {
  cat("The given string is a palindrome.\n")
} else {
  cat("The given string is not a palindrome.\n")
}