### clean csv file!
### Created by: Nicole Ayala
### Created on: 2023-02-16
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)

## Load Data #####
Chemdata_clean<-Chemdata %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols  
               names_to = "Variables", # the names of the new cols with all the column names 
               values_to = "Values") %>% # names of the new column with all the values 
  group_by(Variables, Site, Time) %>% 
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables,
              values_from = mean_vals) # notice it is now mean_vals as the col name
  
  View(Chemdata_clean)
  write_csv(here("Week_04","Output","summary.csv"))  # export as a csv to the right folder
  