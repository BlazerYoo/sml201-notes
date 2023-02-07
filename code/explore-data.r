library(piggyback) # ------------------------18. Download CSV------------------------

pb_download(file='data/TomatoFirst.csv', repo='jaredlander/coursedata')

library(readr) # ------------------------19. Read CSV------------------------

tomato <- read_csv('data/TomatoFirst.csv', ) #tomato = read_csv(file ='https://github.com/jaredlander/coursedata/releases/download/v0.0.1/data.2fTomatoFirst.csv')

tomato

# read_csv: tibble
# read.csv: data.frame
# fread from data.table: data.table

class(tomato) # ------------------------20. Explore data frame------------------------
nrow(tomato)
ncol(tomato)
dim(tomato)

str(tomato)

summary(tomato)

head(tomato)
head(tomato, n=3)
head(tomato, n=4)

tail(tomato)
tail(tomato, n=2)

tomato$Acid # ------------------------21. Data frame statistics------------------------
tomato$Price

mean(tomato$Acid)
median(tomato$Acid)
summary(tomato$Acid)
IQR(tomato$Acid)
min(tomato$Acid)
max(tomato$Acid)
range(tomaot$Acid)

tomato$Price

mean(tomato$Price)
mean(tomato$Price, na.rm=TRUE)
median(tomato$Price)
median(tomato$Price, na.rm=TRUE)
