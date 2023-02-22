library(ggplot2) # ------------------------39. ggplot-histogram------------------------
# grammar of graphics

data(diamonds, package='ggplot2')

diamonds

ggplot(diamonds)

# aesthetics
# - x, y
# - color
# - shape, size
# - opacity
ggplot(diamonds, aes(x=price))

ggplot(diamonds, aes(x=price)) + geom_histogram()        # rule of thumb: num bins = sqrt(num rows)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=10)  # ------------------------40. ggplot-histogram-bins------------------------
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=50)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=100)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=200)

ggplot(diamonds, aes(x=price)) + geom_histogram(bins=50, color='red') # ------------------------41. ggplot2-histogram-color-fill------------------------
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=50, color='red', fill='blue')

ggplot(diamonds, aes(x=price)) + # ------------------------42. ggplot-vline------------------------
  geom_histogram(bins=50, color='red', fill='blue') + 
  geom_vline(xintercept=mean(diamonds$price), color='red', linetype=2)

ggplot(diamonds, aes(x=price)) + geom_density() # ------------------------43. ggplot-density------------------------
ggplot(diamonds, aes(x=price)) + geom_density(fill='grey50')

ggplot(diamonds, aes(x=price, fill=cut)) + geom_density() # ------------------------44. ggplot-density-fill------------------------
ggplot(diamonds, aes(x=price, fill=cut)) + geom_density(alpha=1/3)
ggplot(diamonds, aes(x=price, fill=cut)) + geom_density(alpha=1/2)
ggplot(diamonds, aes(x=price, fill=cut)) + geom_density(alpha=1/4)

ggplot(diamonds, aes(x=cut, y=price)) + geom_boxplot() # ------------------------45. ggplot-boxplot------------------------

ggplot(diamonds, aes(x=cut, y=price)) + geom_violin() # ------------------------46. ggplot-violin------------------------
ggplot(diamonds, aes(x=cut, y=price)) + geom_violin(draw_quantiles=c(0.25, 0.50, 0.75))
ggplot(diamonds, aes(x=cut, y=price, fill=cut)) + geom_violin(draw_quantiles=c(0.25, 0.50, 0.75))

library(ggridges) # ------------------------47. ggplt-ridges------------------------
ggplot(diamonds, aes(x=price, y=cut, fill=cut)) +
  geom_density_ridges(show.legend=FALSE)

library(dplyr) # ------------------------48. ggplot-scatterplot------------------------
set.seed(512)
diamonds <- diamonds |> slice_sample(n=10000)

ggplot(diamonds, aes(x=carat, y=price))
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() # ------------------------49. ggplot-scatterplot-shape-size------------------------
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point(size=1)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point(size=1, shape=1)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point(size=1, shape=1, alpha=1/4)

ggplot(diamonds, aes(x=carat, y=price)) + # ------------------------50. ggplot-scatterplot-smooth------------------------
  geom_point() +
  geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point() +
  geom_smooth(method='lm')

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + # ------------------------51. ggplot-scatterplot-smooth-color------------------------
  geom_point() +
  geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(aes(color=cut)) +
  geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color=cut)) +
  geom_smooth(aes(color=cut)) +
  geom_smooth(color='hotpink')

ggplot(diamonds, aes(x=carat, y=price)) + # ------------------------52. ggplot-scatterplot-hline------------------------
  geom_point(aes(color=cut)) +
  geom_smooth(aes(color=cut)) +
  geom_smooth(color='hotpink') +
  geom_hline(yintercept=mean(diamonds$price))

ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color=cut)) +
  geom_smooth(aes(color=cut)) +
  geom_smooth(color='hotpink') +
  geom_hline(yintercept=mean(diamonds$price), color='red', linetype=2)

ggplot(diamonds, aes(x=carat, y=price)) + # ------------------------53. ggplot-scatterplot-title------------------------
  geom_point(aes(color=cut)) +
  geom_smooth(aes(color=cut)) +
  geom_smooth(color='hotpink') +
  geom_hline(yintercept=mean(diamonds$price), color='red', linetype=2) +
  labs(x='Carat', y='Price(USD)', title='Diamonds Price vs Weight')
