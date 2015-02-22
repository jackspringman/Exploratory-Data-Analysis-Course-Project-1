# Load ggplot2 library

library("ggplot2")

# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Subset data to Baltimore City, fips == 24510 and on-road sources

NEI_Baltimore_OnRoad  <- NEI[NEI$fips=="24510" & NEI$type== "ON-ROAD", ]

# Aggregate data by year

TotalPM25ByYear <- aggregate(Emissions ~ year, NEI_Baltimore_OnRoad, sum)

# Create a plot showing On-Road emissions in Baltimore City from 1999 to 2008

png("plot5.png", width=640, height=480)
g <- ggplot(TotalPM25ByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Emissions (tons)") +
  ggtitle(expression("Total On-Road PM"[2.5]*" Emissions in Baltimore City, by Year"))
print(g)
dev.off()

