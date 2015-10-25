shinyUI(fluidPage(
  titlePanel("Pollutant values for ozone and PM25 around US cities in 2013"),
  sidebarLayout(
        sidebarPanel("Cities and radious", width = 4,
		fluidRow(
	        column(6,selectInput("city1", "city", choices = ordCities)),
	        column(4,selectInput("distance1", "distance", choices = c(10, 20, 50, 80)))
			),
		fluidRow(
	        column(6,selectInput("city2", "city", choices = ordCities[-1])),
	        column(4,selectInput("distance2", "distance", choices = c(10, 20, 50, 80)))
			),
		fluidRow(
		    #column(3,actionButton("render","Render choice"))
		   column(3,checkboxInput("render", label = "render choice", value = F))
		 )
),
   mainPanel( h3("Help and display panel"), width=5,
       tags$style(type="text/css",
      ".shiny-output-error { visibility: hidden; }",
      ".shiny-output-error:before { visibility: hidden; }"),
	fluidRow(
         h5("This application allows you to display a U.S map with two cities, there is an example below."),
		 h4("The map is displayed on another window"),
         h5("When your mouse hovers in the circle signaling the city location you will be able",
         "to read the average values of ozone and the particle pollution in the air (PM2.5)."),
		h5("The data used is an extract of from annual_all_2013.csv"),
       a("09_DevelopingDataProducts",href="https://github.com/DataScienceSpecialization/courses/tree/master/09_DevelopingDataProducts/yhat"),
       h5("The average is computed with all the information about places inside the radius value."),
		h5( "To disable the display of a map each time a city or a radius is changed, there is check box (render choice),initially unchecked.",
		 "When the box is checked, the map is displayed, and it will be the case any time that a change is done until you uncheck the box again"),   
		 img(src = "MapSample.JPG", height = 220, width = 350)),
		 h5("If the application does not display the map, you can run it from R", "It requires package shiny"),
		 h4("runGitHub( "JHU_DDPproject", "gharango")"),
		 
	fluidRow(
	column(8,
         textOutput("ocity1")
         ,textOutput("ocity2")
         ,textOutput("odistance1")
         ,textOutput("odistance2")
	 ,plotOutput("usaPollutant")
	)
   ))
  )
))
