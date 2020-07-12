# Author: Cynthia Elder
# Date: 7/12/2020

# This script reads the housing power consumption data for the
# dates 2007-02-01 and 2007-02-02 and combines the Date and Time columns into a
# single Datetime column. The final data set is returned for analysis.  
read_household_data <- function() {
  # Load the required packages -------------------------
  list_of_packages <- c("rstudioapi", "lubridate", "dplyr")
  lapply(list_of_packages, library, character.only = TRUE)
  
  # Source functions -----------------------------------
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  source(file = "src/download_file.R")
  
  # Set hard-coded variables ---------------------------
  file_url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  data_dir <- "data"
  results_dir <- "."
  dataset_dir <- paste0(data_dir, "/household_power_consumption_data")
  dest_file <- paste0(dataset_dir, ".zip")
  dataset_file <- paste0(dataset_dir, "/household_power_consumption.txt")
  
  # Download data --------------------------------------
  download_file(data_dir, file_url, dest_file)
  suppressWarnings(unzip(dest_file, exdir = dataset_dir, overwrite = FALSE))
  
  # Load data ------------------------------------------
  setClass('myDate')
  setClass('myTime')
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
  setAs("character","myTime",
        function(from) format(strptime(from, format="%H:%M:%S"), "%H:%M:%S"))
  
  data <- read.table(pipe(paste0('grep "^1/2/2007\\|^2/2/2007" ', dataset_file)), header = FALSE, sep = ";", na.strings = "?",
                     colClasses = c("myDate", "myTime", "numeric", "numeric",
                                    "numeric", "numeric", "numeric", "numeric",
                                    "numeric"))
  names(data) <- names(read.table(dataset_file, sep = ";", header = TRUE, nrow = 1))

  # Create datetime column -----------------------------
  data$Datetime <- ymd_hms(paste(data$Date, data$Time))
  data %>%
    subset(select = -c(Date, Time)) %>%
    select(Datetime, everything())
}
