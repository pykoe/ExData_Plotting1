# should load data first ...
# run loadData.R script

# plot 2
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
globalActivityLabel = "Global Active Power (kilowatts)"
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
ff <- mutate(ff, completeDate = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
with (ff, plot(completeDate, Global_active_power, type="n", ylab = globalActivityLabel, xlab=""))
with (ff, lines(completeDate, Global_active_power))
dev.off()