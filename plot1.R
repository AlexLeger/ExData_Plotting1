# Steps to download data
# 1) Dowload zip file from the following URL :
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 2) Unzip this file and move the household_power_consumption.txt file it contains 
#    to your R working directory


# Read data from file
data <- read.table("./household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors=FALSE)
# I set stringAsFactors to FALSE because I didn't want Date and Time to be turned into factors

# Clean data
# Keep only values for dates 2007-02-01 and 2007-02-02
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Create png file
png(file="./plot1.png",  width = 480, height = 480)

# Create graph
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close graphic device
dev.off()