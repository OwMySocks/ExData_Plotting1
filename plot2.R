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

##and on to the actual plotting
png(filename="plot2.png")
plot(data$DateTimeProper,data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()