list(1, 2, 3) # ------------------------79. List------------------------

list(c(1, 2, 3)) 

list1 <- list(c(1, 2, 3), 3:7)
list1

theDF <- data.frame(First=1:10, Second=10:1, Letters=letters[1:10]) # ------------------------80. List-Hetereogeniety------------------------
theDF

list(theDF, 1:10)

list2 <- list(theDF, 1:10, list1)
list2

names(list2) # ------------------------81. List-Names------------------------
names(list2) <- c('data.frame', 'vector', 'list')
names(list2)
list2

list3 <- list(TheDataFrame=theDF, TheVector=1:10, TheList=list1)
names(list3)
list3

list3 # ------------------------82. List-Elements------------------------

list3[[1]]
list3[1]

class(list3[[1]])
class(list3[1])

list3[['TheDataFrame']]
list3$TheDataFrame

list3[['TheDataFrame']]$Letters
list3[['TheDataFrame']]$Letters[c(2, 5)]
