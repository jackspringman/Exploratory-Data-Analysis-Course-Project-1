# Load ggplot2 library

library("ggplot2")

# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Merge files using SCC column

NEISCC <- merge(NEI, SCC, by="SCC")

# Subset to where coal is source 

coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCC_coal <- NEISCC[coal, ]

TotalPM25ByYear <- aggregate(Emissions ~ year, NEISCC_coal, sum)

# Create a plot showing change in coal emissions from 1999 to 2008

png("plot4.png", width=640, height=480)
g <- ggplot(TotalPM25ByYear, aes(factor(year), Emissions))
g <- g + geom_bar(colour="grey", stat="identity") +
  xlab("Year") +
  ylab("Emissions (tons)") +
  ggtitle("Total PM25 Emissions from Coal Sources, by Year")
print(g)
dev.off()