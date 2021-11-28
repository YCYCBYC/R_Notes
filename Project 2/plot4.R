#### plot4

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalcoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

library(ggplot2)

# open png device
png("plot4.png", width = 480, height = 480)

ggplot(totalcoal, aes(year, Emissions, col = type)) +
    geom_line() +
    geom_point() +
    ggtitle("total US missions by Type and Year") +
    ylab("total US emissions") +
    xlab("Year")

# close png device
dev.off()
