
### Call up libraries
library(ggplot2)
library(tidyverse)
library(sf)
library(ggrepel)

### Make sure we're in the right place and read the csv
setwd("C:/Users/lizar/OneDrive/Documents/ling_590")
data7 <- read_tsv("data7.tsv")
head(data7)

### Export csv file for github
write.csv(data7,file='C:/Users/lizar/OneDrive/Documents/ling_590/descriptive-report-3/speaker_data.csv',fileEncoding = "UTF-8")

### Label columns for ggplot
data7a <- data.frame(
  x=data7$Language,
  y=data7$`Number of Speakers`)

### Create lollipop chart
ggplot(data7a, aes(x=x, y=y)) +
### This is the stem
  geom_segment( aes(x=x, xend=x, y=0, yend=y)) +
### This is the 'candy'  
  geom_point( size=5, color="blue", fill=alpha("skyblue", 0.3), alpha=0.7, shape=21, stroke=2)+
  theme_light() +
  coord_flip() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )+
  labs(y= "Number of Speakers", x = "Language")
