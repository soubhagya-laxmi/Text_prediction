library(shiny)
shinyUI(fluidPage(
  titlePanel("Text Prediction"),
  sidebarLayout(
    sidebarPanel(
      textInput("box1", "Enter a Text:", value = "Text Entered"),
     submitButton("submit")
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Text Entered", br(), h3("Text you have entered:"),textOutput("out1"),
                           
                           h3("Predicted word:"),textOutput("pred1")),
                
                  tabPanel("Overview", br(), h3("Overview:"),textOutput("out2"))
                 
      )
    )
  )
))