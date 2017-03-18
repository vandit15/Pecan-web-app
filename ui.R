
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("part",
                  "Number of observations from the dataset:",
                  min = 1,
                  max = 1070,
                  value = c(1,1070)),
      selectInput("x", 
                  label = "Choose x axis for the graph",
                  choices = c("Observer", "Subpoint",
                              "VOR", "PDB","DBHt","PW","WHt","PE","EHt",
                              "PA","AHt","PH","HHt","PL","LHt","PB"),
                  selected = "Observer"),
      selectInput("y", 
                  label = "Choose y axis for the graph",
                  choices = c( "Subpoint",
                              "VOR", "PDB","DBHt","PW","WHt","PE","EHt",
                              "PA","AHt","PH","HHt","PL","LHt","PB"),
                  selected = "Subpoint")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
