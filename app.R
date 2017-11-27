#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Shiny Debugging Data"),
   

   sidebarLayout(
      sidebarPanel(
         selectInput("variable", "Selection:",
                     c("Installed Packages" = "installedPackages",
                       "Library Paths" = "libPaths"))
      ),
      
      

      mainPanel(
         tableOutput("distPlot")
      )
   )
)


server <- function(input, output) {
   
  
  
   output$distPlot <- renderTable({
     
     if(input$variable == 'installedPackages') {
      returnData = installed.packages() 
     } else if (input$variable == 'libPaths') {
       returnData <- as.data.frame(.libPaths() )
     }
      
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

