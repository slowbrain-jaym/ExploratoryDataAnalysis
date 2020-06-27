PM25<-readRDS("summarySCC_PM25.rds")

y1999<-filter(PM25, year==1999, fips==24510)
y2002<-filter(PM25, year==2002, fips==24510)
y2005<-filter(PM25, year==2005, fips==24510)
y2008<-filter(PM25, year==2008, fips==24510)
years<-c(1999,2002,2005,2008)
sums<-c(sum(y1999$Emissions),sum(y2002$Emissions),sum(y2005$Emissions),
        sum(y2008$Emissions))

png("plot2.png", width = 480, height = 480)
plot(years,sums, main="Total PM2.5 Emissions in Baltimore", 
     xlab="Year", ylab="Annual Emissions (tons)")
dev.off()