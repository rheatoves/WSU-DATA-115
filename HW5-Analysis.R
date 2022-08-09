
## Homework 5 Analysis
## DATA 115, Rhea Toves

library(ggplot2)
library(dplyr)

col_data <- read.csv("COL.csv")

HWAS_data <- read.csv("Height_Weight_Age_Sex.csv")

height_boxplot <- ggplot(HWAS_data, aes(x=age, y=height)) +
  geom_boxplot(fill="slateblue", alpha=0.1) +
  ggtitle("Heights")

weight_boxplot <- ggplot(HWAS_data, aes(x=age, y=weight)) +
  geom_boxplot(fill="slateblue", alpha =0.1) +
  ggtitle("Weights")

height_histogram <- ggplot(HWAS_data, aes(x=height)) +
  geom_histogram(bins=30) +
  ggtitle("Heights")

weight_histogram <- ggplot(HWAS_data, aes(x=weight)) +
  geom_histogram(bins=30) +
  ggtitle("Weights")

weight_male_box <- ggplot(HWAS_data, aes(group=male, y=weight)) +
  geom_boxplot(fill="slateblue", alpha =0.1) +
  xlab("Male") +
  ggtitle("Weights for Males")

HWAS_data$BMI <- HWAS_data$weight/((HWAS_data$height/100)**2)

HWAS_data$underweight <- HWAS_data$BMI <18.5

BMI_histogram <- ggplot(HWAS_data, aes(x=BMI)) +
  geom_histogram(bins=30) +
  ggtitle("BMI")

male_histogram <- ggplot(HWAS_data, aes(x=male)) +
  geom_histogram(bins=30) +
  ggtitle("Males")

height_weight_scatterplot <- ggplot(HWAS_data, aes(x=weight, y=height)) +
  geom_point(fill="slateblue", alpha =0.1) +
  ggtitle("Heights and Weights")
