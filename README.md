# DATA-115, Rhea Toves

### Motivation: The question(s) that helped me start out this analysis was, "What did the highest rated year look like in terms of top energy, popularity, and the different attributes that come into play under these categories?". The choice in this dataset was driven by my curiosity in comparing the statistics and popularity of music in different years. The outcome of this analysis can tell you a lot about a the society and culture as a collective throughout the years.

library(dplyr)
library(ggplot2)

top100 <- read.csv("Spotify100.csv")

most_popular <- top100 %>%
  group_by(year) %>%
  summarise(total_pop = sum(popularity)) %>%
  arrange(total_pop)

most_energetic <- top100 %>%
  group_by(year) %>%
  summarise(total_energy = sum(energy)) %>%
  arrange(total_energy)

most_live <- top100 %>%
  group_by(year) %>%
  summarise(total_liveness = sum(liveness)) %>%
  arrange(total_liveness)
  
### Data Process: I started 

## Graphing

popgraph <- ggplot(most_popular, aes(x= year, y= total_pop)) +
  geom_line() +
  xlab("Year") +
  ylab("Popularity Ratings") +
  ggtitle("Most Popular by Year")

energygraph <- ggplot(most_energetic, aes(x= year, y= total_energy)) +
  geom_line() +
  xlab("Year") +
  ylab("Energy Ratings") +
  ggtitle("Most Energetic by Year")

livenessgraph <- ggplot(most_live, aes(x= year, y= total_liveness)) +
  geom_line() +
  xlab("Year") +
  ylab("Liveliness Ratings") +
  ggtitle("Most Live by Year")
  
  ## Boxplot
  
  popularboxplot <- ggplot(most_popular, aes(x= year, y= total_pop)) +
  geom_boxplot(fill="slateblue", alpha=0.1) +
  xlab("Year") +
  ylab("Popular Ratings") +
  ggtitle("Most Popular")
