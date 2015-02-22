# Load ggplot2 library

library("ggplot2")

# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Subset data to Baltimore City, fips == 24510 and LA County, fips==06037, on-road 

NEI_Subset_OnRoad  <- NEI[NEI$fips=="24510"|NEI$fips=="06037" & NEI$type== "ON-ROAD", ]

# Aggregate data by year and location change location lable to name

TotalPM25ByYearAndFips <- aggregate(Emissions ~ year + fips, NEI_Subset_OnRoad, sum)
TotalPM25ByYearAndFips$fips[TotalPM25ByYearAndFips$fips=="24510"] <- "Baltimore City, MD"
TotalPM25ByYearAndFips$fips[TotalPM25ByYearAndFips$fips=="06037"] <- "LA County, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(TotalPM25ByYearAndFips, aes(year, Emissions, color=fips))
g <- g + geom_line(size=1.5) +
  xlab("Year") +
  ylab("Emissions (tons)") +
  ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore City v LA County, by Year"))
print(g)
dev.off()
