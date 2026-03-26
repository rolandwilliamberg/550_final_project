here::i_am("code/01_make_cleandataset.R")

# loads uncleaned dataset
absolute_file_path <- here::here("data/data550_final_dataset.csv")
data <- read.csv(absolute_file_path, header = TRUE)

# deletes unnecessary rows + relabels columns
data <- data[-c(1:3), ]
colnames(data) <- c("geo_id", "state", "county", 
                    "prescriptionrate_2022", "mortality_2014", "mortality_2015", 
                    "mortality_2016", "mortality_2017", "mortality_2018", 
                    "mortality_2019", "mortality_2020", "mortality_2021")

# defines numeric variables
data$geo_id <- as.numeric(data$geo_id)
data$prescriptionrate_2022 <- as.numeric(data$prescriptionrate_2022)
data$mortality_2014 <- as.numeric(data$mortality_2014)
data$mortality_2015 <- as.numeric(data$mortality_2015)
data$mortality_2016 <- as.numeric(data$mortality_2016)
data$mortality_2017 <- as.numeric(data$mortality_2017)
data$mortality_2018 <- as.numeric(data$mortality_2018)
data$mortality_2019 <- as.numeric(data$mortality_2019)
data$mortality_2020 <- as.numeric(data$mortality_2020)
data$mortality_2021 <- as.numeric(data$mortality_2021)

saveRDS(
  data, 
  file = here::here("output/cleandataset.rds")
)