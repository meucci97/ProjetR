
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Lois de probabilité"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    tabPanel(
      "Loi Binomiale",
        sidebarLayout(
          sidebarPanel(
            
            numericInput("nBin",
                         "Nombre de tentatives",
                         min = 1,
                         value = 20),
            
            sliderInput("pBin",
                        "Probabilté de succès",
                        min = 0,
                        max = 1,
                        value = 0.5)
          ),
          
      
          # Show a plot of the generated distribution
          mainPanel(
            plotOutput("binomPlot",
                       width = "100%", 
                       height = "600px"
            )
          )
        )
    ),
    tabPanel(
      "Loi Normale",
      sidebarLayout(
        sidebarPanel(
          
          
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
          
        )
      )
    )
  )
))
