NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
filtNEI=subset(NEI,fips == "24510")
emSums <-tapply(filtNEI$Emissions, filtNEI$year, sum)
png(filename = "plot2.png")
barplot( emSums,
         main=expression("Total Emissions of PM"[2.5],"In Baltimore"),
         xlab="Year",
         ylab=expression("Amount of PM"[2.5],"emitted, in tons"),
         col="Purple")
dev.off()