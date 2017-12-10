setwd("C:/Users/Marc-Andy/Desktop/Coursera")

datafile <- "./data/household_power_consumption.txt"

##Find the number of minutes between 17/12/2006 17H24m;00 and 31/01/2007 = 66636
## Number of minutes per day = 1440, thus 2880 minutes for 2 days
## Read 69516 rows but skip the first 66636 rows 

data <- read.table(datafile, nrows = 69516, header = TRUE, sep = ";", stringsAsFactors = FALSE)[-(1:66636), ]

gap <- as.numeric(data$Global_active_power)

hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png", height = 480, width = 480)

dev.off
