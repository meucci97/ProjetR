
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
      br(),
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
                        value = 0.5),
            
            numericInput("eBin",
                         "Echantillon",
                         min = 1,
                         value = 50)
          ),
          
      
          # Show a plot of the generated distribution
          mainPanel(
            tabsetPanel(
              tabPanel(
                "Graphique",
                plotOutput("binomPlot",
                           width = "100%", 
                           height = "600px"
                )
              ),
              tabPanel(
                "Tableau",
                br(),
                dataTableOutput("binomTab"),
                
                actionButton("exportB", "Exporter données"),
                br(),
                textOutput("exportB")
              )
            )
          )
        )
    ),
    tabPanel(
      "Loi Normale",
      br(),
      sidebarLayout(
        sidebarPanel(
          sliderInput("nNorm",
                       "Nombre d'observation souhaité",
                      min = 50,
                      max = 1000,
                      value = 500),
          
          sliderInput("espNorm",
                      "Espérance",
                      min = 0,
                      max = 100,
                      value = 2),
          
          sliderInput("varNrom",
                      "Ecart Type",
                      min = 0,
                      max = 100,
                      value = 2),
          actionButton("exportN", "Exporter données")
          
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(
            tabPanel(
              "Graphique",
              plotOutput("normPlot",
                         width = "100%", 
                         height = "600px"
              )
            )
          )
        )
      )
    )
  )
))
