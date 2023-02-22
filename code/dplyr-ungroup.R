library(dplyr) # ------------------------92. dplyr-ungroup------------------------
data(diamonds, package='ggplot2')

diamonds

diamonds |>
  group_by(cut, color) |> 
  summarize(AvgPrice=mean(price))

diamonds |> 
  group_by(cut, color) |> 
  summarize(AvgPrice=mean(price)) |> 
  summarize(MeanOfMean=mean(AvgPrice))
  
 diamonds |> 
   group_by(cut, color) |> 
   summarize(AvgPrice=mean(price)) |> 
   ungroup() |> 
   summarize(MeanOfMean=mean(AvgPrice))

 diamonds |> 
   group_by(cut, color) |> 
   summarize(AvgPrice=mean(price), .groups='drop') |> 
   summarize(MeanOfMean=mean(AvgPrice))

?summarize
 