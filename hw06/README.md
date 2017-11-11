Homework 06 Process
================

Here is the link to [homework 06](https://github.com/cheungamanda/STAT547-hw-cheung-amanda/blob/master/hw06/hw06_data-wrangling.md)!

#### Writing functions

Writing functions was tricky at first. I read over the [class notes](http://stat545.com/block011_write-your-own-function-01.html) again to familiarize myself with the notion of writing functions. I followed the notes on writing a function for a [linear regression](http://stat545.com/block012_function-regress-lifeexp-on-year.html) to guide me through this part of the assignment. Afterward, it was quite straightforward to write a function to calculate robust regression.

#### Candy data

THIS WAS TRICKY! I'm glad I finally figured out what I was doing with all that raw data. I was not able to use `select()` without an error occuring. However, if I use `dplyr::select()` the function works?! I searched online and [others appeared to have this error](https://stackoverflow.com/questions/46325145/error-with-select-function-from-dplyr) as well.

I used Jenny Bryan's [class notes](https://github.com/jennybc/candy/blob/master/data-raw/00_explore-raw.md) to initially assist me with this assignment. I used this [link](https://stackoverflow.com/questions/16384933/r-basics-creating-id-column) for help with creating an id column. I did not know how to perform an inner join on multiple tables, but I found a [source](https://stackoverflow.com/questions/16384933/r-basics-creating-id-column) that was quite helpful. Also, I referred to my previous homework assignments from STAT545 for help (surprising because I did not think that would happen)! I also used this [link](https://stackoverflow.com/questions/17721126/simplest-way-to-do-grouped-barplot) for help with making a grouped bar plot and this [link](http://www.sthda.com/english/wiki/renaming-data-frame-columns-in-r) for help with renaming data columns.

#### Work with a list

I was not too sure how to structure this section, so I mainly followed the formatting from [Jenny Bryan's notes](https://jennybc.github.io/purrr-tutorial/ls02_map-extraction-advanced.html). This exercise was really helpful and allowed me to understand `map()` and its associated functions much better.
