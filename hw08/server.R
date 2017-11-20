library(tidyverse)

server <- function(input, output) {
  movies <- read_csv("data/movies.csv")
  
  filtered_movies <- reactive({
    movies %>%
      filter(Year >= input$Year[1],
             Year <= input$Year[2],
             Length >= input$Length[1],
             Length <= input$Length[2],
             Votes >= input$Votes) %>% 
      arrange(desc(Rating))
    
  })
  
  output$hist_rating <- renderPlot({
    filtered_movies() %>% 
      ggplot() +
      aes(x = Rating) +
      geom_histogram(bins = 30) +
      theme_bw()
  })
  
  output$table_head <- renderTable({
    filtered_movies() %>%
      head(10)
  })
}