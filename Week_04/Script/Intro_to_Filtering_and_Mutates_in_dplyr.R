### we are going to plot some penguin data
### Created by: Nicole Ayala
### Created on: 2023-02-14
#####################################################################
### Load libraries #######
library(palmerpenguins)
library(tidyverse)
library(here)
####### LOAD DATA #######
glimpse(penguins) # the data part of the package is called penguins
head(penguins)
 # this returns a true or false and a statement
### One = sets an argument in the function: Two == reads as "is exactly equal to." It is a question that returns a TRUE or FALSE. Here, filter keeps every TRUE
filter(.data = penguins, island != "Dream")
filter(.data = penguins, species == "Adelie" |
                         species == "Gentoo")
filter(.data = penguins, year == 2008 | 2009)
filter(.data = penguins, year %in% c("2008", "2009"))
mutate(.data = penguins,
              body_mass_kg = body_mass_g/1000, # body mass in kilograms
              bill_length_Depth = bill_length_mm/bill_length_mm, # calculate ratio of bill length to depth
              after_2008 = ifelse(year>2008, "After 2008", "Before 2008")) # Before tag for 2008
mutate(.data = penguins,
               total_sum = flipper_length_mm + body_mass_g,
               body_mass_g = ifelse(body_mass_g>4000, "Bigger than 4000", "Smaller than 4000"))

