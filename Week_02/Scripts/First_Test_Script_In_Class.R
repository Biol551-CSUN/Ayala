### This is my first script and I am learning how to import data
### Created by: Nicole Ayala
### Created on: 2023-02-02
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
### Read in data ###
WeightData<-read_csv(here("Week_02","Data","weightdata.csv"))
### Data Analysis #######
head(WeightData) # Looks at the top 6 lines of the dataframe
tail(WeightData) # Looks at the bottom 6 lines of the dataframe
View(WeightData) # opens a new window to look at the entire dataframe
glimpse(WeightData) # tells you if it is a character or  numeric
