### practicing using lubridate with data from Becker and Silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-23
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(lubridate)
library(devtools)
library(ggplot2)
library(beyonce)

install_github("Gibbsdavidl/CatterPlots") # install the data

#### Loading Data ###

DepthData<-read_csv(here("Week_05","Data","DepthData.csv")) 
CondData<-read_csv(here("Week_05","Data","CondData.csv"))

Condmutated<-CondData %>%
  mutate(date= mdy_hms(date),# change date format to mdy_hm
         date= round_date(date, "10 seconds")) #round to nearest 10 seconds

### VIEW THE DATA SETS ###

View(DepthData)
View(CondData)
View(Condmutated)

### JOIN TWO DATA SETS TOGETHER ###

inner_join(Condmutated, DepthData) %>% # we are joining exact datasets from each one
  mutate(date= round_date(date, "1 min")) %>%  # round the time to nearest minutes
  group_by(date)%>% # grouping by date :)
  summarize(depthaverage=mean(Depth, na.rm= TRUE), #average of depth
            tempaverage= mean(Temperature, na.rm= TRUE), # average of temp
            salinityaverage= mean(Salinity, na.rm= TRUE))%>% # average of salinity
  
  #### TIME TO PLOT ####

  ggplot(aes(x= date, # wanna graph the date on x
             y= salinityaverage))+ # wanna graph the average of salinity on y
  geom_line(color= "darkblue")+ 
  labs(x= "Time",
       y= "Average Salinity",
       title= "Average Salinity at Various Time Points") + # the plot title
  scale_color_manual(values = beyonce_palette(3)) +
  theme_linedraw() + 
  theme(axis.title = element_text(size = 20,
                                  color = "darkgray"),
        panel.background = element_rect(fill = "linen"))
       
  
ggsave(here("Week_05","Output","newplot.png"))






