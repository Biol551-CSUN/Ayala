### we are going to plot some penguin data
### Created by: Nicole Ayala
### Created on: 2023-02-14
#####################################################################
### Load libraries #######
library(palmerpenguins)
library(tidyverse)
library(devtools)
libarary(dadjoke)
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
# Use mutate to create a new column to add flipper length and body mass together and  ifelse to create a new column where body mass greater than 4000 is labeled as big and everything else is small
mutate(.data = penguins,
               total_sum = flipper_length_mm + body_mass_g,
               body_mass_g = ifelse(body_mass_g>4000, "Bigger than 4000", "Smaller than 4000"))
# pipe says "and then do"
penguins %>% # use data frame
  ### filter(sex == "female") %>% # select females, filters select rows!!
  ### mutate(log_mass = log(body_mass_g))%>% # calculate log biomass
  ### select(Species = species, island, sex, log_mass) # selects columns as well as rename columns :)!!!
  ### group_by(island, sex) %>%
  drop_na(sex) %>%
  ### summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
  ###    min_flipper = min(flipper_length_mm, na.rm=TRUE))
  ### summarise(mean_bill_length = mean(bill_length_mm, na.rm =TRUE),
  ###       max_bill_length = max(bill_length_mm, na.rm =TRUE)) 
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()

dadjokeapi::groan()
dadjokeapi::groan()
dadjokeapi::groan()
dadjokeapi::groan()
dadjokeapi::groan()
