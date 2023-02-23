### practicing using lubridate with data from Becker and Silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-23
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(lubridate)
library(devtools)

install_github("Gibbsdavidl/CatterPlots") # install the data

#### Loading Data ###

# Depth data
DepthData<-read_csv(here("Week_05","Data","DepthData.csv")) 
DepthData<-DepthData %>%
  mutate(Date = as.character(Date), # CHANGE DATE INTO A CHARACTER BUT HERE IT IS ALREADY A CHARACTER
         Date = mdy_hm(Date)) # change date format to mdy_hm

View(DepthData)
glimpse(DepthData)

# Conductivity data from each site
#mutate(Date = as.character(Date), # CHANGE DATE INTO A CHARACTER BUT HERE IT IS ALREADY A CHARACTER
CondData<-read_csv(here("Week_05","Data","CondData.csv"))
CondData<-CondData %>%
  mutate(Date = as.character(Date), # change a column into a character
         Date = mdy_hm(Date)) %>% # change date format to mdy_hm
  round_date(datetimes, "10 seconds") # round to nearest 10 seconds) 

View(CondData)
glimpse(CondData)

###  JOIN TWO DATA SETS TOGETHER ### 
ConjoinedData<-inner_join(CondData, DepthData)
  




#####
  
  hour(Date) # tells me the hours
  minute(Date) # tells me the minutes
    summarise(Param_average =mean(Salinity,na.rm = TRUE), # get the mean
              Param_average =mean(Temperature,na.rm = TRUE),
              Param_average =mean(Date,na.rm =TRUE),
              Param_average =mean(Depth,na.rm =TRUE),
  
View(NewData)
   

  




