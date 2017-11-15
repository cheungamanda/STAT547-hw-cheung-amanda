## Statistical analyses

## Load packages
library(tidyverse)
library(knitr)
library(broom)
library(magrittr)


## Load gapminder reordered data
gap_reorder <- readRDS("hw07/gap_reorder.RDS")

## Show that order of countries is preserved
kable(head(levels(gap_reorder$country)))

## Fit a linear regression of population on year within each country
ggplot(gap_reorder, aes(x = year, y = pop)) +
  geom_jitter() +
  geom_smooth(lwd = 3, se = FALSE, method = "lm") +
  scale_y_log10()

## Function
linear_fit <- function(dat, offset = 1952) {
  lm_fit <- lm(pop ~ I(year - offset), dat)
  setNames(data.frame(t(coef(lm_fit))), c("intercept", "slope"))
}

## Fit for all countries
pop_fit1 <- gap_reorder %>%
  group_by(country) %>% 
  do(linear_fit(.))
pop_fit1

## Broom functions
fits <- gap_reorder %>% 
  group_by(country, continent) %>%
  do(fit = lm(pop ~ I(year - 1952), .))

pop_fit2 <- fits %>% 
  glance(fit)

## Join intercept and slope data with other statistical parameters
pop_fit_total <- inner_join(pop_fit, pop_fit2, by = "country")

pop_fit_total %>% 
  saveRDS("hw07/pop_fit_total.rds")

## Top 3 maximum and minimum slope for Europe
## Slope represents population growth over time in each country

## Europe
## maximum
max_europe <- pop_fit_total %>% 
  filter(continent == "Europe") %>%
  arrange(desc(slope)) %>% 
  head(3)

## minimum
min_europe <- pop_fit_total %>% 
  filter(continent == "Europe") %>%
  arrange(slope) %>% 
  head(3)

  





