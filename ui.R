library(leaflet)
library(ShinyDash)
shinyUI(fluidPage(
  tags$head(tags$link(rel='stylesheet', type='text/css', href='styles.css')),
  leafletMap(
    "map", "100%", 600,
    initialTileLayer = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
    initialTileLayerAttribution = HTML('Maps by <a href="http://www.mapbox.com/">Mapbox</a>'),
    options=list(
      center = c(47.60, -122.33),
      zoom = 8,
      maxBounds = list(list(45, -125), list(50, -117))
    )
  ),
  fluidRow(
    column(8, offset=3,
           h2('Rent Price History of Washington State'),
           htmlWidgetOutput(
             outputId = 'desc',
             HTML(paste(
               'The map is centered at <span id="lat"></span>, <span id="lng"></span>',
               'with a zoom level of <span id="zoom"></span>.<br/>'
             ))
           )
    )
  ),
  hr(),
  fluidRow(
    column(3,
           selectInput('year', 'Year', c(2011:2015), 2014)
    ),
    column(4,
           h4('Selected Neighborhood')
           #tableOutput('data')
    ),
    column(5,
           h4(id='cityTimeSeriesLabel', class='shiny-text-output')
           #plotOutput('cityTimeSeries', width='100%', height='250px')
    )
  )
))