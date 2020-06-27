library(dplyr)
library(ggplot2)

summary<-readRDS("summarySCC_PM25.rds")%>%
  filter(type=="ON-ROAD", fips==24510) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png("plot5.png", width = 480, height = 480)
plot<-qplot(data=summary, x=year, y=total)
plot+geom_smooth(method="lm")+ggtitle("Road Vehicle PM2.5 Emissions in Baltimore") +
  xlab("Year") + ylab("Annual Emissions (tons)")
dev.off()