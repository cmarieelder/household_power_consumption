## Code book

# Variables
  <ol>
  <li><b>Date</b>: Date in format dd/mm/yyyy </li>
  <li><b>Time</b>: time in format hh:mm:ss </li>
  <li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
  <li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
  <li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
  <li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
  <li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
  <li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
  <li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
  </ol>

Variable descriptions were obtained from the (UCI web site)<https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption>.  

## Study Design

# Data Collection
The data was obtained by measuring electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values were also measured.  

# Database Extraction
When loading the dataset into R, the following were considered:  
* The dataset has 2,075,259 rows and 9 columns.  
* Only data from the dates 2007-02-01 and 2007-02-02 will be analyzed.  
* The dataset missing values are coded as `?`.  

Due to the large amount of memory the dataset would require, only the data from the required dates were subsetted and read in.  

1. The database subset was downloaded from the URL below using `read_household_data.R`, which calls `download_file.R`:  
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip  
2. The database was then extracted using unzip().  

# Data Transformations
1. Converted Date and Time variables to custom Date/Time colClasses in R  using `setAs()` with `as.Date(x, format="%d/%m/%Y")` and `format(strptime(x, format="%H:%M:%S", "%H:%M:%S"))` upon read-in with `read.table()`.  
2. Subsetted the database using `pipe(paste0('grep "^1/2/2007\\|^2/2/2007" ', dataset_file))` during read-in with `read.table()`.  
3. Acquired the column names using `read.table()` for the header and assigning them using `names`.  
4. Created a new column Datetime with values set using `lubridate::ymd_hms()` to combine the Date and Time columns.  
5. Removed the Date and Time columns using `dplyr::subset(select = -c(Date, Time))`  
6. Shifted the new Datetime column to the first column using `dplyr::select(Datetime, everything())`  
