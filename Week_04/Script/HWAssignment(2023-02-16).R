### put a Bernie on it LOL
### Created by: Nicole Ayala
### Created on: 2023-02-16
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(beyonce)
library(ggridges)

### Load Data #####
Chemdata_clean<-Chemdata %>% # remember the PIPE!!!!
  filter(complete.cases(.)) #filters out everything that is not a complete row

View(Chemdata_clean)

Chemdata_clean<-Chemdata %>%
  drop_na() %>% #filters out everything that is not a complete r
  separate(col = Tide_time, # choose the tide time col, things that exist as data do not have quotes
                            # but what we are creating are in quotes
           into = c("tide","time"), # separate it into two columns, named them tide and time ) # separate by a space
           remove = FALSE) # keep the original tide_time column

Chemdata_long<-Chemdata_clean %>%
  pivot_longer(cols = Temp_in:pH, # the cols you want to pivot. This says select the temp to pH cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") %>%# names of the new column with all the values
  group_by(Variables, Season, Zone ) %>% # group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_stdv = sd(Values, na.rm = TRUE)) # getting the standard deviation


write_csv(here("Week_04","Output","InClassDensityPlot(2023-02-16).csv")) # export as a csv to the right folder

View(Chemdata_long) # this upper section is related to the csv file, plot info is down below!


          
chemplot<-Chemdata %>% # make sure to keep putting a pipeline & name this chemdata separate from chemdata_long!
  drop_na()%>% # ALWAYS ADD THE DROP_NA TO REMOVE NAs IN YOUR PLOT
  mutate(pH_log = log(pH))%>% # PARANTHESE! Be mindful of what you name or rename (pH)
  ggplot(aes(x = pH_log, y = Zone, fill = Season))+ 
  geom_density_ridges2() +
  labs(x = "Season", y = "Zone", title = "Each Zone's Environmental Differences within Basicity and Acidity During the Spring Season")+
            scale_fill_manual(values = beyonce_palette(2)) +
  theme(axis.title = element_text(size = 14, color = "green"),
        panel.background = element_rect(fill = "white"))
        
  
chemplot

