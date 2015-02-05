# should load data first ...
# run loadData.R script

# plot 4
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow=c(2, 2))

globalActivityLabel = "Global Active Power"
with (ff, plot(completeDate, Global_active_power, type="n", ylab = globalActivityLabel, xlab=""))
with (ff, lines(completeDate, Global_active_power))

with (ff, plot(completeDate, Voltage, type="n", xlab="datetime", ylab="Voltage"))
with (ff, lines(completeDate, Voltage))

with (ff, plot(completeDate, Sub_metering_1, type="n", ylab = energySubMetering, xlab=""))
with (ff, lines(completeDate, Sub_metering_1, col="black"))
with (ff, lines(completeDate, Sub_metering_2, col="red"))
with (ff, lines(completeDate, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n")

with (ff, plot(completeDate, Global_reactive_power, type="n", xlab="datetime"))
with (ff, lines(completeDate, Global_reactive_power))

dev.off()