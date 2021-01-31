#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

cumDF <- read.csv('data/cumSales.csv')
totalDF <- read.csv('data/totalSales.csv')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$cumPlot <- renderPlot({
       
        cumDF %>% na.omit(cumDF) %>%
            mutate(Date = as.Date(Date)) %>%
            pivot_longer(cols = c('PHEV', 'BEV'), names_to = 'Type', values_to = 'Sales') %>%
            ggplot(aes(x= Date, y = Sales, color = Type)) + geom_col() +
            theme_dark()


    })
    
    output$totalPlot <- renderPlot({
        
        totalDF %>% 
            mutate(Date = as.Date(Date, '%m/%d/%y')) %>%
            pivot_longer(cols = c('Sales_PHEV', 'Sales_BEV'), names_to = 'Type', values_to = 'Sales') %>%
            ggplot(aes(x= Date, y = Sales, color = Type)) + geom_col() +
            theme_dark()
    

    })
})
