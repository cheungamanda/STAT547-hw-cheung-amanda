## Statistical analyses

## Load packages
library(tidyverse)
library(forcats)
library(knitr)
library(broom)

## Load gapminder reordered data
gap_reorder <- readRDS("hw07/gap_reorder_pop.RDS")

## Show that order of countries is preserved
kable(head(levels(gap_reorder$country)))



