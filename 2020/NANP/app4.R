ui <- fluidPage(

  # App title ----
  titlePanel("Shiny dairy cow depth image analyzer"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----

      fileInput("file1", "Choose image File",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),

      radioButtons("d",
                   label = "Color space",
                   choices = list("RGB" = 0, "Grayscale" = 4, "HSV" = 1,"L*a*b*" = 2,"XYZ" = 3),
                   selected = 0),


      radioButtons("dd",
                   label = "Image properties",
                   choices = list("Area" = 0, "Centroid" = 1,"Circularity" = 2,"ConvexArea" = 3,"ConvexHull" = 4, "MajorAxisLength" = 5, "MinorAxisLength" = 6, "Orientation" = 4,"Perimeter" = 4, "Depth map" = 4),
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

  # Plot
  output$distPlot <- renderPlot({

  image <- load.image("_Depth_25555.png")
  plot(image)


  })

}



shinyApp(ui, server)
