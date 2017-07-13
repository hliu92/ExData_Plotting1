## Read full data into R and convert variables
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_all$datetime <- strptime(paste(data_all$Date, data_all$Time), format = "%d/%m/%Y %T")

## Subset data for dates 2007-02-01 and 2007-02-02
data <- subset(data_all, (Date == "1/2/2007") | (Date == "2/2/2007"))

## Set device and mfrow
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## 1st plot
plot(d$datetime, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## 2nd plot
plot(d$datetime, d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## 3rd plot
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## 4th plot
plot(d$datetime, d$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close png device
dev.off()