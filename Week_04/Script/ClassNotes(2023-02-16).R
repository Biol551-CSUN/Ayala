### today we will be going over tidyr 
### Created by: Nicole Ayala
### Created on: 2023-02-16
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)

## Load Data #####
Chemdata<-read_csv(here("Week_04","Data","chemicaldata_maunalua.csv"))
View(Chemdata)
glimpse(Chemdata)
Chemdata_clean<-Chemdata %>% # remember the PIPE!!!!
      filter(complete.cases(.)) #filters out everything that is not a complete row
View(Chemdata_clean)
drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col, things that exist as data do not have quotes but what we are creating are in quotes
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_" ) # separate by _
remove = FALSE # keep the original tide_time column
unite(col = "Site_Zone", # the name of the NEW col
      c(Site,Zone), # the columns to unite
      sep = ".", # lets put a . in the middle, put anything in the middle! space, question mark, bracket, comma 
      remove = FALSE) # keep the original

head(Chemdata_clean)

Chemdata_long<-Chemdata_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the values

View(Chemdata_long)
  