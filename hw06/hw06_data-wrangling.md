STAT547 Homework 06: Data wrangling wrap up
================

### Load packages

Load necessary packages.

``` r
library(tidyverse)
library(stringr)
library(knitr)
library(gapminder)
library(testthat)
library(ggplot2)
library(MASS)
```

2. Writing functions
--------------------

Write a function to compute the robust regression of life expectancy on year with the Gapminder data. `MASS::rlm()` will be used.

#### Practice with some data

Extract data for one country to interactively work with the code.

``` r
p_country <- "Canada"
p_dat <- gapminder %>%
    filter(country == p_country)

kable(p_dat)
```

| country | continent |  year|  lifeExp|       pop|  gdpPercap|
|:--------|:----------|-----:|--------:|---------:|----------:|
| Canada  | Americas  |  1952|   68.750|  14785584|   11367.16|
| Canada  | Americas  |  1957|   69.960|  17010154|   12489.95|
| Canada  | Americas  |  1962|   71.300|  18985849|   13462.49|
| Canada  | Americas  |  1967|   72.130|  20819767|   16076.59|
| Canada  | Americas  |  1972|   72.880|  22284500|   18970.57|
| Canada  | Americas  |  1977|   74.210|  23796400|   22090.88|
| Canada  | Americas  |  1982|   75.760|  25201900|   22898.79|
| Canada  | Americas  |  1987|   76.860|  26549700|   26626.52|
| Canada  | Americas  |  1992|   77.950|  28523502|   26342.88|
| Canada  | Americas  |  1997|   78.610|  30305843|   28954.93|
| Canada  | Americas  |  2002|   79.770|  31902268|   33328.97|
| Canada  | Americas  |  2007|   80.653|  33390141|   36319.24|

Plot the data to see what it looks like!

``` r
p <- ggplot(p_dat, aes(x = year, y = lifeExp))
p + geom_point() + geom_smooth(method = "rlm", se = FALSE) + theme_bw()
```

![](hw06_data-wrangling_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-1.png)

#### Practice with working code

Fit the robust regression.

``` r
p_fit <- rlm(lifeExp ~ year, p_dat)
coef(p_fit)
```

    ##  (Intercept)         year 
    ## -358.3036895    0.2188468

Hmm... it doesn't seem quite right that life expectancy was about -358. Let's make this more appropriate and set life expectancy to the earliest year in Gapminder (1952).

``` r
p_fit <- rlm(lifeExp ~ I(year - 1952), p_dat)
coef(p_fit)
```

    ##    (Intercept) I(year - 1952) 
    ##     68.8853510      0.2188468

#### Turn the working code into a function!

``` r
robust_fit <- function(dat, offset = 1952) {
  the_fit <- rlm(lifeExp ~ I(year - offset), dat)
  setNames(coef(the_fit), c("intercept", "slope"))
}
robust_fit(p_dat)
```

    ##  intercept      slope 
    ## 68.8853510  0.2188468

Hooray, we get the same result as above!

#### Test the function on other data

Let's look at the robust regression of life expectancy on year in Algeria.

``` r
p_country2 <- "Algeria"
p_dat2 <- gapminder %>%
    filter(country == p_country2)

kable(p_dat2)
```

| country | continent |  year|  lifeExp|       pop|  gdpPercap|
|:--------|:----------|-----:|--------:|---------:|----------:|
| Algeria | Africa    |  1952|   43.077|   9279525|   2449.008|
| Algeria | Africa    |  1957|   45.685|  10270856|   3013.976|
| Algeria | Africa    |  1962|   48.303|  11000948|   2550.817|
| Algeria | Africa    |  1967|   51.407|  12760499|   3246.992|
| Algeria | Africa    |  1972|   54.518|  14760787|   4182.664|
| Algeria | Africa    |  1977|   58.014|  17152804|   4910.417|
| Algeria | Africa    |  1982|   61.368|  20033753|   5745.160|
| Algeria | Africa    |  1987|   65.799|  23254956|   5681.359|
| Algeria | Africa    |  1992|   67.744|  26298373|   5023.217|
| Algeria | Africa    |  1997|   69.152|  29072015|   4797.295|
| Algeria | Africa    |  2002|   70.994|  31287142|   5288.040|
| Algeria | Africa    |  2007|   72.301|  33333216|   6223.367|

Plot the data!

``` r
p2 <- ggplot(p_dat2, aes(x = year, y = lifeExp))
p2 + geom_point() + geom_smooth(method = "rlm", se = FALSE) + theme_bw()
```

![](hw06_data-wrangling_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-8-1.png)

Use our function!

``` r
robust_fit(p_dat2)
```

    ##  intercept      slope 
    ## 43.1580026  0.5758313

It works! This function calculates the robust regression of life expectancy on year (with the earliest year of 1952).
