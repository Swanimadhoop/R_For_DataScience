run_length_encoding <- function(input_str){
  result <- ""
  count <- 1
  
  for(i in 1:(nchar(input_str)-1)){
    if(substr(input_str,i,i) == substr(input_str, i+1, i+1)){
      count <- count+1
    }else{
      result <- paste0(result, substr(input_str, i, i), count)
      count <- 1
    }
  }
  result <- paste0(result, substr(input_str, nchar(input_str), nchar(input_str)), count)
  return(result)
}

input_str <- readline(prompt = "Enter a string to compress: ")

compressed_str <- run_length_encoding(input_str)
cat("The compressed string: ", compressed_str, "\n")