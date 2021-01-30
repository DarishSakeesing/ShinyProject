
library(shinythemes)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)
library(shinymaterial)


# Define UI for application that draws a histogram
shinyUI(
    
    fluidPage(theme = shinytheme('darkly'),
              
              tags$head(
                  # Note the wrapping of the string in HTML()
                  tags$style(HTML("
      card {
        background-color: 'red';
      }"))
              ),
              
              navbarPage(
                  
                  title = 'The EV Revolution',

                  tabPanel('Brief Overview',
                           fluidRow(
                               column(width = 6,

                                   fluidRow(
                                       h2('Types of EV'),
                                       p('Just as there are a variety of technologies available in conventional vehicles, plug-in electric vehicles (also known as electric cars or EVs) have different capabilities that can accommodate different drivers’ needs. A major feature of EVs is that drivers can plug them in to charge from an off-board electric power source. This distinguishes them from hybrid electric vehicles, which supplement an internal combustion engine with battery power but cannot be plugged in.'),
                                       p('There are two basic types of EVs: all-electric vehicles (AEVs) and plug-in hybrid electric vehicles (PHEVs). AEVs include Battery Electric Vehicles (BEVs) and Fuel Cell Electric Vehicles (FCEVs). In addition to charging from the electrical grid, both types are charged in part by regenerative braking, which generates electricity from some of the energy normally lost when braking. Which type of vehicle will fit your lifestyle depends on your needs and driving habits.')
                                       )
                               ),
                               column(width = 6,
                                      img(src = 'https://images.unsplash.com/photo-1593941707874-ef25b8b4a92b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1952&q=80',
                                          height = '40%',
                                          width = '75%')
                               )
                           ),
                           fluidRow(
                               hr()
                           ),
                           tags$div(class = 'card',
                                    p('test')
                                    )
                ),

                  tabPanel('Second'),
                  tabPanel('Third')
              )
    )
)

              
              
              

              
