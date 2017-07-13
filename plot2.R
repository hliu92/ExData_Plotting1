## Read full data into R and convert variables
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_all$datetime <- strptime(paste(data_all$Date, data_all$Time), format = "%d/%m/%Y %T")

## Subset data for dates 2007-02-01 and 2007-02-02
data <- subset(data_all, (Date == "1/2/2007") | (Date == "2/2/2007"))

## Plot using png device
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()