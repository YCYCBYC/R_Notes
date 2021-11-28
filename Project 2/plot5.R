#### plot5

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Bmotors <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
Bdata <- aggregate(Emissions ~ year, Bmotors, sum)

library(ggplot2)

# open png device
png("plot5.png", width = 480, height = 480)

ggplot(Bdata, aes(year, Emissions)) +
    geom_line() +
    geom_point() +
    ggtitle("baltimore motor vehicle missions by Year") +
    ylab("motor vehicle missions") +
    xlab("Year")

# close png device
dev.off()
