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

#draw plot1
png(filename = "~/plot1.png", width = 480, height = 480, units = "px")
hist(dt$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200), 
     col = "red", breaks = 24)
dev.off()
