## household_power_consumption

# Scripts
`plot1.R`: reads the data set using `read_housing_data.R`, generates a histogram of Global Active Power, and saves the plot in `plot1.png`.  
`plot2.R`: reads the data set using `read_housing_data.R`, generates a line graph of Global Active Power over time, and saves the plot in `plot2.png`.  
`plot3.R`: reads the data set using `read_housing_data.R`, generates overlayed line graphs for Energy sub meterings 1-3 over time, and saves the plot in `plot3.png`.  
`plot4.R`: reads the data set using `read_housing_data.R` and creates `plot4.png`, which consists of 4 plots: plot2 generated using `plot2.R`, plot3 generated using `plot3.R`, line graph of Voltage over time, and line graph of Global Reactive Power over time.  

`read_housing_data.R`: reads the housing power consumption data for the dates 2007-02-01 and 2007-02-02 using `download_file.R` and combines the Date and Time columns into a single Datetime column.  
`download_file.R`: helper script for downloading a file from a given URL into a destination, if the destination doesn't already exist.  

# Exploratory Data Analysis Project
This project uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets.
* <b>Individual household
electric power consumption Data Set</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

The overall goal is to examine how household energy usage varies over a 2-day period in February, 2007 by reconstructing the following plots below, all of which were constructed using the base plotting system.  

For each plot:

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. The code file **should include code for reading
the data** so that the plot can be fully reproduced. It should also
include the code that creates the PNG file.

* Add the PNG file and R code file to the GitHub repository

There should be four PNG files and four R code files.


The four plots to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


* References:  
This project was created for the (Exploratory Data Analysis course from John Hopkins University)<https://www.coursera.org/learn/exploratory-data-analysis/home/welcome>.

The project is forked and cloned from the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)

