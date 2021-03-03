
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
library(scales)
#source('human_readeable.r')
#source('studio_connect.r')

salesDF <- read.csv('data/new_data/sales_cleaned.csv')
yoyDF <- read.csv('data/new_data/YoY_Sales.csv')
top_3 <- yoyDF %>% mutate(SALES = Y2012+Y2013+Y2014+Y2015+Y2016+Y2017+Y2018+Y2019) %>% arrange(desc(SALES)) %>% 
    select(MAKE, MODEL, SALES)

specs <- read.csv('data/new_data/car_specs.csv')


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$marketShare <- renderPlot({
        salesDF %>% ggplot(aes(x=Year, y=as.numeric(PctEV))) + geom_col() + ylab('EV as Percentage of Total Car Sales') +
            scale_x_continuous(breaks = seq(2011, 2019, by=1)) + ggtitle('EV Market Share in the United States') + scale_y_continuous(breaks=seq(0, 2, by=0.3))
    })
    
    output$first <- renderInfoBox({
        infoBox(
            value=top_3$MODEL[1], subtitle=format(top_3$SALES[1], nsmall = 0, big.mark = ','), title = top_3$MAKE[1],
            fill=TRUE, icon = icon('trophy', lib='font-awesome'), color = 'orange'
        )
 
    })
    
    output$second <- renderInfoBox({
        infoBox(
            value=top_3$MODEL[2], subtitle=format(top_3$SALES[2], nsmall = 0, big.mark = ','), title = top_3$MAKE[2],
            fill=FALSE, icon = icon('medal', lib='font-awesome'), color = 'light-blue'
        )
        
    })
    
    output$third <- renderInfoBox({
        infoBox(
            value=top_3$MODEL[3], subtitle=format(top_3$SALES[3], nsmall = 0, big.mark = ','), title = top_3$MAKE[3],
            fill=FALSE, icon = icon('award', lib='font-awesome'), color = 'light-blue'
        )
        
    })
    
    output$salesHist <- renderPlot({
        top_n(top_3, 10) %>% ggplot(aes(x=MODEL, y=SALES)) + geom_col(aes(fill=MAKE)) +
            ggtitle('EV Sales by Model and Brand') + 
            scale_y_continuous(labels = label_comma())
    })
    
    output$relationship <- renderPlot({
        if(input$choose_plot == 'Sales vs MSRP') {
            specs %>% ggplot(aes(x=MSRP, y=SALES)) + 
                geom_point(aes(color=MAKE)) + 
                scale_y_continuous(labels=label_comma()) + 
                xlab('MSRP($)') + 
                scale_x_continuous(labels=label_dollar()) + 
                geom_text(aes(label=ifelse(SALES>100000,MODEL,'')), hjust=0.5, vjust=1.5)
        } else if(input$choose_plot == 'Sales vs Range') {
            specs %>% ggplot(aes(x=RANGE, y=SALES)) + 
                geom_point(aes(color=MAKE)) + 
                scale_y_continuous(labels=label_comma()) + 
                xlab('Range(Mi)') + 
                geom_text(aes(label=ifelse(RANGE>250,MODEL,'')), hjust=0.5, vjust=1.5)
        } else {
            specs %>% ggplot(aes(x=RANGE, y=MSRP)) + 
                geom_point(aes(color=SALES)) + 
                scale_y_continuous(labels=label_comma()) + 
                xlab('Range(Mi)') + 
                geom_text(aes(label=ifelse(RANGE>250,MODEL,'')), hjust=0.5, vjust=1.5)
        }
        
    })
    
    output$demand <- renderPlot({
        
        specs %>% ggplot(aes(x=RANGE, y=MSRP)) + 
            geom_point() + 
            scale_y_continuous(labels=label_dollar()) + 
            xlab('Range(Mi)') + 
            geom_text(aes(label=ifelse((RANGE>250 | (MSRP <= 50000 & MSRP >= 30000)),MODEL,'')), hjust=0.5, vjust=1.5) +
            geom_rect(xmin=319, xmax=600, ymax=40000, ymin=0, fill='orange', alpha=0.01)
        
    })
})
