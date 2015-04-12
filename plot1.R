library(data.table)

#check to see if I've done this and download file if not
if(!file.exists("household_power_consumption.txt")){
  fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,destfile = "household_power_consumption.zip")
  unzip(zipfile="household_power_consumption.zip")
}

#read in file
file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep=";", na.strings="?")

#get dates right
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
data <- dt[dt$Date>="2007-02-01" & dt$Date<="2007-02-02",]

#make a plot
png(filename="plot1.png")
hist(data$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",yaxp=c(0,1200,5),main="Global Active Power")
dev.off()