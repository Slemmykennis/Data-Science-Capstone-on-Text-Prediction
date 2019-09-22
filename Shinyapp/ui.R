
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
shinyUI(navbarPage("Data Science Capstone Final Project: Prediction Algorithm",
                   tabPanel("Predict",
                            
                            # Sidebar
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("Enter a phrase or multiple words and get the next word prediction"),
                                    textInput("inputString", "Enter a phrase here",value = ""),
                                    br(),
                                    br(),
                                    br(),
                                    br()
                                ),
                                mainPanel(
                                    h2("Predicted Next Word"),
                                    verbatimTextOutput("prediction"),
                                    strong("See what you type here:"),
                                    tags$style(type='text/css', '#textpred {background-color: rgba(0,0,255,0.5); color: white;}'), 
                                    textOutput('textpred'),
                                    br(),
                                    strong("Information about the next word:"),
                                    tags$style(type='text/css', '#textinf {background-color: rgba(0,0,255,0.5); color: black;}'),
                                    textOutput('textinf')
                                )
                            )
                            
                   ),
                   tabPanel("Profile",
                            mainPanel(
                               h4("Author: Kehinde Usman"),
                               br(),
                               h4("Date: September 22, 2019"),
                               br(),
                               h4("Project: Data Science Capstone"),
                               br(),
                               h4("Platform: Coursera"),
                               br(),
                               h4("Institution: John Hopkins University")
                               
                            )
                   )
)
)