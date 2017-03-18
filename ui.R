
library(shiny)
library(plotly)
shinyUI(fluidPage(

  # Application title
  titlePanel("Visualisation of Avian Habitat Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      ## slider input for slicing dataset
      sliderInput("part",
                  "Number of observations from the dataset:",
                  min = 1,
                  max = 1070,
                  value = c(1,1070)),
      ## drop down input for x axis
      selectInput("x", 
                  label = "Choose x axis for the graph",
                  choices = c("Observer", "Subpoint",
                              "VOR", "PDB","DBHt","PW","WHt","PE","EHt",
                              "PA","AHt","PH","HHt","PL","LHt","PB"),
                  selected = "Observer"),
      ## drop down input for y axis
      selectInput("y", 
                  label = "Choose y axis for the graph",
                  choices = c( "Subpoint",
                              "VOR", "PDB","DBHt","PW","WHt","PE","EHt",
                              "PA","AHt","PH","HHt","PL","LHt","PB"),
                  selected = "Subpoint"),
      ## drop down input for z axis
      selectInput("z", 
                  label = "Choose z axis in case of 3-d graph",
                  choices = c( "Subpoint",
                               "VOR", "PDB","DBHt","PW","WHt","PE","EHt",
                               "PA","AHt","PH","HHt","PL","LHt","PB"),
                  selected = "Subpoint")
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
      tabPanel("Plot1",plotlyOutput("distPlot")),
      tabPanel("Plot2",plotlyOutput("lineplot")),
      tabPanel("Plot3",plotlyOutput("threedplot"))
    )
    )
  )
))
