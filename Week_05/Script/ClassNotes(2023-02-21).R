### practicing joins with data from becker and silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-21
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(cowsay)

#### LOADING DATA ######
# Environmental data frome each site
EnviroData<-read_csv(here("Week_05","Data","site.characteristics.data.csv"))

View(Envirodata)
glimpse(Envirodata)

# Thermal performance data 
TPCData<-read_csv(here("Week_05","Data","Topt_data.csv"))


EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)
View(Envirodata_wide)

FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data

head(FullData_left)

ThinkData <- FullData_left %>%
  pivot_longer(cols = E:substrate.cover, # cols wanted to pivot
               names_to= "variables", # Name of new cols with all column names
               values_to= "values") %>%
  group_by(site.letter, variables)%>%
  summarise(means_vals= mean(values, na.rm=TRUE),
            var_vals= var(values, na.rm= TRUE))
  
 
########  Make 1 tibble #####
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1

left_join(T1,T2) # these two have the same NA
right_join(T2,T1) # these two have the same NA 
inner_join(T1,T2)
full_join(T1,T2) # same thing as merging
semi_join(T1,T2) #only looks at the first column of data set
anti_join(T1,T2) # only keeps missing columns
######## Make another tibble #####
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

say("hello", by = "monkey")

