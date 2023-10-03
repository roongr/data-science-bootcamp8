---
title: "Data Viz"
author: "Orrawee Roong"
date: "2023-07-27"
output: html_document
---

# Homework Data Viz

## This is structure data of Diamonds dataframe

```{r message=FALSE, warning=FALSE}
library(tidyverse)
glimpse(diamonds)
```

## First Chart

### Relationship between Cut and Carat

```{r message=FALSE, warning=FALSE}
ggplot(diamonds %>% sample_n(1000), aes(cut, carat)) +
  geom_boxplot(fill="pink") +
  labs(title = "Relationship between Cut and Carat",
       x = "Cut",
       y = "Carat") +
  theme_minimal() 
```

## Second Chart

### Relationship between Carat and Price separate by Cut

```{r message=FALSE, warning=FALSE}
ggplot(diamonds %>% sample_n(1000), aes(carat, price)) +
  geom_point(alpha=0.7) +
  geom_smooth(col="red", fill="gold") +
  theme_minimal() +
  facet_wrap(~ cut) +
  labs(title = "Relationship between Carat and Price",
       x = "Carat",
       y = "Price")
```

## Third Chart

### Relationship between Cut and Price

```{r message=FALSE, warning=FALSE}
ggplot(diamonds %>% sample_n(500), aes(cut, price)) +
  geom_col(fill="lightblue") +
  labs(title = "Relationship between Cut and Price",
       x = "Cut",
       y = "Price") +
  theme_minimal()
```

## Fourth Chart

### Count of Cut separate by ratio of Color

```{r message=FALSE, warning=FALSE}
ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position="fill") +
  theme_minimal() +
  labs(title = "Count of Cut separate by ratio of Color",
       x = "Cut",
       y = "Count")
```

## Fifth Chart

### Relationship between Carat and Price separate by Color

```{r message=FALSE, warning=FALSE}
ggplot(diamonds %>% sample_n(1000), aes(carat, price, col=cut)) +
  geom_point(size=2, alpha=0.7) +
  scale_color_brewer(palette = "Set3") +
  facet_wrap(~ color) +
  labs(title = "Relationship between Carat and Price separate by Color",
       x = "Carat",
       y = "Price") +
  theme_minimal()
```

#### Learning from : 

[Google](https://www.google.com)

[Datarockie](https://datarockie.com)

Add an image to this report.

She is Han Sohee , an actress from South Korea.

![Han Sohee](https://i.pinimg.com/550x/b1/17/0a/b1170a6ad940371fe8ead2b30b71babc.jpg)
