library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project1/ExData_Plotting1")

powerdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
filterdata <- filter(powerdata, Date == '1/2/2007' | Date == "2/2/2007", Global_active_power != '?')

numericdata <- as.numeric(as.character(filterdata$Global_active_power))


png(width=480, height=480, file="plot1.png")

par(mfrow=c(1,1))
hist(numericdata, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

