# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Aggregate PM 2.5 emissions for 1999, 2002, 2005, 2008

TotalPM25ByYear <- aggregate(Emissions ~ year, NEI, sum)

# Plot aggregated emissions as a bar chart to answer whether total US emissions 
# have decreased between 1999 and 2008

png('plot1.png')
barplot(height=TotalPM25ByYear$Emissions,
names.arg=TotalPM25ByYear$year, xlab="Year", 
ylab="Emissions (tons)", main=expression("Total PM"[2.5]*" Emissions, by Year"))
dev.off()