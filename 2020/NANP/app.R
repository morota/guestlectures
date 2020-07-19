ui <- fluidPage(

  # App title ----
  titlePanel("ChickWeight data"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 30,
                  value = 15)
    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot")


    )
  )
)





server <- function(input, output) {

  # Plot
  output$distPlot <- renderPlot({



    x <- ChickWeight$weight
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Weight",
         main = "ChickWeight data")

  })

}



shinyApp(ui, server)
