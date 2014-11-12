library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Alzheimer's Disease Predictor"),
    sidebarPanel(
        h3('Input Characteristics'),
        numericInput('id1', 'Ab 42', 0, min = -10, max = 30, step = 0.1),
        numericInput('id2', 'tau', 0, min = -10, max = 30, step = 0.1),
        numericInput('id3', 'p tau', 0, min = -10, max = 30, step = 0.1),
        numericInput('id4', 'VEGF', 0, min = -10, max = 30, step = 0.1),
        numericInput('id5', 'MMP10', 0, min = -10, max = 30, step = 0.1),
        numericInput('id6', 'Cystatin C', 0, min = -10, max = 30, step = 0.1),
        numericInput('id7', 'GRO alpha', 0, min = -10, max = 30, step = 0.1),
        numericInput('id8', 'PAI 1', 0, min = -10, max = 30, step = 0.1),
        numericInput('id9', 'NT proBNP', 0, min = -10, max = 30, step = 0.1),
        numericInput('id10', 'Pancreatic polypeptide', 0, min = 30, max = 2, step = 0.1)
    ),
    mainPanel(
        h3('Prediction'),
        h4('Based on your measurements:'),
        textOutput("text1"),
        textOutput("text2"),
        textOutput("text3"),
        textOutput("text4"),
        textOutput("text5"),
        textOutput("text6"),
        textOutput("text7"),
        textOutput("text8"),
        textOutput("text9"),
        textOutput("text10"),
        h4('Your patient is:'),
        textOutput("prediction")
    )
))