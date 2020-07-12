# Author: Cynthia Elder
# Date: 7/12/2020

# This script creates `plot2.png`, which consists of a line graph of
# Global Active Power over time.  

# This function accepts the household power consumption data set and the 
# desired label for the y-axis to generate plot2
create_plot2 <- function(household_data, ylabel = "Global Active Power (kilowatts)") {
  plot(household_data$Datetime, household_data$Global_active_power,
       type = "l", ylab = ylabel, xlab = "")
}

# This is the main function that reads in the household power consumption data
# set and opens the PNG graphics device to send the plot to `plot2.png`.
plot2 <- function() {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  source(file = "src/read_household_data.R")
  data <- read_household_data()
  
  png(filename = "plot2.png", width = 480, height = 480)
  create_plot2(data)
  dev.off()
}

plot2()
