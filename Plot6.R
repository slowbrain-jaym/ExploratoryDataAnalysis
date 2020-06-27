library(dplyr)
library(ggplot2)

summary<-readRDS("summarySCC_PM25.rds")%>%
  filter(type=="ON-ROAD", fips %in% c("24510", "06037")) %>%
  group_by(year, fips) %>%
  summarise(total = sum(Emissions)) %>%
  mutate(fips = gsub("24510", "Baltimore", fips)) %>%
  mutate(fips = gsub("06037", "LA", fips))

png("plot6.png", width = 480, height = 480)
plot<-qplot(data=summary, x=year, y=total)
plot+geom_smooth(method="lm")+ggtitle("Road Vehicle PM2.5 Emissions in Baltimore and LA") +
  xlab("Year") + ylab("Annual Emissions (tons)") + 
  facet_grid(fips~., scales = "free_y")
dev.off()