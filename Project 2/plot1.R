#### plot1


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalNEI <- aggregate(Emissions ~ year, NEI, sum)

# open png device
png("plot1.png", width = 480, height = 480)

barplot(totalNEI$Emissions, xlab = 'Year', ylab = 'total emissions', 
        names.arg = totalNEI$year, main = 'plot1')

# close png device
dev.off()
