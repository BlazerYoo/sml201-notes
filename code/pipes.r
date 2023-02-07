library(readr) # ------------------------22. Pipes------------------------
tomato <-read_csv('data/TomatoFirst.csv')

library(magrittr)

head(tomato)
head(tomato, n=4)
tail(tomato, n=3)

tail(head(tomato, n=4), n=1)

head(tomato)
tomato %>% head()
tomato %>%  head(n=4)

tail(tomato)
tomato %>% tail()
tomato %>% tail()
# ctrl+shift+M
tomato %>% tail(n=1)

tail(head(tomato, n=4), n=1)
tomato %>% head(n=4) %>% tail(n=1)
 