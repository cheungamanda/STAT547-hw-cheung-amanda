Homework 8: Building a Shiny app
================

#### It's movie night!

Feeling an old film, but not sure what to watch?

Choose from a list of old releases using the **[Movie Explorer app](https://cheungamanda.shinyapps.io/Movie_Explorer/)**!

#### Function

This app filters through a database of movies that were released from 1893-2005. Users can filter through the movies by their release year, length, number of IMDB user ratings, and movie genre.

The movie database was acquired from [Hadley Wickham's data compilation project](https://github.com/hadley/data-movies). This data was originally from the internet movie database (IMDB), where movie data is found in many text files and in various formats. Hadley Wickham created ruby scripts to extract relevant information from these files and store it all in a database. The data is exported to csv, found [here](https://github.com/hadley/ggplot2movies/blob/master/data-raw/movies.csv), and is the dataset used in this app.

1.  The sidebar features 3 sliders to filter through movies depending on their release year, length, and minimum number of IMDB user ratings.

2.  Users can choose one or more movie genre using the checkboxes to narrow down their selection.

3.  The histogram represents the number of movies corresponding with the users filters, and the ratings associated with the movies.

4.  The scatterplot represents the relationship between the ratings and movie length depending on the different filters. The number of IMDB user ratings and year of release are also represented in the data points.

5.  The summary table shows the list of movies corresponding to the filters. The users can choose the number of entries to view, and can use the different headings to further filter through the list.

#### Process

This assignment was quite fun! I really liked it and very much enjoyed making my own Shiny app. The [class notes](http://stat545.com/shiny01_activity.html) were helpful in walking me through the foundational steps. I used the [homework notes](http://stat545.com/hw08_shiny.html) for inspiration on features to include in my app. I also found a very advanced [movie explorer app](https://github.com/rstudio/shiny-examples/tree/master/051-movie-explorer) which helped guide me through the organization of my app. I used the [Shiny widget gallery](https://shiny.rstudio.com/gallery/widget-gallery.html) to learn about incorporating checkboxes in my code. Unfortunately, I don't know CSS. I would have liked to use it to make my app look more pleasing. Overall, this was a relatively straight forward and enjoyable assignment!
