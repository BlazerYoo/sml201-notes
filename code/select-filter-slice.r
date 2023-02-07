library(readr) # ------------------------23. Tibble select------------------------

tomato <- read_csv('data/TomatoFirst.csv')
tomato

tomato$Price

class(tomato)
class(tomato$Price)

library(dplyr)

select(tomato, Price)
class(select(tomato, Price))
pull(tomato, Price)
class(pull(tomato, Price))

select(tomato, Price)
tomato %>% select(Price)

tomato %>% select(Source, Price)
tomato %>% select(Source, Price Sweet)

tomato %>% select(starts_with('S'))

tomato %>% select(Sweet)


tomato %>% select(-Price)
tomato %>% select(-Price, -Source)

filter(tomato, Price < 3) # ------------------------24. Tibble filter------------------------
tomato %>% filter(Price < 3)

tomato %>% filter(Source == 'Whole Foods')
tomato %>% filter(Source == 'Whole Foods' & Price <3)

tomato %>% filter(Source == 'Whole Foods' | Source == 'Trader Joes')
tomato %>% filter(Source %in% c('Whole Foods', 'Trader Joes'))

tomato %>% filter(Source %in% c('Whole Foods', 'Trader Joes') & Price < 3)

tomato

tomato %>% slice(c(1, 2, 5)) # ------------------------25. Tibble slice------------------------

tomato %>% slice_head(n=4)
tomato %>% slice_max(Price)
tomato %>% slice_min(Price)
tomato %>% slice_sample(n=5)
tomato %>% slice_sample(prop=0.3)