get_input <- function(prompt) {
  cat(prompt)
  input <- scan(what = character(), nmax = 1, quiet = TRUE)
  return(input)
}

validate_age <- function(age){
  age <- suppressWarnings(as.numeric(age))
  if(!is.na(age) && age > 0 && age == round(age)){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

validate_grade <- function(grade){
  valid_grades <- c("A","B","C","D","E","F")
  return(grade %in% valid_grades)
}

read_student_records <- function(){
  students <- list()
  valid_ages <- numeric()
  
  repeat {
    name <- get_input("Enter student name (or 'done' to finish): ")
    if(tolower(name) == "done"){
      break
    }
    
    age_input <- get_input("Enter age of the student: ")
    if(!validate_age(age_input)){
      cat("Invalid Age!\n")
      next
    }
    age <- as.numeric(age_input)
    
    grade <- get_input("Enter the Grade (A,B,C,D,E,F): ")
    if(!validate_grade(grade)){
      cat("Invalid Grade!\n")
      next
    }
    
    students[[length(students)+1]] <- list(name = name, age = age, grade = grade)
    valid_ages <- c(valid_ages, age)
  }
  
  if(length(valid_ages) > 0){
    avg_age <- mean(valid_ages)
    cat("The average age of students with valid ages: ", avg_age, "\n")
  } else {
    cat("There were no valid entries of Age.\n")
  }
  
  return(students)
}


student_records <- read_student_records()
print(student_records)