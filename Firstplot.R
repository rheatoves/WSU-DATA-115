top100 <- read.csv("Spotify100.csv")

head(top100)

library(ggplot2)
library(dplyr)

top_genres <- top100 %>%
  group_by(top.genre) %>%
  summarise(count = n())

top_genres_scatter <- ggplot(top_genres, aes(x=top.genre, y=count)) +
  geom_point(fill="slateblue", alpha =0.1) +
  ggtitle("Top Genres")