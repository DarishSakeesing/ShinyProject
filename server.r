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
library(tidyr)
source('human_readeable.r')
source('studio_connect.r')

cumDF <- read.csv('data/cumSales.csv')
totalDF <- read.csv('data/totalSales.csv')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$cumPlot <- renderPlot({
       
        cumDF %>% na.omit(cumDF) %>%
            mutate(Date = as.Date(Date)) %>%
            pivot_longer(cols = c('PHEV', 'BEV'), names_to = 'Type', values_to = 'Sales') %>%
            ggplot(aes(x= Date, y = Sales, color = Type)) + geom_col() +
            theme_dark() + abline(h = 1000000, col = 'red')


    })
    
    output$totalPlot <- renderPlot({
        
        totalDF %>% 
            mutate(Date = as.Date(Date, '%m/%d/%y')) %>%
            pivot_longer(cols = c('Sales_PHEV', 'Sales_BEV'), names_to = 'Type', values_to = 'Sales') %>%
            ggplot(aes(x= Date, y = Sales, color = Type)) + geom_col() +
            theme_dark()
    

    })
    
    output$salesGraph <- renderPlot({
            topdf[1:input$n,] %>%
            mutate(Rank = as.factor(rank(-TotalSales))) %>%
            ggplot(aes(x = Make, y = TotalSales, fill = Rank)) + 
            geom_col() + scale_y_continuous(labels = human_num)+
            theme_dark()
    }
        
    )
    
    output$top10models <- renderPlot({
        
        testdf[1:input$x,] %>% ggplot(aes(x = Model, y = TotalSales, fill=Make)) +
            geom_col() + theme_dark()
        
    }
        
    )
    
    output$currentMarket <- renderPlot({
        top10models %>% ggplot(aes(x = Range, y=Price, color=Make)) + geom_point() +geom_label(aes(label=Model), vjust = 1) +
            annotate('text', x = 319, y = 36000, label='Sweet Spot', color = 'orange') +  ylab('Price($)') + xlab('Range(mi)') + theme_dark()
        
    })
})
