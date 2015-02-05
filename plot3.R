# should load data first ...
# run loadData.R script

# plot 3
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
energySubMetering <- "Energy sub metering"

with (ff, plot(completeDate, Sub_metering_1, type="n", xlab="", ylab = energySubMetering))
with (ff, lines(completeDate, Sub_metering_1, col="black"))
with (ff, lines(completeDate, Sub_metering_2, col="red"))
with (ff, lines(completeDate, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))
dev.off()