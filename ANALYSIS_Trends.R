####################################################################################################################################################
### Merge political and economic data and look for anomilies
### HZ - Sep. 2016
####################################################################################################################################################

library(dplyr)

all_data <- full_join(select(freedom_data,-country),select(polity_data,-country),by=c('standard','year'))
all_data <- full_join(all_data,select(maddison_data,-country),by=c('standard','year'))

# all_data$CL <- as.numeric(all_data$CL)
# all_data$PR <- as.numeric(all_data$PR)
all_data$status <- as.factor(all_data$Status)
all_data$country <- as.factor(all_data$standard)
all_data$polity2 <- as.numeric(all_data$polity2)

all_data <- all_data[c('country','year','gdpPerCapita','polity2','CL','PR','status')] %>% dplyr::arrange(country,year)

####################################################################################################################################################

