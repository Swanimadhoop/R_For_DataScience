fibonacci_series <- function(n){
  if(n<=0){
    stop("Number of terms need to be a positive number!")
  }
  
  series <- numeric(n)
  
  if(n>=1) series[1]=1
  if(n>=2) series[2]=1
  if(n>=3) series[3]=2
  
  for(i in 4:n){
    series[i] <- series[i-1] + series[i-2] + series[i-3]
  }
  
  return(series)
}

main <- function(){
  n <- as.integer(readline(prompt = "Enter the number of terms: "))
  
  series <- fibonacci_series(n)
  
  cat("Generated Series: \n")
  print(series)
}

main()