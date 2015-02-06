# should load data first ...
# run loadData.R script

# plot 1
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", bg = "transparent")


globalActivityLabel = "Global Active Power (kilowatts)"
mainTitle <- "Global Active Power"

Global_active_power <- ff$Global_active_power
hist(ff$Global_active_power, col="red", xlab = globalActivityLabel, main=mainTitle)
dev.off()

