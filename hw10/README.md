Homework 10: Reflection
================

Here is my [homework 10](https://github.com/cheungamanda/STAT547-hw-cheung-amanda/blob/master/hw10/hw10_data-from-the-web.md)!

I scraped music data from [Billboard The Hot 100](https://www.billboard.com/charts/hot-100).

### Reflection

-   I used the [course notes](http://stat545.com/111Scraping_Workthrough.html#the-lyrics), the [linked tutorial](https://github.com/ropensci/user2016-tutorial/blob/master/03-scraping-data-without-an-api.pdf), and the [homework assignment page](http://stat545.com/hw10_data-from-web.html) for assistance with this assignment.

-   I took a while to choose a dataset I would be able to work with. This section of the course was definitely tricky, and seeing the html code for a webpage can be intimidating.

-   The Billboard website was relatively organized and it wasn't too hard to get data off of it.

-   I tried many approaches before I realized there was a `trimws()` function. Super useful tool!

-   When I extracted the values for the `weeks on chart`, I only considered values with double digits at first. I realized later on all the single digit values had `\n` in front. The `trimws()` function came in handy!

-   I haven't used ggplot since the beginning assignments, so I definitely forgot about some of the features/functions and relied on past homework assignments.

HOORAY!!! THIS COURSE IS OVER!
