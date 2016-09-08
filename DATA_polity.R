####################################################################################################################################################
### Import and Prep Polity IV Data
### HZ - Sep. 2016
####################################################################################################################################################

library(xlsx)

country_list <- read.xlsx2('D:/Dropbox/_Classes/Data/Country Lists.xlsx',sheetIndex=1,stringsAsFactors=F)

polity_data_orig <- read.xlsx2('D:/Dropbox/_Classes/Data/Polity IV/2015/p4v2015.xls',sheetIndex=1,stringsAsFactors=F)

polity_data <- polity_data_orig[c('country','year','polity2')]
polity_data$year <- as.numeric(polity_data$year)
polity_data <- merge(polity_data,country_list[c('polity4','standard')],by.x='country',by.y='polity4',all.x=T,all.y=F)
