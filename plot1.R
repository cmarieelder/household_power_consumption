# Author: Cynthia Elder
# Date: 7/12/2020

# This script creates `plot1.png`, which consists of a histogram of
# Global Active Power.  

# This function accepts the household power consumption data set and generates
# plot1
create_plot1 <- function(household_data) {
  hist(household_data$Global_active_power, col = "red",
       xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
}

# This is the main function that reads in the household power consumption data
# set and opens the PNG graphics device to send the plot to `plot1.png`.
plot1 <- function() {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  source(file = "src/read_household_data.R")
  data <- read_household_data()

  png(filename = "plot1.png", width = 480, height = 480)
  create_plot1(data)
  dev.off()
}

plot1()
