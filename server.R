library(AppliedPredictiveModeling)
data(AlzheimerDisease)
data <- predictors
levels(diagnosis) <- list(Control="Control", Alzheimer="Impaired")
data$diagnosis <- diagnosis
library(randomForest)
set.seed(5)
fit <- randomForest(diagnosis~., data=data)
import <- fit$importance
ord_imp <- import[order(import, decreasing=TRUE),]
top10 <- names(ord_imp[1:10])
subset <- data[, names(data) %in% top10]
subset$diagnosis <- diagnosis
new_fit <- randomForest(diagnosis~., data=subset)
library(shiny)
shinyServer(
    function(input, output) {
        output$text1 <- renderText({input$id1})
        output$text2 <- renderText({input$id2})
        output$text3 <- renderText({input$id3})
        output$text4 <- renderText({input$id4})
        output$text5 <- renderText({input$id5})
        output$text6 <- renderText({input$id6})
        output$text7 <- renderText({input$id7})
        output$text8 <- renderText({input$id8})
        output$text9 <- renderText({input$id9})
        output$text10 <- renderText({input$id10})
        output$prediction <- renderPrint({predict(new_fit, matrix(c(input$id1, input$id2, input$id3, input$id4, input$id5, input$id6, input$id7, input$id8, input$id9, input$id10), nrow=1, ncol=10, dimnames=list("", c("Ab_42", "tau", "p_tau", "VEGF", "MMP10", "Cystatin_C", "GRO_alpha", "PAI_1", "NT_proBNP", "Pancreatic_polypeptide"))))})
    }
)