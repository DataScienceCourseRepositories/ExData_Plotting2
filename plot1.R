NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
emSums <-tapply(NEI$Emissions, NEI$year, sum)
png(filename = "plot1.png")
barplot( emSums,
         main=expression("Total Emissions of PM"[2.5]),
         xlab="Year",
         ylab=expression("Amount of PM"[2.5],"emitted, in tons"),
         col="red")
dev.off()