### This is my second script and I am learning how to ggplot
### Created by: Nicole Ayala
### Created on: 2023-02-07 
#####################################################################
### Load libraries #######
library(tidyverse)
library(palmerpenguins)
### time to use ggplot ###### dont forget about commas as they show that there are multiple arguments
glimpse(penguins)
ggplot(data=penguins, # bringing in data
  mapping = aes(x = bill_depth_mm, # this is my x and aes is only for data!
                y = bill_length_mm,  # this is my y 
                color = species, # aesthetics always deal with data in dataframe
                shape = island, # remove island to get dots :)
                )) +
                ###  size = body_mass_g for a legend if data based
                ### makes dots transparent and alpha = flipper_length_mm is a legend if data based
                
  geom_point(size = 2, alpha = 0.5) + # I want the geometry to be a point and outside of aes: data
    labs(title = "Bill depth and length", # always put in quotes to explicitly write this
          subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo",
          x = "Bill depth in (mm)", y = "Bill length in (mm)", # dont need to add plus sign if it is the same argument
         color = "Species of Penguins", shape = "Islands", size = "Body Mass (g)", alpha = "Flipper Length (mm)",
         caption = "Source: Palmer Station LTR / palmerpenguins package")+
  scale_color_viridis_d()
