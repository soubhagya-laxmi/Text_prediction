library(shiny)

library(base)
Two_word <- readRDS("Two_word.rds")
Three_word <- readRDS("Three_word.rds")
Four_word <- readRDS("Four_word.rds")


    shinyServer(function(input, output) {
      
     wordPrediction <- reactive({
      test_string <- input$box1
      test_string <- tolower(test_string)
      # Count the no of words
      word_count <- vapply(strsplit(test_string, "\\W+"), length, integer(1))
      
      if (word_count == 1)
      {
        n <- grep(test_string,Two_word$word)
      Two_word[n,-2]
      }
      
      if (word_count == 2)
      {
        n <- grep(test_string,Three_word$word)
       Three_word[n,-2]
      }
      
      if (word_count == 3)
      {
        n <- grep(test_string,Four_word$word)
        Four_word[n,-2]
      }

       # wordPrediction <- pred


     })
  
  output$out1 <- renderText(input$box1)
  output$pred1 <- renderPrint(wordPrediction())
  
  output$out2 <- renderText("The goal of this exercise is to create a product to
                             highlight the prediction algorithm that you have built and to 
                             provide an interface that can be accessed by others.")
})
