
library(shinythemes)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)
library(shinymaterial)
library(rsconnect)


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
                             column(4,
                                    HTML(
                                      '<div class="card text-white bg-warning mb-3" style="max-width: 20rem;padding: 5%">
                                        <div class="card-header">1st</div>
                                        <div class="card-body">
                                        <h4 class="card-title">TESLA</h4>
                                        <p class="card-text">Founded in July 2003 as Tesla Motors, the company\'s name is 
                                        a tribute to inventor and electrical engineer Nikola Tesla. Elon Musk, who 
                                        contributed most of the funding in the early days, has served as CEO since 2008.</p>
                                        </div>
                                      </div>')
                                    ),
                             column(4,
                                    HTML(
                                      '<div style="max-width: 20rem; background-color:#C0C0C0; padding: 5%">
                                        <div class="card-header">2nd</div>
                                        <div class="card-body">
                                        <h4 class="card-title">CHEVROLET</h4>
                                        <p class="card-text">Chevrolet, colloquially referred to as Chevy is an American automobile division of the American manufacturer General Motors (GM). 
                                        Louis Chevrolet started the company on November 3, 1911.</p>
                                        </div>
                                      </div>')
                                    ),
                             column(4,
                                    HTML(
                                      '<div style="max-width: 20rem; background-color:#CD7F32; padding: 5%">
                                        <div class="card-header">3rd</div>
                                        <div class="card-body">
                                        <h4 class="card-title">NISSAN</h4>
                                        <p class="card-text">The Nissan Motor Company, trading as the Nissan Motor Corporation, is a Japanese multinational 
                                        automobile manufacturer headquartered in Nishi-ku, Yokohama, Japan.</p>
                                        </div>
                                      </div>')
                                    )
                           ),
                           fluidRow(
                             hr()
                           ),
                           
                           fluidRow(
                             numericInput('n', 'Top n manufacturers', n),
                             plotOutput('salesGraph')
                           ),
                           
                           fluidRow(
                             hr()
                           ),
                           
                           fluidRow(
                             numericInput('x', 'Top n models', n),
                             plotOutput('top10models')
                           )
                           
                           
                           ),
                  tabPanel('Analyzing Demand',
                           titlePanel('What do consumers want?'),
                           
                           p('Despite the strides made by automakers, EV sales account for about 1% of the market share. 
                             Could it be that automakers just do not understand what the market want?'),
                           p('According to a survey of 1000 participants, the specs for an EV to be attractive are
                             at least 319 miles on battery and not higher than $36,000'),
                           
                           hr(),
                           
                           fluidRow(
                             h4('Current Market'),
                             plotOutput('currentMarket')
                           ),
                           fluidRow(
                             p('Tesla Model 3 is the closest to the sweet spot and therefore it is not surprising that
                               it is the highest selling EV car. In my opinion, the market is underserved and therefore
                               causing a slow adoption rate.')
                           )
                           )
                
              )
    )
)

              
              
              

              
