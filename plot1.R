# plot1.R - Histogram of Global Active Power

# Load Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

# Subset data for dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot to PNG
png("plot1.png", width = 480, height = 480)
hist(subset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
