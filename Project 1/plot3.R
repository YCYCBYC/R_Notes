#### Week 1 Project 1 plot3 ####

## Load data
rawdata <- read.csv('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')

# Change date format
rawdata$datetime <- as.POSIXct(paste(rawdata$Date, rawdata$Time), format = "%d/%m/%Y %H:%M:%S")

# Choose date from 2007-02-01 to 2007-02-02
subdata <- rawdata[(rawdata$datetime >= '2007-02-01') & (rawdata$datetime <= '2007-02-03'), ]

# Create png 3
png("plot3.png", width = 480, height = 480)

# Plot 3
plot(subdata$datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col="blue")

legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
