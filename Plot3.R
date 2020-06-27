library(dplyr)
library(ggplot2)

grouped<-readRDS("summarySCC_PM25.rds") %>%
  filter(fips==24510) %>%
  group_by(year, type) %>%
  summarise(total = sum(Emissions))

png("plot3.png", width = 480, height = 960)
plot<-qplot(data=grouped, x=year, y=total) + facet_grid(type~.,scales="free_y") + 
  geom_smooth(method="lm") + ggtitle("PM2.5 Emissions by Source and Year in Baltimore") +
  ylab("Annual Emissions (tons)") + xlab("Year")
plot
dev.off()