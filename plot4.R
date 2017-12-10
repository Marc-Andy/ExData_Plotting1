setwd("C:/Users/Marc-Andy/Desktop/Coursera")

datafile <- "./data/household_power_consumption.txt"

##Find the number of minutes between 17/12/2006 17H24m;00 and 31/01/2007 = 66636
## Number of minutes per day = 1440, thus 2880 minutes for 2 days
## Read 69516 rows but skip the first 66636 rows 


data <- read.table(datafile, nrows = 69516, header = TRUE, sep = ";", stringsAsFactors = FALSE)[-(1:66636), ]

datetime <- strptime(paste(data$Date, data$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2), mar = c(4,4,2,1))

gap <- as.numeric(data$Global_active_power)
plot(datetime, gap, type= "l", xlab = "", ylab = "Global Active Power kilowatts)")

sub_metering_1 <- as.numeric(data$Sub_metering_1)
plot(datetime, sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
sub_metering_2 <- as.numeric(data$Sub_metering_2)
lines(datetime, sub_metering_2, type = "l", col = "red")
sub_metering_3 <- as.numeric(data$Sub_metering_3)
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", col = c("black", "red", "blue"), cex = 1)

voltage <- as.numeric(data$Voltage)
plot(datetime, voltage, type= "l", xlab = "datetime", ylab = "Voltage")

grp <- as.numeric(data$Global_reactive_power)
plot(datetime, grp, type= "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()
