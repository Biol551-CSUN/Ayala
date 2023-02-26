### practicing using lubridate with data from Becker and Silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-23
### Updated on: 2023-02-26
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(lubridate)
library(devtools)
library(ggridges)

#### Loading Data ###

# Depth data
DepthData<-read_csv(here("Week_05","Data","DepthData.csv")) 
DepthData<-DepthData %>%
  mutate(Date = mdy_hm(Date)) # change date format to mdy_hm

View(DepthData)
glimpse(DepthData)

# Conductivity data from each site
#mutate(Date = as.character(Date), # CHANGE DATE INTO A CHARACTER BUT HERE IT IS ALREADY A CHARACTER
CondData<-read_csv(here("Week_05","Data","CondData.csv"))
CondData_iso<-CondData %>%
  #Date = as.character(Date), # change a column into a character
  mutate(Date = mdy_hm(Date) %>% # change date format to mdy_hm
           Date = round_date(Date, "10 seconds")) # round to nearest 10 seconds) 

Cond_depth_data <- inner_join(CondData_iso, DepthData)
View(Cond_depth_data) # check updated data to be accurate with all corresponding dates, ahd an issue of getting dates as NAs without piping it into itself or calling it something else


