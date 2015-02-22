# Read in RDS files

NEI <- readRDS("R Programming/summarySCC_PM25.rds")
SCC <- readRDS("R Programming/Source_Classification_Code.rds")

# Subset data to just Baltimore City, Maryland (fips == "24510")  

NEI_Baltimore <- NEI[NEI$fips=="24510", ]

TotalPM25ByYear <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

# Create bar plot to answer question as to whether total emissions have declined
# in Baltimore City, MD between 1999 and 2008

png('plot2.png')
barplot(height=TotalPM25ByYear$Emissions, names.arg=TotalPM25ByYear$year, 
xlab="Year", ylab="Emissions (tons)",
main=expression("Total PM"[2.5]*" Emissions in Baltimore City, by Year"))
dev.off()