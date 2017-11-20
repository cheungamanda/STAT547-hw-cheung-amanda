ui <- fluidPage(
  
  # Application title
  titlePanel("Old movie database"),
  
  sidebarPanel(h3("Filter movies"),
               img(src = "cinema.jpg", width = "100%"),
               sliderInput("Year", "Year of release",
                           min = 1890, max = 2005,
                           value = c(1970, 2000)),
               sliderInput("Length", "Length in minutes",
                           min = 0, max = 5500,
                           value = c(60, 180), post = "mins"),
               sliderInput("Votes", "Minimum number of IMDB users who rated this movie",
                           min = 0, max = 160000,
                           value = 1000, step = 100)),
  
  mainPanel(
    plotOutput("hist_rating"),
    br(), br(),
    tableOutput("table_head"))

)