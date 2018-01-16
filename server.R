
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
    tab <- table(Succes = r)
    data.frame(tab)
  })

  
  
  output$normPlot <- renderPlot({
    
    density  <- rnorm(0:input$nNorm, input$espNorm, input$varNrom)
    r <- rnorm(0:input$nNorm, input$espNorm, input$varNrom)
    
    hist(density, 
         probability = TRUE, 
         main = paste(
           "Histogramme d'une loi normale de paramètres \n (µ, σ) = (",
           input$espNorm,",",input$varNrom,
           ") appliquée sur un nombre d'observation souhaité de ",input$nNorm, " "),
         col = "lightblue"
    )
    lines(0:input$nNorm,
          r, 
          col = "red",
          lwd = 1
    )
  })
})
