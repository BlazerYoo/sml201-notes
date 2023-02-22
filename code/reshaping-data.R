piggyback::pb_download('data/reaction.txt', repo='jaredlander/coursedata') # ------------------------63. Wide-Data------------------------

emotion = readr::read_tsv("https://github.com/jaredlander/coursedata/releases/download/v0.0.1/data.2freaction.txt")#emotion  <- readr::read_tsv('data/reaction.txt')
emotion # This is wide data since there is one row per observation and one column per variable

library(tidyr) # ------------------------64. Pivot-Longer------------------------
library(dplyr)

emotion_long <- emotion |> # data for multiple variables in one column and another column for grouping the variables
  select(ID, Test, Age, React, Regulate) |>
  pivot_longer(cols=c(React, Regulate), names_to='Variable', values_to='value')
emotion_long

emotion # ------------------------65. Why-Pivot-Longer------------------------

library(ggplot2)

ggplot(emotion, aes(x=Age)) +
  geom_point(aes(y=React, color=factor(Test)), shape=16) +
  geom_point(aes(y=Regulate, color=factor(Test)), shape=17)

emotion_long

ggplot(emotion_long, aes(x=Age, y=value, color=factor(Test), shape=Variable)) +
  geom_point()

emotion_long |>  # ------------------------66. Pivot-Wider-Simple------------------------
  pivot_wider(id_cols=c(ID, Test, Age), names_from=Variable, values_from=value)

piggy::pb_download('data/flightSegments.csv', repo='jaredlander/coursedata') # ------------------------67. Pivot-Wider-Complex------------------------

flights = readr::read_csv("http://www.jaredlander.com/data/flight_segments.csv") # flights <- readr::read_csv('data/flightSegments.csv')

flights

flights_wide <- flights |> 
  pivot_wider(id_cols=c(Segment, Airline), names_from=c(Place), values_from=c(Airport, Long, Lat))

library(threejs) # ------------------------68. Why-Pivot-Wider------------------------

piggyback::pb_download('data/nasa_globe.jpg', repo='jaredlander/coursedata')

globejs(
  img='data/nasa_globe.jpg',
  arcs=flights_wide |> select(Lat_Origin, Long_Origin, Lat_Destination, Long_Destination),
  arcsHeight=0.4, arcsLwd=7, arcsColor='red', arcsOpactiy=0.95
)

flights_wide # ------------------------69. Unite-Separate------------------------
flights_wide |> 
  unite(col='Journey', Airport_Origin, Airport_Destination, sep='-')
flights_wide |> 
  unite(col='Journey', Airport_Origin, Airport_Destination, sep='-', remove=FALSE)

flights_wide |> 
  unite(col='Journey', starts_with('Airport'), sep='-')

flights_wide |> 
  separate(Long_Origin, into=c('Degrees', 'Decimal'), sep='\\.', convert=TRUE)
flights_wide |> 
  separate(Long_Origin, into=c('Degrees', 'Decimal'), sep='\\.', convert=TRUE, remove=FALSE)

 