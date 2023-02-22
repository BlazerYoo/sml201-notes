library(dplyr) # ------------------------26. Load diamonds------------------------
data(diamonds, package='ggplot2')
diamonds
class(diamonds)

diamonds %>% select(carat, price) # ------------------------27. dplyr-Refresh-Select-Slice-Filter------------------------
diamonds %>% slice(c(3, 7))

diamonds %>% filter(carat >= 1)
diamonds %>% filter(cut == 'Premium')
diamonds %>% filter(carat >= 1 & cut == "Premium")

diamonds %>% mutate(price/carat) # ------------------------28. Mutate------------------------
326/0.23
diamonds
new_diamonds <- diamonds %>% mutate(price/carat)
new_diamonds
diamonds

new_diamonds %>% slice(1) %>% pull('price/carat')

diamonds %>% mutate(Ratio=price/carat)
diamonds %>% mutate(Ratio=price/carat) %>% mutate(Double=Ratio*2)
diamonds %>% mutate(Ratio=price/carat, Double=Ratio*2)

diamonds %>% mutate(price=price/3)
diamonds

diamonds %>% arrange(carat) # ------------------------29. Arrange------------------------
diamonds %>% arrange(-carat)
diamonds %>% arrange(-price, carat)
diamonds %>% arrange(-price, -carat)

diamonds
diamonds %>% mutate(depth_rank=rank(depth))
diamonds %>% arrange(depth) %>% tibble::rowid_to_column(var='depth_rank')

# package::function()

?dplyr::min_rank

diamonds %>% mutate(depth_rank=row_number(depth))
diamonds %>% mutate(depth_rank1=row_number(depth), depth_rank2=rank(depth))
diamonds %>% mutate(depth_rank1=row_number(depth), depth_rank2=rank(depth, ties_method='first'))

diamonds %>% distinct(cut) # ------------------------30. Distinct------------------------
diamonds %>% distinct(cut, color)

diamonds %>% distinct(cut, .keep_all=TRUE)
diamonds %>% distinct(cut, color, .keep_all=TRUE)

diamonds %>% pull(price) %>% mean() # ------------------------31. Summarize------------------------
diamonds %>% summarize(mean(price))
diamonds %>% summarize(sum(carat))

diamonds %>% summarize(AvgPrice=mean(price))
diamonds %>% summarize(AvgPrice=mean(price), MedianPrice=median(price), TotalWeight=sum(carat), Cheapest=min(price))

diamonds %>% group_by(cut) # ------------------------32. Group by summarize------------------------

diamonds %>% group_by(cut) %>% summarize(AvgPrice=mean(price))

diamonds %>%
  group_by(cut, color)%>%
  summarize(AvgPrice=mean(price))

diamonds%>%
  group_by(cut, color) %>%
  summarize(AvgPrice=mean(price), MedianPrice=median(price))

diamonds %>% # ------------------------33. Count------------------------
group_by(cut) %>%
  summarize(Size=n())
diamonds %>% count(cut)
diamonds %>% count(cut, sort=TRUE)
diamonds %>% add_count(cut)

# for diamonds bigger than 1 carat # ------------------------34. Sumamrize-Filter-Arrange------------------------
# find the average price
# sorted by descending average price

diamonds %>%
  filter(carat > 1) %>%
  group_by(cut) %>%
  summarize(AvgPrice=mean(price)) %>%
  arrange(-AvgPrice)
