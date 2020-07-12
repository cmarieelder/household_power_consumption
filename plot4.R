# Author: Cynthia Elder
# Date: 7/12/2020

# This script creates `plot4.png`, which consists of 4 plots:
# 1. plot2 generated using `plot2.R`
# 2. plot3 generated using `plot3.R`
# 3. line graph of Voltage over time
# 4. line graph of Global Reactive Power over time

# This function accepts the household power consumption data set and generates
# the four plots
create_plot4 <- function(household_data) {
  par(mfcol = c(2, 2))

  create_plot2(household_data, "Global Active Power")
  create_plot3(household_data, "n")

  plot(household_data$Datetime, household_data$Voltage, type = "l",
       ylab = "Voltage", xlab = "datetime")
  plot(household_data$Datetime, household_data$Global_reactive_power, type = "l",
       ylab = "Global_reactive_power", xlab = "datetime")
}

# This is the main function that reads in the household power consumption data
# set and opens the PNG graphics device to send the four plots to `plot4.png`.
plot4 <- function() {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  source(file = "src/read_household_data.R")
  source(file = "plot2.R")
  source(file = "plot3.R")

  data <- read_household_data()

  png(filename = "plot4.png", width = 480, height = 480)
  create_plot4(data)
  dev.off()
}

plot4()
