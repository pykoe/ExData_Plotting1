

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

# data <- read.csv(fn, sep = ";", na.strings = "?")
# data <- tbl_df(data)

# begin <- as.Date("2007-02-01", "%Y-%m-%d")
# end <- as.Date("2007-02-02", "%Y-%m-%d")
# ff <- filter(data, Date >= begin & Date <= end)

# read only data from the dates 2007-02-01 and 2007-02-02
library(sqldf)
ff <- read.csv.sql(fn, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', header = T, sep = ";")


# Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
ff <- mutate(ff, Date=as.Date(Date, format ="%d/%m/%Y"))
ff <- mutate(ff, completeDate = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))