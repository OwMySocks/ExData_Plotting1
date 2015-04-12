## libraries!
library(data.table)

## check if I just did this and if not, do it!
if(!file.exists("household_power_consumption.txt")){
  fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,destfile = "household_power_consumption.zip")
  unzip(zipfile="household_power_consumption.zip")
}

## bring in giant thing of data!
file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep=";", na.strings="?")

## ok heres the date stuff
dt$dateAsDate <- as.Date(dt$Date, format="%d/%m/%Y")
data <- dt[dt$dateAsDate>="2007-02-01" & dt$dateAsDate<="2007-02-02",]
data$DateTime = paste(data$Date,data$Time)
data$DateTimeProper = strptime(data$DateTime, "%d/%m/%Y%H:%M:%S")

## plotting
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(data$DateTimeProper,data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)",xlab="")
plot(data$DateTimeProper,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data$DateTimeProper,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTimeProper,data$Sub_metering_2,type="l",col="red")
lines(data$DateTimeProper,data$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
plot(data$DateTimeProper,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()


