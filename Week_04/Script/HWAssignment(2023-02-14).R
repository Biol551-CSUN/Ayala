### still learning how to plot
### Created by: Nicole Ayala
### Created on: 2023-02-14
#####################################################################
### Load libraries #######
library(palmerpenguins)
library(tidyverse)
library(devtools)
library(beyonce)
library(here)
####### LOAD DATA #######
glimpse(penguins) # the data part of the package is called penguins
head(penguins)
# this returns a true or false and a statement
### One = sets an argument in the function: Two == reads as "is exactly equal to." It is a question that returns a TRUE or FALSE. Here, filter keeps every TRUE
penguin_log <- penguins %>% 
       group_by(species, island, sex) %>%
       summarise(mean_body_mass_g = mean(body_mass_g, na.rm =TRUE),
                 var_body_mass_g = var(body_mass_g, na.rm =TRUE))
penguin_log <- penguins %>%
       filter(sex == "female") %>%
       mutate(log_mass = log(body_mass_g)) %>% # calculate log biomass
       select(Species = species, island, sex, log_mass)
                                  
ggplot(data = penguin_log, 
       mapping = aes(x = log_mass, 
                     y = Species,
                     fill = Species)) + 
  geom_boxplot() +
  coord_flip() +
  labs(x = "Body Mass (Log)", y = "Species", title = "Various Female Penguin Species and their Body Masses (Log)")+
  scale_fill_manual(values = beyonce_palette(5)) +
  theme(axis.title = element_text(size = 14,
                                  color = "red"),
        panel.background = element_rect(fill = "beige"))

ggsave(here("Week_04","Output","HomeworkAssignment2023-02-14.png"))
       