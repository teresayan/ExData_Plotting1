library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project1/ExData_Plotting1")

powerdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
filterdata <- filter(powerdata, Date == '1/2/2007' | Date == "2/2/2007", Global_active_power != '?')


mfilterdata <- mutate(filterdata, datetime = paste(Date,Time), active_power = as.numeric(as.character(Global_active_power)), my_voltage = as.numeric(as.character(Voltage)), my_reactive_power = as.numeric(as.character(Global_reactive_power)), my_sub_metering_1 = as.numeric(as.character(Sub_metering_1)), my_sub_metering_2 = as.numeric(as.character(Sub_metering_2)), my_sub_metering_3 = as.numeric(as.character(Sub_metering_3)))



# plot 4

par(mfcol = c(2, 2), cex.lab=0.8, 
with(mfilterdata, {
    plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),active_power, type="l", xlab ="", ylab="Global Active Power")
    plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), my_sub_metering_1, type="l", col="black", xlab="", ylab="Energy Sub metering")
    lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), my_sub_metering_2, type="l", col="red")
    lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), my_sub_metering_3, type="l", col="blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,lwd=1, cex=1, bty="n")
    plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), my_voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
    plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), my_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reative_power")}))

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()

