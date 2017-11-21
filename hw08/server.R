# Load necessary packages
library(tidyverse)
library(RColorBrewer)

server <- function(input, output) {
  # Read data file
  movies <- read_csv("data/movies.csv")
  
  # Create reactive function
  filtered_movies <- reactive({
    movies %>%
      filter(Year >= input$Year[1],
             Year <= input$Year[2],
             Length >= input$Length[1],
             Length <= input$Length[2],
             Votes >= input$Votes,
             Action == input$Action,
             Animation == input$Animation,
             Comedy == input$Comedy,
             Drama == input$Drama,
             Documentary == input$Documentary,
             Romance == input$Romance,
             Short == input$Short) %>% 
      arrange(desc(Rating))
  })
  
  # Histogram of movie ratings
  output$hist_rating <- renderPlot({
    filtered_movies() %>% 
      ggplot() +
      aes(x = Rating) +
      geom_histogram(bins = 30, colour = "white", fill = "steelblue3", alpha = 0.8) +
      theme_bw() +
      theme(axis.text.x = element_text(size = 12),
            axis.text.y = element_text(size = 12),
            axis.title = element_text(size = 12, face = "bold", colour = "grey15"),
            plot.title = element_text(hjust=0.5, size = 14, face = "bold", colour = "grey15")) +
      labs(title = "Number of Movie Options",
           y = "Number of movies") +
      scale_x_continuous(breaks = c(0, 2, 4, 6, 8, 10))
  })
  
  # Scatter plot of ratings vs. length with votes and year parameters
  output$plot_votes <- renderPlot({
    filtered_movies() %>% 
      ggplot(aes(x = Rating, y = Length, size = Votes, fill = Year)) +
      geom_point(shape = 21, colour = "grey30", alpha = 0.8) +
      theme_bw() +
      theme(axis.text.x = element_text(size = 12),
            axis.text.y = element_text(size = 12),
            axis.title = element_text(size = 12, face = "bold", colour = "grey15"),
            plot.title = element_text(hjust=0.5, size = 14, face = "bold", colour = "grey15")) +
      labs(title = "Movie Information Details",
           y = "Length in minutes",
           colour = "Year",
           size = "Number of \nUser Ratings") +
      scale_fill_distiller(palette="YlGnBu") +
      scale_x_continuous(breaks = c(0, 2, 4, 6, 8, 10))
  })
  
  # Summary table
  output$table_head <- DT::renderDataTable({
    filtered_movies()
  })
}