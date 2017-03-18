
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
data <- read.csv("data.csv")

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    print(input$part)
    range <- seq(input$part[1],input$part[2])
    temp <- data[range,]
    plot <- ggplot()
    if(input$x!="Observer"){
      finalPlot <- plot + geom_point(data = data[range,],aes_string(x = input$x,y = input$y,color="Observer"))
    } else {
      finalPlot <- plot + geom_bar(data=data[range,],aes(factor(Observer)))
    }

    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    return(finalPlot)

  })

})
