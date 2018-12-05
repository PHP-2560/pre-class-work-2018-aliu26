install.packages("shiny", repos = "https://cran.rstudio.com")
library(shiny)
ui <- fluidPage(
  titlePanel("Calculating P-value from Standard Normal Statistic"), #title 
  sidebarLayout(
    sidebarPanel(
      helpText("Type in a z value to find the corresponding p value"), #description of what to do
      numericInput(inputId = "zvalue", label = "z value", 
                   value = 0, step=0.1)), #assigns default value to 0 and each step interval to 0.1
    mainPanel("The corresponding p value is", textOutput("pvalue")) #output text 
    )
  )


server <- function(input,output){
  output$pvalue <- reactive({pnorm(input$zvalue)}) #turns the z value to p value 
}

shinyApp(ui = ui, server = server) 
