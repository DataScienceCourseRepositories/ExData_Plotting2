NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
combinedData <-merge(NEI,SCC, by="SCC")

coal <- grepl("coal", combinedData$Short.Name, ignore.case = TRUE)
filtData <- combinedData[coal,]              
agg <-aggregate(Emissions ~ year, filtData, sum)
png(filename = "plot4.png")
g<-ggplot(agg, aes(year, Emissions))
g<- g+ geom_line()+ 
  labs(title = 'Total Emissions from Coal',
  x="Year",
  y=expression("Amount of PM"[2.5],"emitted, in tons"))
print(g)
dev.off()