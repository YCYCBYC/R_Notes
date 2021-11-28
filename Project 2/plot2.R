#### plot2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

# open png device
png("plot2.png", width = 480, height = 480)

barplot(totalBaltimore$Emissions, xlab = 'Year', ylab = 'total baltimore emissions', 
        names.arg = totalBaltimore$year, main = 'plot2')

# close png device
dev.off()
