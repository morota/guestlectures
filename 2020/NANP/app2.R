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
                  value = 15),

      radioButtons("dd",
                   label = "Select Diet",
                   choices = list("ALL" = 0, "1" = 1,"2" = 2,"3" = 3,"4" = 4),
                   selected = 0)

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot")

    )
  )
)





server <- function(input, output) {

  # Reactive dataframe
  ChickWeight2 <- reactive({
    a <- subset(ChickWeight, Diet == as.numeric(input$dd))
    return(a)
  })

  # Plot
  output$distPlot <- renderPlot({


    if (input$dd == 0){
      x <- ChickWeight$weight
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Weight",
           main = "ChickWeight data")
    } else {
      x <- ChickWeight2()$weight
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Weight",
           main = "ChickWeight data")
    }


  })

}



shinyApp(ui, server)
