library(fields)
library(googleVis)

source("helpers.R")

shinyServer(
        function(input, output) {
#		if(input$render[1]==0) return()
#        render<- reactive({input$render})         
#	if (render() == 0) 
#                return()
       output$ocity1 <- renderPrint({input$city1})
       output$odistance1 <- renderPrint({input$distance1 })
        output$ocity2 <- renderPrint({input$city2})
        output$odistance2 <- renderPrint({input$distance2 })
#         r<- googleVisChart(pollutant(input$distance1,input$city1,input$distance2,input$city2))
                               
        r<- reactive({ googleVisChart(pollutant(input$distance1,input$city1,input$distance2,input$city2))
                       })
					   
		render <- reactive({
         if (!input$render) return()
          r()
       })

	    output$usaPollutant <- renderPlot({
		googleVisPlot(render())})
 #       googleVisPlot(r())})
        }
	)
