
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$binomPlot <- renderPlot({

    p  <- dbinom(0:input$nBin, input$nBin, input$pBin)

    plot(0:input$nBin,
         p, 
         type = "l",
         main = "P(X = n)",
         xlab = "Nombre de succès : n",
         ylab = "Probabilité : p",
         xlim = c(0,input$nBin)
    )

  })

})
