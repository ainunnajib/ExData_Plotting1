# download and unzip the file
URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, method = "curl", destfile = "power.zip")
unzip("power.zip")

#load file
dtall <- read.csv("household_power_consumption.txt", header = TRUE , sep=";", na.strings="?", colClasses = c(rep("character", 2), "numeric"))

#select subset
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
dt <- dtall[which(as.Date(dtall$Date, "%d/%m/%Y") >= startDate
                  & as.Date(dtall$Date, "%d/%m/%Y") <= endDate),]
dt$date.time <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

#draw plot4
png(filename = "~/coursera/ExData_Plotting1/plots/plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

#1
plot(dt$date.time, dt$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")
#2
plot(dt$date.time, dt$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")
#3
plot(dt$date.time, dt$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt$date.time, dt$Sub_metering_2, col = "red")
lines(dt$date.time, dt$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), box.lwd = 0)
#4
plot(dt$date.time, dt$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
