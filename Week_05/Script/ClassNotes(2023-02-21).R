### practicing joins with data from becker and silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-21
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)

#### LOADING DATA ######
# Environmental data frome each site
Envirodata<-read_csv(here("Week_05","Data","site.characteristics.data.csv"))

# Thermal performance data 
TPCdata<-read_csv(here("Week_05","Data","Topt_data.csv"))


Envirodata_wide <- Envirodata %>%
  pivot_wider(names_from = parameters.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site 

View(Envirodata_wide)

Fulldata_left<- left_join(TPCdata, Envirodata_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data
  join_by(site.letter) 
  
 head(Fulldata_left)



