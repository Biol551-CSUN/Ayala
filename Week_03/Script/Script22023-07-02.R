### This is my third script and I am learning how to ggplot
### Created by: Nicole Ayala
### Created on: 2023-02-07 
#####################################################################
### Load libraries #######
library(tidyverse)
library(palmerpenguins)
### time to use ggplot ###### dont forget about commas as they show that there are multiple arguments
glimpse(penguins)
ggplot(data=penguins, # bringing in data  # species is rows and sex is columns
            aes(x = bill_depth_mm,
                y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)
