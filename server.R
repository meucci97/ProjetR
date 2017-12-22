
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$binomPlot <- renderPlot({

    density  <- dbinom(0:input$nBin, input$nBin, input$pBin)
    r <- rbinom(0:input$eBin, input$nBbin, input$pBin)

    plot(0:input$nBin,
         density, 
         type = "l",
         main = "P(X = n)",
         xlab = "Nombre de succès",
         ylab = "Fréquence",
         xlim = c(0,input$nBin)
    )
    
    hist(r
         )

  })

})
