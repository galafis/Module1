# plot3.R - Energy sub metering

# Load Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

# Filter and transform
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datetime <- strptime(paste(subset$Date, subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot to PNG
png("plot3.png", width = 480, height = 480)
plot(datetime, subset$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(datetime, subset$Sub_metering_2, col = "red")
lines(datetime, subset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
