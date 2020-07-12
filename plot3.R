# Author: Cynthia Elder
# Date: 7/12/2020

# This script creates `plot3.png`, which consists of a plot containing
# overlayed line graphs for Energy sub meterings 1-3 over time.  

# This function accepts the household power consumption data set and the border
# type of the plot legend to generate plot3
create_plot3 <- function(household_data, border_type = "o") {
  plot(household_data$Datetime, household_data$Sub_metering_1, type = "l",
       ylab = "Energy sub metering", xlab = "")
  lines(household_data$Datetime, household_data$Sub_metering_2, col = "red")
  lines(household_data$Datetime, household_data$Sub_metering_3, col = "blue")

  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "blue", "red"), lty=c(1,1,1), bty = border_type)
}

# This is the main function that reads in the household power consumption data
# set and opens the PNG graphics device to send the plot to `plot3.png`.
plot3 <- function() {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  source(file = "src/read_household_data.R")
  data <- read_household_data()
  
  png(filename = "plot3.png", width = 480, height = 480)
  create_plot3(data)
  dev.off()
}

plot3()
