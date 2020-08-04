data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
data$Time <- chron(times = data$Time)
my_data <- subset(data, Date >= as.Date("2007-02-01"))
my_data <- subset(my_data, Date <= as.Date("2007-02-02"))
my_data$Global_active_power <- as.numeric(my_data$Global_active_power, na.rm = TRUE)
my_data$dt <- as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

plot(my_data$dt, my_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

plot(my_data$dt, my_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(my_data$dt, my_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(my_data$dt, my_data$Sub_metering_2, type = "l", col = "red")
lines(my_data$dt, my_data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = 1)


plot(my_data$dt, my_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "Plot4.png")
dev.off()