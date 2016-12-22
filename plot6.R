NEI <- readRDS("./summarySCC_PM25.rds")
#SCC <- readRDS("./Source_Classification_Code.rds")
combinedData <-merge(NEI,SCC, by="SCC")
filtNEI=subset(NEI,(fips == "24510" | fips == "06037") & type=="ON-ROAD")

agg <-aggregate(Emissions ~ year+fips, filtNEI, sum)
agg$fips[agg$fips=="24510"] <- "Baltimore, MD"
agg$fips[agg$fips=="06037"] <- "Los Angeles, CA"

png(filename = "plot6.png")
g<-ggplot(agg, aes(year, Emissions,color=fips),)
g<- g+ geom_line()+ 
  labs(title = 'Total Emissions from On Road',
       x="Year",
       y=expression("Amount of PM"[2.5],"emitted, in tons"))
print(g)
dev.off()