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
  
### Data Process: At the beginning of this project I was looking through multiple datasets about music. As I was sorting through different datasets, articles, and websites I remembered how helpful the website "Kaggle" is during data searching. I looked up and searched through multiple datasets on Kaggle. The dataset needed to have about 10 columns (the more the better), a good amount of rows, and contain information that intrigues my research. I finally chose the dataset "Spotify Top 100 Charts (2020-2021)", which is a dataset providing information on popular songs based on (including but not limited to) artists, energy, liveliness, and popularity ratings throughout a timeline of years. I then began to sort the data by the sum of popularity, energy, and liveliness votes. After gathering the individual sums of these three categories, I arranged the data by year from least to most votes. Finally I graphed the results of 

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
