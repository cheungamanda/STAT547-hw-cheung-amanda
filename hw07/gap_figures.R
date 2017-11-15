## Generating figures

## Load packages
library(tidyverse)

## Load gapminder reordered data
gap_reorder <- readRDS("hw07/gap_reorder_pop.RDS")

## Europe
europe_fit <- gap_reorder %>% 
  filter(country %in% c("Turkey", "France", "Poland", "Iceland", "Bulgaria", "Montenegro")) %>% 
  ggplot(aes(x = year, y = pop)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ country) +
  theme_bw() +
  scale_y_log10() +
  labs(title = "Maximum and Minimum Population Trends in Europe") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("hw07/europe_fit.png", europe_fit)

