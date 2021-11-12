#### Week 1 Project 1 plot1 ####

## Load data
rawdata <- read.csv('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')

# Change date format
rawdata$datetime <- as.POSIXct(paste(rawdata$Date, rawdata$Time), format = "%d/%m/%Y %H:%M:%S")

# Choose date from 2007-02-01 to 2007-02-02
subdata <- rawdata[(rawdata$datetime >= '2007-02-01') & (rawdata$datetime <= '2007-02-02'), ]

# Create png 1
png("plot1.png", width = 480, height = 480)

# Plot 1
hist(subdata$Global_active_power, main = 'Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency', col='Red')
dev.off()




