### This is my third script and I am learning how to ggplot
### Created by: Nicole Ayala
### Created on: 2023-02-07 
#####################################################################
### Load libraries #######
library(tidyverse)
library(palmerpenguins)
### time to use ggplot ###### dont forget about commas as they show that there are multiple arguments
glimpse(penguins)
ggplot(data=penguins, # bringing in data  
            aes(x = bill_depth_mm,
                y = bill_length_mm,
                color = species,
                )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(sex~species)+# species is rows and sex is columns  
  guides(color = FALSE) #removes the color legend to not be redundant
  ### this creates a wrap and ncol makes it stack upon itself into 2 columns ;use  facet_wrap (~ species, ncol=2)
  
