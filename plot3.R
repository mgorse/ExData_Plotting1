data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "double", "double", "double", "double", "double", "double", "double"), na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | data == "2007-02-02")
times <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(data, times)
png("plot3.png")

# set up the plot
plot(data$times, data$Sub_metering_1, type="n", xlab="", ylab="Energy Submetering")

# draw lines
lines(data$times, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Sub_metering_1")
lines(data$times, data$Sub_metering_2, type="l", col="red", xlab="", ylab="Sub_metering_2")
lines(data$times, data$Sub_metering_3, type="l", col="blue", xlab="", ylab="Sub_metering_3")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()
