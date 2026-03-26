here::i_am("code/03_make_reportfigure.R")

cleandataset <- readRDS(
  file = here::here("output/cleandataset.rds")
)

library(dplyr)
library(ggplot2)
library(tidyr)

figure1 <- cleandataset %>%
  filter(state == "GA") %>%
  filter(county == "Cobb County" |
           county == "Clayton County" |
           county == "DeKalb County" |
           county == "Fulton County" |
           county == "Gwinnett County") %>%
  pivot_longer(
    cols = c("mortality_2014", "mortality_2015", "mortality_2016", "mortality_2017", 
             "mortality_2018", "mortality_2019", "mortality_2020", "mortality_2021"),
    names_to = "year",
    names_prefix = "mortality_",     
    values_to = "mortalityrate"      
  )

reportfigure <- ggplot(figure1, aes(x = year, y = mortalityrate, color = county, group = county)) +
  geom_point() +
  geom_line() +
  labs(title = "Figure 1. Narcotic Overdose Mortality Across Five Metro Atlanta Counties", 
       x = "Year", 
       y = "Narcotic Overdose Mortality Rate\n(# of deaths from narcotic overdose/100,000 persons)",
       color = "County")

saveRDS(
  reportfigure, 
  file = here::here("output/reportfigure.rds")
)