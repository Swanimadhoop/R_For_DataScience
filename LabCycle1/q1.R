text="this is a simple and humble programming language . 
I have to and give me the and is good . 
The following i am the one for annd is the moon."


# count the number of words
words <- unlist(strsplit(text, "\\W+"))

word_count=length(words)

cat("total number of words = ", word_count)

# calculate the average word length
word_length=nchar(words)

avg_word_len= mean(word_length)

cat("average word length= ", avg_word_len)

#identify and print the longest word
max_length=max(word_length)
longest_word=words[which.max(word_length)]

cat("longest word= ", longest_word)

#replace the occurance of a word with a new word
old_word <- "and"
new_word <- "andsss"

new_text <- gsub(old_word, new_word, text, ignore.case = TRUE)

cat("Modified text:\n", new_text, "\n")


