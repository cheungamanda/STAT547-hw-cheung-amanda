ui <- fluidPage(
  
  # Application title
  titlePanel("Movie Explorer (old releases)"),
  
  # Sidebar elements
  # Sidebar title
  sidebarPanel(h4("FILTER MOVIES"),
               # Sidebar image
               img(src = "theatre.gif", width = "100%"),
               # Year of release slider
               sliderInput("Year", "Year of release",
                           min = 1890, max = 2005,
                           value = c(1970, 2000)),
               # Movie length slider
               sliderInput("Length", "Length in minutes",
                           min = 0, max = 3000,
                           value = c(60, 180), post = " mins"),
               # Votes slider
               sliderInput("Votes", "Minimum number of IMDB users who rated this movie",
                           min = 0, max = 160000,
                           value = 1000, step = 100, post = " votes"),
               # Genre checkboxes
               h5("Genre"),
               checkboxInput("Action", "Action", value = TRUE),
               checkboxInput("Animation", "Animation", value = FALSE),
               checkboxInput("Comedy", "Comedy", value = FALSE),
               checkboxInput("Drama", "Drama", value = TRUE),
               checkboxInput("Documentary", "Documentary", value = FALSE),
               checkboxInput("Romance", "Romance", value = FALSE),
               checkboxInput("Short", "Short", value = FALSE)),
  
  # Main panel elements
  mainPanel(
    # Tab elements
    tabsetPanel(
      # Plots tab
      tabPanel("Plots", plotOutput("hist_rating"),
               br(), br(),
               plotOutput("plot_votes"),
               br(), br()),
      # Summary table tab
      tabPanel("Summary Table", DT::dataTableOutput("table_head"))) 
    )
)
