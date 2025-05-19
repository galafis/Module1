# plot2.R

# Load library (optional)
# library(datasets)

# Baca data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

# Ubah format kolom Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Ambil data hanya untuk 1 dan 2 Februari 2007
data_sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Gabungkan Date dan Time jadi DateTime POSIX
datetime <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

# Konversi Global_active_power ke numerik
data_sub$Global_active_power <- as.numeric(as.character(data_sub$Global_active_power))

# Buat plot garis
png("plot2.png", width = 480, height = 480)
plot(datetime, data_sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

