library(dplyr)
library(stringr)
library(ggplot2)


cleaned_df <- read.csv('data/cleaned_data.csv')

testdf <- cleaned_df %>%
  mutate(Sales = gsub(',', '', cleaned_df$Sales)) %>%
  mutate(Sales = as.numeric(Sales)) %>%
  na.omit(cleaned_df)

testdf$Model <- str_replace(testdf$Model, '\\*', '')
testdf$Model <- toupper(testdf$Model)
testdf$Model <- str_trim(testdf$Model)



salesdf <- testdf %>% group_by(Make) %>% dplyr::summarise(TotalSales = sum(Sales))

salesdf <- salesdf[order(salesdf$TotalSales, decreasing = T),]

topdf <- salesdf %>% group_by(Make) %>% 
  dplyr::summarise(TotalSales = sum(TotalSales))

topdf <- topdf[order(topdf$TotalSales, decreasing = T),]

n<- 3

testdf <- testdf %>% group_by(Make, Model) %>% dplyr::summarise(TotalSales = sum(Sales))

testdf <- testdf[order(testdf$TotalSales, decreasing = T), ]

top10models <- testdf[1:10,]

r <- c(353, 402, 53, 180, 371, 25, 26, 259, 11, 20)
p <- c(37990, 69420, 20157, 31620, 79990, 28220, 37000, 36500, NA, 27120)


top10models$Range <- r
top10models$Price <- p





