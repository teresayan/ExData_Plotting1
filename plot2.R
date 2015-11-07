
library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project1/ExData_Plotting1")

powerdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
filterdata <- filter(powerdata, Date == '1/2/2007' | Date == "2/2/2007", Global_active_power != '?')


# plot2

png(width=480, height=480, file="plot2.png")

mfilterdata <- mutate(filterdata, datetime = paste(Date,Time), active_power = as.numeric(as.character(Global_active_power)), my_voltage = as.numeric(as.character(Voltage)), my_reactive_power = as.numeric(as.character(Global_reactive_power)), my_sub_metering_1 = as.numeric(as.character(Sub_metering_1)), my_sub_metering_2 = as.numeric(as.character(Sub_metering_2)), my_sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

par(mfrow=c(1,1))
with(mfilterdata, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S") ,active_power, type="l", xlab ="", ylab="Global Active Power (kilowatts)"))

dev.off()


