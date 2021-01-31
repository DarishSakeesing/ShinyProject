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



salesdf <- testdf %>% group_by(Make, Model) %>% summarise(TotalSales = sum(Sales))

salesdf <- salesdf[order(salesdf$TotalSales, decreasing = T),]

topdf <- salesdf %>% group_by(Make) %>% 
  summarise(TotalSales = sum(TotalSales))

topdf <- topdf[order(topdf$TotalSales, decreasing = T),]
