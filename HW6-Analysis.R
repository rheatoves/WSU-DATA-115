
library("tidyverse")
library("dplyr")
library("ggplot2")
library("GGally")

COL <- read.csv("COL-1.csv")

BB2020 <- read.csv("2020bb_values.csv")

row(BB2020, 33)

bbshort <- BB2020[c(1,5,seq(6,18,2))]

bbcor <- cor(bbshort)

pac12 <- BB2020 %>%
  mutate(Conf = "P12")

pac12short <- pac12[c(1,5,seq(6,18,2))]

pac12cor <- cor(pac12short)

numericCOL <- COL[,2:7]

COLcor <- cor(numericCOL)

par(mar = c(1, 1, 1, 1))  
COLscatters <- ggpairs(numericCOL, title = "Cost of Living")

capcin <- ggplot(data = numericCOL, mapping = aes(Cappuccino, Cinema, color=Income)) +
  geom_point()
