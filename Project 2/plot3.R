#### plot3

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510")
baltimoretype <- aggregate(Emissions ~ year + type, baltimore, sum)
library(ggplot2)

# open png device
png("plot3.png", width = 480, height = 480)

ggplot(baltimoretype, aes(year, Emissions, col = type)) +
    geom_line() +
    geom_point() +
    ggtitle("total baltimore missions by Type and Year") +
    ylab("total baltimore emissions") +
    xlab("Year")

# close png device
dev.off()
