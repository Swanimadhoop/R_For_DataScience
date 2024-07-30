
caesar_cipher_encrypt <- function(sentence, shift) {
  
  shift_char <- function(char, shift) {
    if (grepl("[a-z]", char)) {
      new_char <- intToUtf8(((utf8ToInt(char) - utf8ToInt("a") + shift) %% 26) + utf8ToInt("a"))
    } else if (grepl("[A-Z]", char)) {
      new_char <- intToUtf8(((utf8ToInt(char) - utf8ToInt("A") + shift) %% 26) + utf8ToInt("A"))
    } else {
      new_char <- char
    }
    return(new_char)
  }
  
  
  encrypted_sentence <- paste(sapply(strsplit(sentence, NULL)[[1]], shift_char, shift), collapse = "")
  return(encrypted_sentence)
}


sentence <- readline(prompt = "Enter a sentence to encrypt: ")


if (is.na(shift) || shift < 0) {
  cat("Invalid shift value. Please enter a non-negative integer.\n")
} else {
  
  encrypted_sentence <- caesar_cipher_encrypt(sentence, shift)
  cat("Encrypted sentence:", encrypted_sentence, "\n")
}

