

# data will be store in a specific directory (./data)
if (!file.exists("data")) {
  dir.create("data")
}

# download data - if data has been already download skip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
targetPath <- "data/household_power_consumption.zip"
if (!file.exists(targetPath)) {
  download.file(fileUrl, targetPath, method = "curl")
}


unzipedPath <- "data/household_power_consumption"
# unzip data - if unzip already skip
if (!file.exists(unzipedPath)) {
  unzip(targetPath, exdir = unzipedPath)
}

# estimate size
dateSize <- object.size(Sys.Date())
timeSize <- object.size(Sys.time())
doubleSize <- object.size(12.222444)

byRowSize <- dateSize + timeSize + doubleSize*7
estimateRequiredMemory <- byRowSize * 2075259


# read data
fn <- "data/household_power_consumption/household_power_consumption.txt"
# commun way 

# for fread
library(data.table)

library(dplyr)

# na value is "?"

data <- read.csv(fn, sep = ";", na.strings = "?")
data <- tbl_df(data)
data <- mutate(data, Date=as.Date(Date, format ="%d/%m/%Y"))

#data <- mutate(data, Time = strptime(Time, "%H:%M:%S")))

begin <- as.Date("2007-02-01", "%Y-%m-%d")
end <- as.Date("2007-02-02", "%Y-%m-%d")
ff <- filter(data, Date >= begin & Date <= end)

# read only data from the dates 2007-02-01 and 2007-02-02
library(sqldf)
#df <- read.csv.sql(fn, sql = 'select * from file where Date >= "2007-02-01" AND Date <= "2007-02-02"', header = T, sep = ";")


# Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.


# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.


# plot 1
# globalActivityLabel = "Global Active Power (kilowatts)"
# mainTitle <- "Global Active Power"
# Global_active_power <- ff$Global_active_power
# hist(ff$Global_active_power, col="red", xlab = globalActivityLabel, main=mainTitle)

# plot 2
# ff <- mutate(ff, completeDate = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
# with (ff, plot(completeDate, Global_active_power, type="n", ylab = globalActivityLabel))
# with (ff, lines(completeDate, Global_active_power))

# plot 3
# energySubMetering <- "Energy sub metering"
# dev.off()
# with (ff, plot(completeDate, Sub_metering_1, type="n", ylab = energySubMetering))
# with (ff, lines(completeDate, Sub_metering_1, col="black"))
# with (ff, lines(completeDate, Sub_metering_2, col="red"))
# with (ff, lines(completeDate, Sub_metering_3, col="blue"))
# legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

# # polt 4
# par(mfrow=c(2, 2))
# 
# globalActivityLabel = "Global Active Power"
# with (ff, plot(completeDate, Global_active_power, type="n", ylab = globalActivityLabel, xlab=""))
# with (ff, lines(completeDate, Global_active_power))
# 
# with (ff, plot(completeDate, Voltage, type="n", xlab="datetime", ylab="Voltage"))
# with (ff, lines(completeDate, Voltage))
# 
# with (ff, plot(completeDate, Sub_metering_1, type="n", ylab = energySubMetering, xlab=""))
# with (ff, lines(completeDate, Sub_metering_1, col="black"))
# with (ff, lines(completeDate, Sub_metering_2, col="red"))
# with (ff, lines(completeDate, Sub_metering_3, col="blue"))
# legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n")
# 
# with (ff, plot(completeDate, Global_reactive_power, type="n", xlab="datetime"))
# with (ff, lines(completeDate, Global_reactive_power))