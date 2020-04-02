setwd("C:\\R Studio\\Coursera\\Exploratory Data Analysis\\Project 1\\ExData_Plotting1")
fileZip <- ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileZip, destfile="C:\\R Studio\\Coursera\\Exploratory Data Analysis\\Project 1\\ExData_Plotting1\\Electric Power Consumption.zip")
unzip("Electric Power Consumption.zip")

library(dplyr)

power <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", stringsAsFactors=F)

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power_reduced <- subset(power, power$Date=="1/2/2007"|power$Date=="2/2/2007")
rm(power)

power_reduced$Date <- as.Date(power_reduced$Date, "%d/%m/%Y")
power_date <- paste(power_reduced$Date, power_reduced$Time)
power_reduced$Datetime <- as.POSIXct(power_date)

##Plot 4
png(file="plot4.png", w=480, h=480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(power_reduced, {
  plot(Global_active_power~Datetime, xlab="", ylab="Global Active Power", type="l")
  plot(Voltage~Datetime, xlab="datetime", ylab="Voltage", type="l")
  plot(Sub_metering_1~Datetime, xlab="", ylab="Energy sub metering", type="l")
  lines(Sub_metering_2~Datetime, col="Red") 
  lines(Sub_metering_3~Datetime, col="Blue")
  legend("topright", bty="n", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, xlab="datetime", ylab="Global_reactive_power", type="l")
})

dev.off()