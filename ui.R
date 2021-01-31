
library(shinythemes)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)
library(shinymaterial)


# Define UI for application that draws a histogram
shinyUI(
    
    fluidPage(theme =shinytheme('superhero'),
              
              navbarPage(
                  
                  title = 'The EV Revolution',

                  tabPanel('Brief Overview',
                           fluidRow(
                               column(width = 8,

                                   fluidRow(
                                       h2('Types of EV'),
                                       p('Just as there are a variety of technologies available in conventional vehicles, plug-in electric vehicles (also known as electric cars or 
                                         EVs) have different capabilities that can accommodate different drivers’ needs. A major feature of EVs is that drivers can plug them in 
                                         to charge from an off-board electric power source. This distinguishes them from hybrid electric vehicles, which supplement an internal 
                                         combustion engine with battery power but cannot be plugged in.'),
                                       p('There are two basic types of EVs: all-electric vehicles (AEVs) and plug-in hybrid electric vehicles (PHEVs). AEVs include Battery Electric 
                                         Vehicles (BEVs) and Fuel Cell Electric Vehicles (FCEVs). In addition to charging from the electrical grid, both types are charged in part by
                                         regenerative braking, which generates electricity from some of the energy normally lost when braking. Which type of vehicle will fit your 
                                         lifestyle depends on your needs and driving habits.')
                                       )
                               ),
                               column(width = 4,
                                      img(src = 'https://images.unsplash.com/photo-1593941707874-ef25b8b4a92b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&aut
                                          o=format&fit=crop&w=1952&q=80',
                                          height = '40%',
                                          width = '75%')
                               )
                           ),
                           fluidRow(
                               hr()
                           ),
                           
                           fluidRow(
                             h4('Popularity of the two types of EV')
                           ),
                           
                           fluidRow(
                             column(9, 
                                    conditionalPanel(
                                      condition = "input.choose == 'Cumulative Sales'", plotOutput('cumPlot')),
                                    conditionalPanel(
                                      condition = "input.choose == 'Total Sales'", plotOutput('totalPlot')
                                    )
                                      
                                    ),
                             column(3,
                                     radioButtons('choose', label = 'Choose Plot', choices = c('Cumulative Sales', 'Total Sales'),
                                               selected = 'Cumulative Sales')
                                    )
                           )
                ),
                

                  tabPanel('Industry Leaders',
                           
                           fluidRow(
                             h1('Most Successful Automakers by Sale Numbers')
                           ),
                           
                           fluidRow(
                             numericInput('n', 'Top n manufacturers', n),
                             plotOutput('salesGraph')
                           )
                           
                           
                           ),
                  tabPanel('Third')
              )
    )
)

              
              
              

              
