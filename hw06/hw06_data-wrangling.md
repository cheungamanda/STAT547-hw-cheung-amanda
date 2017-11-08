STAT545 Homework 06: Data wrangling wrap up
================

### Load packages

Load necessary packages.

``` r
library(tidyverse)
library(stringr)
library(knitr)
```

1. Character data
-----------------

Read and work the exercises in the [Strings chapter or R for Data Science](http://r4ds.had.co.nz/strings.html).

### String basics exercises

**1. In code that doesn’t use stringr, you’ll often see paste() and paste0(). What’s the difference between the two functions? What stringr function are they equivalent to? How do the functions differ in their handling of NA?**

**2. In your own words, describe the difference between the sep and collapse arguments to str\_c().**

**3. Use str\_length() and str\_sub() to extract the middle character from a string. What will you do if the string has an even number of characters?**

**4. What does str\_wrap() do? When might you want to use it?**

**5. What does str\_trim() do? What’s the opposite of str\_trim()?**

**6. Write a function that turns (e.g.) a vector c("a", "b", "c") into the string a, b, and c. Think carefully about what it should do if given a vector of length 0, 1, or 2.**
