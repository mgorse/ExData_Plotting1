data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "double", "double", "double", "double", "double", "double", "double"), na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | data == "2007-02-02")

png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", border="red")
dev.off()
