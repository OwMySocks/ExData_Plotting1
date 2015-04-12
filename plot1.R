library(data.table)
if(!file.exists("household_power_consumption.txt")){
  fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,destfile = "household_power_consumption.zip")
  unzip(zipfile="household_power_consumption.zip")
}
file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep=";", na.strings="?")
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
data <- dt[dt$Date>="2007-02-01" & dt$Date<="2007-02-02",]