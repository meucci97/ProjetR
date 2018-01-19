
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  N <- 1 

  observeEvent(input$exportB, {
    tab <- table(Succes = B)
    data <- data.frame(t(tab))
    write.table(
      x = data, 
      file = "./loi_binomiale.txt",
      append = FALSE, 
      sep = " ", 
      dec = ".",
      row.names = TRUE, 
      col.names = NA
      )
    output$exportB <- renderText({ 
      "Export terminé !"
    })
  })
  
  observeEvent(input$exportN, {
    tab <- table(Succes = N)
    data <- data.frame(t(tab))
    write.table(
      x = data, 
      file = "./loi_normale.txt",
      append = FALSE, 
      sep = " ", 
      dec = ".",
      row.names = TRUE, 
      col.names = NA
    )
  })

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
    B <<- rbinom(input$eBin, input$nBin, input$pBin)
    tab <- table(Succes = B)
    data.frame(tab)
  })

  
  
  output$normPlot <- renderPlot({
    
    density  <- dnorm(-input$nNorm:input$nNorm, input$espNorm, input$varNrom)
    r <- rnorm(0:input$nNorm, input$espNorm, input$varNrom)
    N <<- r
    
    hist(r, 
         probability = TRUE, 
         main = paste(
           "Histogramme d'une loi normale de paramètres \n (µ, σ) = (",
           input$espNorm,",",input$varNrom,
           ") appliquée sur un nombre d'observation de ",input$nNorm, " "),
         col = "lightblue"
    )
    lines(-input$nNorm:input$nNorm,
          density, 
          col = "red",
          lwd = 2
    )
  })
})
