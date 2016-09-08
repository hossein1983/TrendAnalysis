####################################################################################################################################################
### Import and Prep Maddison Data
### HZ - Sep. 2016
####################################################################################################################################################

library(xlsx)
library(tidyr)
country_list <- read.xlsx2('D:/Dropbox/_Classes/Data/Country Lists.xlsx',sheetIndex=1,stringsAsFactors=F)

maddison_data_orig <- read.csv('D:/Dropbox/_Classes/Data/Maddison/GDPperCapita.csv')

maddison_data <- maddison_data_orig %>% gather(year,gdpPerCapita,X1:X2008)
maddison_data$year <- as.numeric(gsub('X','',maddison_data$year))
maddison_data$country <- str_trim(maddison_data$country)

maddison_data <- merge(maddison_data,country_list[c('maddison','standard')],by.x='country',by.y='maddison',all.x=T,all.y=F)


