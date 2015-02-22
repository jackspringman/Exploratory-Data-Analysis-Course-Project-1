# Load ggplot2 library

library("ggplot2")

# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Subset data to Baltimore City, fips == 24510

NEI_Baltimore <- NEI[NEI$fips=="24510", ]

# Aggregate data by year and type (point, nonpoint, onroad, nonroad) of emission

TotalPM25ByYearandType <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)

# Create a plot of emissions in Baltimore City by type from 1999 to 2008

png("plot3.png", width=640, height=480)
g <- ggplot(TotalPM25ByYearandType, aes(year, Emissions, color=type))
g <- g + geom_line(size=1.5) +
  xlab("Year") +
  ylab("Emissions (tons)") +
  ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore City, by Type and Year"))
print(g)
dev.off()

