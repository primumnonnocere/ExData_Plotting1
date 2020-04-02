setwd("C:\\R Studio\\Coursera\\Exploratory Data Analysis\\Project 1\\ExData_Plotting1")
fileZip <- ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileZip, destfile="C:\\R Studio\\Coursera\\Exploratory Data Analysis\\Project 1\\ExData_Plotting1\\Electric Power Consumption.zip")
unzip("Electric Power Consumption.zip")

library(dplyr)

power <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", stringsAsFactors=F)

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power_reduced <- subset(power, power$Date=="1/2/2007"|power$Date=="2/2/2007")
rm(power)


##Plot 1
png(file="plot1.png", w=480, h=480)
hist(power_reduced$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()