##Reading the household power data
elect <- read.table("household_power_consumption.txt", header = T, sep = ";", colClass="character")

##Subsetting data for 01/02/2007 and 02/02/2007
betElect <- subset(elect, (elect$Date == "1/2/2007" | elect$Date == "2/2/2007"))
betElect$Date <- paste (betElect$Date, betElect$Time)

##Converting Date string to Date format
betElect$Date <- strptime(betElect$Date, "%d/%m/%Y %H:%M:%S")

##Converting Global_active_power to numeric variable 
betElect$Global_active_power <- as.numeric(betElect$Global_active_power)
betElect$Voltage <- as.numeric(betElect$Voltage)
betElect$Global_reactive_power <- as.numeric(betElect$Global_reactive_power)
betElect$Sub_metering_1 <- as.numeric(betElect$Sub_metering_1)
betElect$Sub_metering_2 <- as.numeric(betElect$Sub_metering_2)
betElect$Sub_metering_3 <- as.numeric(betElect$Sub_metering_3)

##Opening a PNG file device 
png(file="Plot4.png", width=480, height=480)

par(mfrow=c(2,2))

##Plotting Global Active Power
plot(betElect$Date, betElect$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##Plotting Voltage
plot(betElect$Date, betElect$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Plotting sub_meterings
plot(betElect$Date, betElect$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(betElect$Date, betElect$Sub_metering_1)
lines(betElect$Date, betElect$Sub_metering_2, col="blue")
lines(betElect$Date, betElect$Sub_metering_3, col="red")
legend("topright", pch='_', box.lwd=0,col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plotting Global_Reactive_Power
plot(betElect$Date, betElect$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Closing graphic device
dev.off()
