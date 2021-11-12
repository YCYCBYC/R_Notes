#### Week 1 Project 1 plot2 ####

## Load data
rawdata <- read.csv('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')

# Change date format
rawdata$datetime <- as.POSIXct(paste(rawdata$Date, rawdata$Time), format = "%d/%m/%Y %H:%M:%S")

# Choose date from 2007-02-01 to 2007-02-02
subdata <- rawdata[(rawdata$datetime >= '2007-02-01') & (rawdata$datetime <= '2007-02-03'), ]

# Create png 2
png("plot2.png", width = 480, height = 480)

# Plot 2
plot(x = subdata$datetime, y = subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
