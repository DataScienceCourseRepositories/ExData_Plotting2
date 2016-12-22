NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
filtNEI=subset(NEI,fips == "24510")
agg <-aggregate(Emissions ~ year +type, filtNEI, sum)
png(filename = "plot3.png")
g<-ggplot(agg, aes(year, Emissions, color=type))
g<- g+ geom_line()+ labs(title=expression("Total Emissions of PM"[2.5]," from Coal, In Baltimore"),
                         x="Year",
                         y=expression("Amount of PM"[2.5],"emitted, in tons"))
print(g)
dev.off()