library(dplyr)
library(ggplot2)

summary<-left_join(readRDS("summarySCC_PM25.rds"), 
                   readRDS("Source_Classification_Code.rds")) %>%
  mutate(Short.Name=tolower(Short.Name)) %>%
  filter(grepl("coal", Short.Name)) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png("plot4.png", width = 480, height = 480)
plot<-qplot(data=summary, x=year, y=total)
plot+geom_smooth(method="lm")+ggtitle("Coal Related PM2.5 Emissions between for the USA") +
  xlab("Year") + ylab("Annual Emissions (tons)")
dev.off()