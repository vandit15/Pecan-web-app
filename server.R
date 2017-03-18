
## loading libraries
library(shiny)
library(ggplot2)
library(plotly)

## load data
data <- read.csv("data.csv")

## main server function
shinyServer(function(input, output) {

  ## function for the plot on first tab
  output$distPlot <- renderPlotly({
    ## range of values from dataset taken as slider input
    range <- seq(input$part[1],input$part[2])
    temp <- data[range,]
    
    ## if x axis is not given to be observer
    if(input$x!="Observer"){
      ##basic plot structure
      plot <- ggplot()
      # adding scatter plot with given x and y axis
      p <- plot + geom_point(data = data[range,],aes_string(x = input$x,y = input$y,color="Observer"),show.legend=TRUE,size=3)
      #aading layer of plotly
      finalPlot <- ggplotly(p)
    } else {
      # plotting basic plot structure with aesthetics and data
      plot <- ggplot(data=data[range,],aes_string(x = "Observer",y = input$y),fill = "red",show.legend = TRUE)
      # building the boxplot
      finalPlot <- plot + geom_boxplot(varwidth = T)
      ## adding layer of plotly
      finalPlot <- ggplotly(finalPlot)
    }
    return(finalPlot)

  })
  
  
  ## function for the plot on the seconf tab
  output$lineplot <- renderPlotly({
   ## range of values from dataset taken as slider input
   range <- seq(input$part[1],input$part[2])
   ## case when input on x-axis is not observer
   if(input$x!="Observer"){
     # basic plot structure
     plot <- ggplot()
     # adding lineplot to the basic structre
     
     finalPlot <- plot + geom_line(data = data[range,],aes_string(x = input$x,y = input$y,color = "Observer"),show.legend=TRUE)
     ## adding layer of plotly
     finalPlot <- ggplotly(finalPlot)  
     } else {
     # plotting basic structure and mention data which is going to be inherited
     plot <- ggplot(data = data[range,],aes_string(x = input$y))
     # building a density plot
     finalPlot <- plot + geom_density(aes(fill = factor(Observer)),alpha=0.8)
     ## ading layer of plotly
     finalPlot <- ggplotly(finalPlot)
   }
   return(finalPlot)
  })
  
  
  ## function for the plot on the seconf tab
  output$threedplot <- renderPlotly({
    ## range of values from dataset taken as slider input
    range <- seq(input$part[1],input$part[2])
    ## case when input on x-axis is not observer
    #if(input$x!="Observer"){
    finalPlot <- plot_ly(x = data[range,input$x],y = data[range,input$y],z = data[range,input$z],color = data[range,'Observer']) %>%
      layout(title = "3-d representation",
             scene = list(
               xaxis = list(title= input$x),
               yaxis = list(title= input$y),
               zaxis = list(title= input$z)
             ))
    return(finalPlot)
  })

})
