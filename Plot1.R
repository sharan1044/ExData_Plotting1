data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, tryFormats = c("%d/%m/%Y"))
data$Time <- chron(times = data$Time)
my_data <- subset(data, Date >= as.Date("2007-02-01"))
my_data <- subset(my_data, Date <= as.Date("2007-02-02"))
my_data$Global_active_power <- as.numeric(my_data$Global_active_power, na.rm = TRUE)
my_data$dt <- as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")


hist(my_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")


dev.copy(png, "Plot1.png")
dev.off()

