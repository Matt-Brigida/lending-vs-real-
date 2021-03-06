## Get and display exoplanet data ----
## apps pulls data twice, fix to only require one ----
## This is a test commit

library(DT)
library(threejs)

ui <- bootstrapPage(
  tabsetPanel(type = "tabs",
              tabPanel("Lending", DT::dataTableOutput("datatable1")),
              tabPanel("Real", DT::dataTableOutput("datatable2")),
              tabPanel("Real plot", threejs::scatterplotThreeOutput("plot1")),
              tabPanel("Lending plot", threejs::scatterplotThreeOutput("plot2"))
  )
)

server <- function(input, output){
  
  output$datatable1 <- DT::renderDataTable({ 

      ## you may want to read this from your github like here: http://stackoverflow.com/questions/14441729/read-a-csv-from-github-into-r
      ## this way the app will run whereever it is (not just on your system with the below filepath
    lending <- read.csv("E:/college/aFALL 2016/RStudio project/lending.csv", header = TRUE, stringsAsFactors = FALSE)

    ## column names
    # names(data1) <- c("Primary ID", "Binary Flag", "Planetary Mass", "Radius", "Period", "Axis", "Eccentricity", "Periastron", "Longitude" ,"Ascending Node", "Inclination", "Temp", "Age", "Discovery Method" ,"Discovery Year", "Last Updated", "Right Ascension", "Declination", "Distance from Sun (parsec)", "Host Start Mass", "Host Star Radius", "HS Metallicity", "HS temp" ,"HS age")
    
    ## display data with datatable from DT package ----
    
    DT::datatable(lending, options = list(pageLength = 15))
    
  })
    #names(data1) <- c("Primary ID", "Binary Flag", "planetary Mass", "Radius", "Period", "Axis", "Eccentricity", "Periastron", "Longitude", "Ascending Node", "Inclination", "Temp", "Age", "Discovery Method" ,"Discovery Year", "Last Updated", "Right Ascension", "Declination", "Distance from Sun (parsec)", "Host Start Mass", "Host Star Radius", "HS Metallicity", "HS temp" ,"HS age")
  
  angola <- lending[lending$Country.Name == "Angola", -c(1:4, dim(real)[2])]
  argentina <- lending[lending$Country.Name == "Argentina", -c(1:4, dim(real)[2])]
  armenia <- lending[lending$Country.Name == "Armenia", -c(1:4, dim(real)[2])]
  #     
  #     data.three <- data1[,c('Planetary Mass', 'Discovery Year', 'Distance from Sun (parsec)')]
  #     data.three[,1] <- log(data.three[,1])
  #     data.three[,3] <- log(data.three[,3])
  #     data.three2 <- data.three[complete.cases(data.three),]
  #     
  #     ## order by year
  #     data.three2 <- data.three2[ order(-data.three2[,2]),]
  data.three2 <- matrix(cbind(as.numeric(angola), as.numeric(argentina), as.numeric(armenia)), nrow = length(angola), ncol = 3)
  scatterplot3js(x = data.three2, color = rainbow(length(data.three2[,2])), label.margin = TRUE, flip.y = TRUE)
  
  output$datatable2 <- DT::renderDataTable({ 
    
    real <- read.csv("E:/college/aFALL 2016/RStudio project/real.csv", header = TRUE, stringsAsFactors = FALSE)


    ## column names
    # names(data1) <- c("Primary ID", "Binary Flag", "Planetary Mass", "Radius", "Period", "Axis", "Eccentricity", "Periastron", "Longitude" ,"Ascending Node", "Inclination", "Temp", "Age", "Discovery Method" ,"Discovery Year", "Last Updated", "Right Ascension", "Declination", "Distance from Sun (parsec)", "Host Start Mass", "Host Star Radius", "HS Metallicity", "HS temp" ,"HS age")
    
    ## display data with datatable from DT package ----
    
    DT::datatable(real, options = list(pageLength = 15))
   
  })
  
  output$plot1 <- threejs::renderScatterplotThree({

    
    # names(data1) <- c("Primary ID", "Binary Flag", "Planetary Mass", "Radius", "Period", "Axis", "Eccentricity", "Periastron", "Longitude" ,"Ascending Node", "Inclination", "Temp", "Age", "Discovery Method" ,"Discovery Year", "Last Updated", "Right Ascension", "Declination", "Distance from Sun (parsec)", "Host Start Mass", "Host Star Radius", "HS Metallicity", "HS temp" ,"HS age")
    
    angola <- real[real$Country.Name == "Angola", -c(1:4, dim(real)[2])]
    argentina <- real[real$Country.Name == "Argentina", -c(1:4, dim(real)[2])]
    armenia <- real[real$Country.Name == "Armenia", -c(1:4, dim(real)[2])]
    #     
    #     data.three <- data1[,c('Planetary Mass', 'Discovery Year', 'Distance from Sun (parsec)')]
    #     data.three[,1] <- log(data.three[,1])
    #     data.three[,3] <- log(data.three[,3])
    #     data.three2 <- data.three[complete.cases(data.three),]
    #     
    #     ## order by year
    #     data.three2 <- data.three2[ order(-data.three2[,2]),]
    data.three2 <- matrix(cbind(as.numeric(angola), as.numeric(argentina), as.numeric(armenia)), nrow = length(angola), ncol = 3)
    scatterplot3js(x = data.three2, color = rainbow(length(data.three2[,2])), label.margin = TRUE, flip.y = TRUE)
    
  })

 
  ouput$plot2 <- threejs::renderScatterplotThree({

    # names(data1) <- c("Primary ID", "Binary Flag", "Planetary Mass", "Radius", "Period", "Axis", "Eccentricity", "Periastron", "Longitude" ,"Ascending Node", "Inclination", "Temp", "Age", "Discovery Method" ,"Discovery Year", "Last Updated", "Right Ascension", "Declination", "Distance from Sun (parsec)", "Host Start Mass", "Host Star Radius", "HS Metallicity", "HS temp" ,"HS age")
    
  angola <- lending[lending$Country.Name == "Angola", -c(1:4, dim(real)[2])]
  argentina <- lending[lending$Country.Name == "Argentina", -c(1:4, dim(real)[2])]
  armenia <- lending[lending$Country.Name == "Armenia", -c(1:4, dim(real)[2])]
  #     
  #     data.three <- data1[,c('Planetary Mass', 'Discovery Year', 'Distance from Sun (parsec)')]
  #     data.three[,1] <- log(data.three[,1])
  #     data.three[,3] <- log(data.three[,3])
  #     data.three2 <- data.three[complete.cases(data.three),]
  #     
  #     ## order by year
  #     data.three2 <- data.three2[ order(-data.three2[,2]),]
  data.three2 <- matrix(cbind(as.numeric(angola), as.numeric(argentina), as.numeric(armenia)), nrow = length(angola), ncol = 3)
  scatterplot3js(x = data.three2, color = rainbow(length(data.three2[,2])), label.margin = TRUE, flip.y = TRUE)
 
  })
}
shinyApp(ui = ui, server = server)
