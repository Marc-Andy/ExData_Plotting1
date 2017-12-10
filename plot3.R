setwd("C:/Users/Marc-Andy/Desktop/Coursera")

datafile <- "./data/household_power_consumption.txt"

##Find the number of minutes between 17/12/2006 17H24m;00 and 31/01/2007 = 66636
## Number of minutes per day = 1440, thus 2880 minutes for 2 days
## Read 69516 rows but skip the first 66636 rows 


data <- read.table(datafile, nrows = 69516, header = TRUE, sep = ";", stringsAsFactors = FALSE)[-(1:66636), ]
gap <- as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(data$Sub_metering_1)
plot(datetime, sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
sub_metering_2 <- as.numeric(data$Sub_metering_2)
lines(datetime, sub_metering_2, type = "l", col = "red")
sub_metering_3 <- as.numeric(data$Sub_metering_3)
lines(datetime, sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), height= 10, width = 8)

dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()