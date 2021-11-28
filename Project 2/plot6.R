#### plot5

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BLAmotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
BLAdata <- aggregate(Emissions ~ year + fips, BLAmotors, sum)

library(ggplot2)

# open png device
png("plot6.png", width = 480, height = 480)

ggplot(BLAdata, aes(year, Emissions, col = fips)) +
    geom_line() +
    geom_point() +
    ggtitle("baltimore and LA motor vehicle missions by Year") +
    scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
    ylab("motor vehicle missions") +
    xlab("Year")

# close png device
dev.off()
