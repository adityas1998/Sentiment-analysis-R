library(dplyr)
library(janeaustenr)
library(tidytext)
library(ggplot2)

book_words <- austen_books() %>%
  unnest_tokens(word, text) %>%
  count(book, word, sort = TRUE) %>%
  ungroup()

total_words <- book_words %>% 
  group_by(book) %>% 
  summarize(total = sum(n))

book_words <- left_join(book_words, total_words)


book_words <- book_words %>%
  bind_tf_idf(word, book, n)

book_words %>%
  select(-total) %>%
  arrange(desc(tf_idf))
  
book_words