### This is my third script and I am learning how to ggplot
### Created by: Nicole Ayala
### Created on: 2023-02-09
#####################################################################
### Load libraries #######
library(tidyverse)
library(palmerpenguins)
library(here)
library(beyonce)
### time to use ggplot ###### 
ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) +
  geom_point()+
  geom_smooth(method = "lm")+
    labs(x ="Bill depth (mm)",
         y = "Bill length (mm)"
         ) +
  scale_color_viridis_d()+
  scale_color_manual(values = beyonce_palette(2)) +
  theme_bw() +
  theme(axis.title = element_text(size = 15,
                                  color = "orchid"),
        panel.background = element_rect(fill = "beige"))
  ### coord_polar("x") # make the polar
  ### coord_trans(x = "log10", y = "log10")
  ### coord_fixed() # fix axes
  ### coord_flip() # flip x and y axes
  ### scale_color_manual(values = c("orange", "purple", "green"))
  ### scale_x_continuous(limits = c(0,20)) +
  ### scale_y_continuous(limits = c(0,50))
  ### scale_x_continuous(breaks = c(14, 17, 21),
                     ### labels = c("low", "medium", "high"))
          
  ggsave(here("Week_03","Output","penguin.png"))
  