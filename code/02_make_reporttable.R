here::i_am("code/02_make_reporttable.R")

cleandataset <- readRDS(
  file = here::here("output/cleandataset.rds")
)

library(dplyr)
library(knitr)

table1 <- cleandataset %>%
  filter(prescriptionrate_2022 != -9) %>%
  group_by(state) %>%
  summarise(ncounties = n(), 
            avg_OPR = round(mean(prescriptionrate_2022, na.rm=TRUE), 1))

reporttable <- kable(
  table1,
  col.names = c("State Abbreviation", "# of Counties with<br/>Available Data (#)", "Average Opioid Prescription Rate<br/>(# opioid prescriptions dispensed/100 persons)"),
  caption = "Table 1. Average County-Level Opioid Prescription Rates By State, 2022"
)

saveRDS(
  reporttable, 
  file = here::here("output/reporttable.rds")
)

saveRDS(
  table1, 
  file = here::here("output/reporttabledata.rds")
)