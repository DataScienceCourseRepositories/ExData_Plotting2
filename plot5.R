NEI <- readRDS("./summarySCC_PM25.rds")
#SCC <- readRDS("./Source_Classification_Code.rds")
combinedData <-merge(NEI,SCC, by="SCC")
filtNEI=subset(NEI,fips == "24510" & type=="ON-ROAD")

agg <-aggregate(Emissions ~ year, filtNEI, sum)
png(filename = "plot5.png")
g<-ggplot(agg, aes(year, Emissions))
g<- g+ geom_line()+ 
  labs(title = 'Total Emissions from On Road in Baltimore',
       x="Year",
       y=expression("Amount of PM"[2.5],"emitted, in tons"))
print(g)
dev.off()