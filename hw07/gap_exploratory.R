## Exploratory analyses

## Load packages
library(tidyverse)
library(ggplot2)
library(forcats)
library(knitr)

## Load gapminder data
gapminder <- read_tsv("gapminder.tsv")

## Convert country and continent to factors
gapminder <- gapminder %>%
  mutate(country = factor(country),
         continent = factor(continent))

## Population of European countries in 2002
euro_pop_2002 <- gapminder %>%
  filter(year == 2002, continent == "Europe") %>% 
  ggplot(aes(x = fct_reorder(country, pop), y = pop)) +
  geom_bar(stat = "identity", aes(fill=pop)) +
  coord_flip() +
  theme_bw() +
  labs(title = "Population of European Countries in 2002") +
  scale_x_discrete("Country") +
  scale_y_continuous("Population") +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_fill_distiller("Population", palette="Spectral")

## Save plot
ggsave("euro_pop_2002.png", euro_pop_2002)

## Population vs. Life expectancy in 2007
pop_lifeExp_2007 <- gapminder %>% 
  filter(year==2007) %>% 
  ggplot(aes(x=pop, y=lifeExp)) +
  geom_point(shape=21, aes(size=gdpPercap, fill=continent)) +
  scale_x_log10() +
  theme_bw() +
  labs(title = "Population vs. Life Expectancy in 2007",
       fill = "Continent",
       size = "GDP per Capita",
       x = "Population",
       y = "Life Expectancy") +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_fill_brewer("Continent", palette="Dark2")

## Save plot
ggsave("pop_lifeExp_2007.png", pop_lifeExp_2007)

## GDP per capita vs. life expectancy
GDP_lifeExp <- gapminder %>% 
  filter(continent != "Oceania") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point(shape=21, aes(size=pop, fill=year)) +
  facet_wrap(~ continent) +
  scale_x_log10() +
  theme_bw() +
  labs(title = "GDP per Capita vs. Life Expectancy",
       fill = "Year",
       size = "Population",
       x = "GDP per Capita",
       y = "Life Expectancy") +
  theme(plot.title = element_text(hjust=0.5)) +
  scale_fill_distiller(palette="YlGnBu", direction=-1)

## Save plot
ggsave("GDP_lifeExp.png", GDP_lifeExp)

## Reorder countries by maximum population in descending order
gap_reorder <- gapminder %>% 
  mutate(country = fct_reorder(country, pop, max, .desc = TRUE))

gap_reorder %>% 
  levels() %>%
  head(10) %>% 
  kable()

saveRDS(gap_reorder, "hw07/gap_reorder.RDS")
