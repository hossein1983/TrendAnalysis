####################################################################################################################################################
### Import and Prep Freedom House Data
### HZ - Sep. 2016
####################################################################################################################################################

library(xlsx)
library(tidyr)
library(stringr)
library(Hmisc)

country_list <- read.xlsx2('D:/Dropbox/_Classes/Data/Country Lists.xlsx',sheetIndex=1,stringsAsFactors=F)

freedom_data_orig <- read.xlsx2('D:/Dropbox/_Classes/Data/Freedom House/2016/Prepared_Data.xlsx',sheetIndex=1,header=F,stringsAsFactors=F)
freedom_data_orig[1,] <- c('Year',as.character(rep(1972:2015,1,each=3)))

colnames(freedom_data_orig) <- paste(str_trim(freedom_data_orig[2,]),freedom_data_orig[1,],sep='_')
colnames(freedom_data_orig)[1] <- 'country'
freedom_data_orig <- freedom_data_orig[3:nrow(freedom_data_orig),]

freedom_data <- freedom_data_orig %>% gather(index_year,freedom_score,PR_1972:Status_2015)
# colnames(freedom_data) <- c('country','index_year','value')

freedom_data$index <- sapply(freedom_data$index_year,function(x) str_split(x,'_')[[1]][1])
freedom_data$year <- as.numeric(sapply(freedom_data$index_year,function(x) str_split(x,'_')[[1]][2]))
freedom_data$index_year <- NULL

freedom_data <- subset(freedom_data,country!='')

freedom_data <- freedom_data %>% spread(index,freedom_score)

freedom_data$CL <- as.numeric(freedom_data$CL)
freedom_data$PR <- as.numeric(freedom_data$PR)

freedom_data <- merge(freedom_data,country_list[c('freedomhouse','standard')],by.x='country',by.y='freedomhouse',all.x=T,all.y=F)

