Homework 9: Building your own R package
================

`powers`
--------

The [`powers` package](https://github.com/cheungamanda/powers) is used for simple power computation. It is a further developed version of the orginal package made in class.

New features include:

-   ability to compute non-numeric values (ex. "4")
-   ability to drop NA(s) and display a warning message
-   new function that takes the quartic of a value
-   new function that computes the area of a circle
-   new function that computes the volume of a cylinder

All front-end functions depend on the internal `pow` function.

Process
-------

-   The [class notes](http://stat545.com/cm109-110-notes_and_exercises.html) and [Vincenzo Coia's version of powers](https://github.com/vincenzocoia/powers) were extremely helpful for this assignment. It was a good foundation about learning the basics of building an R package. The [homework notes](http://stat545.com/hw09_package.html) were useful in suggesting additional features for the package. I used [this website](https://www.science.co.il/formula/) for the geometric formulas.

-   This assignment was confusing at times due to the many files that were involved. I was also slower working with these new packages and functions that weren't previously used in other classes.

-   I got a bit confused with dropping NAs, but I eventually figured it out. [This post](https://stackoverflow.com/questions/7706876/remove-na-values-from-a-vector) was quite helpful.

-   I tried to incorporate Box-Cox functions and logarthims, but I couldn't quite figure out how to do so. I was getting more and more confused with every search, so I incorporated simple geometric functions instead. Hopefully I can see how other classmates integrate the power transformation functions in the peer reviews.

-   One more assignment to go!
