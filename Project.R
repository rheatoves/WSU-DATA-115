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

# graphing

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
