# Steps to download data
# 1) Dowload zip file from the following URL :
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 2) Unzip this file and move the household_power_consumption.txt file it contains 
#    to your R working directory


# Read data from file
data <- read.table("./household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors=FALSE)
# I set stringAsFactors to FALSE because I didn't want Date and Time to be turned into factors

# Clean and transform data

# Keep only values for dates 2007-02-01 and 2007-02-02
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Create a new variable datetime of type POSIXlt from Date and Time variables
data$datetime <- strptime(paste(data$Date,data$Time,""), "%d/%m/%Y %H:%M:%S")

# Create png file
png(file="./plot4.png",  width = 480, height = 480)

# Define graph parameters
par(mfrow = c(2,2))

# Create 1st graph
# Create "blank" graph with appropriate labels that we will then add line onto
with(data, plot(datetime,Global_active_power, pch=NA_integer_, xlab="", ylab="Global Active Power"))
# Add line to the existing graph
with(data, lines(datetime,Global_active_power))

# Create 2nd graph
# Create "blank" graph with appropriate labels that we will then add line onto
with(data, plot(datetime,Voltage, pch=NA_integer_))
# Add line to the existing graph
with(data, lines(datetime,Voltage))

# Create 3rd graph
# Create "blank" graph with appropriate labels that we will then add line onto
with(data, plot(datetime,Sub_metering_1, pch=NA_integer_, xlab="", ylab="Energy sub metering"))
# Add a line for each Sub metering
with(data, lines(datetime,Sub_metering_1, col="black"))
with(data, lines(datetime,Sub_metering_2, col="red"))
with(data, lines(datetime,Sub_metering_3, col="blue"))
# Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),    
       lty=c(1,1), # gives the legend appropriate symbols (lines) 
       lwd=c(1,1,1),col=c("black","red", "blue"), # gives the legend lines color and width
       bty="n") # no box around legend

# Create 4th graph
# Create "blank" graph with appropriate labels that we will then add line onto
with(data, plot(datetime,Global_reactive_power, pch=NA_integer_))
# Add line to the existing graph
with(data, lines(datetime,Global_reactive_power))

# Close graphic device
dev.off()