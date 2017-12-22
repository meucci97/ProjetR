
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$binomPlot <- renderPlot({

    density  <- dbinom(0:input$nBin, input$nBin, input$pBin)
    r <- rbinom(input$eBin, input$nBin, input$pBin)

    hist(r, 
         probability = TRUE, 
         breaks = c(0:input$nBin),
         main = paste(
           "Histogramme d'une loi binomiale de paramètres \n (n,p) = (",
           input$nBin,",",input$pBin,
           ") appliquée sur un échantillon de ",input$eBin, " individus"),
         col = "lightblue"
         )
    lines(0:input$nBin,
          density, 
          col = "red",
          lwd = 2 
          )
  })
  
  output$binomTab <- renderDataTable({
    r <- rbinom(input$eBin, input$nBin, input$pBin)
    tab <- table(Succès = r)
    data.frame(tab)
  })

})
