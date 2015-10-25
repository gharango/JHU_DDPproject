
# Developing Data Products Project

## Goal
-    Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
-    Deploy the application on Rstudio's shiny server
-    Share the application link by pasting it into the text box below
-    Share your server.R and ui.R code on github

## Contents

### The application must include the following

- Some form of input (widget: textbox, radio button, checkbox, ...)
- Some operation on the ui input in sever.R
- Some reactive output displayed as a result of server calculations
- You must also include enough documentation so that a novice user could use your application.
- The documentation should be at the Shiny website itself. Do not post to an external link.

## Application features

### Title: Pollutant values for ozone and PM25 around US cities in 2013

This application allows you to display a U.S map with two cities, there is an example below.

The map is displayed on another window.

When your mouse hovers in the circle signaling the city location you will be able to read the average values of ozone and the particle pollution in the air (PM2.5).

The data used is an extract of from annual_all_2013.csv, from

https://github.com/DataScienceSpecialization/courses/tree/master/09_DevelopingDataProducts/yhat"),

The average is computed with all the information about places inside the radius value.

To disable the display of a map each time a city or a radius is changed, there is check box (render choice),initially unchecked.

When the box is checked, the map is displayed, and it will be the case any time that a change is done until you uncheck the box again

### Files

- global.R (data manipulation of objects includes in both ui.R and server.R
- server.R (shiny server part)
- ui.R (shiny ui part)
- helpers.R (display and computation functions)
- pollutant.csv (extract containing just data about ozone and PM 2.5)
- www/MapSample.JPG (graphic showing the result of the google chart used via the googleVis package)





