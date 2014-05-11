##Reading the household power data
elect <- read.table("household_power_consumption.txt", header = T, sep = ";", colClass="character")

##Subsetting data for 01/02/2007 and 02/02/2007
betElect <- subset(elect, (elect$Date == "1/2/2007" | elect$Date == "2/2/2007"))
betElect$Date <- paste (betElect$Date, betElect$Time)

##Converting Date string to Date format
betElect$Date <- strptime(betElect$Date, "%d/%m/%Y %H:%M:%S")

##Converting Global_active_power to numeric variable 
betElect$Sub_metering_1 <- as.numeric(betElect$Sub_metering_1)
betElect$Sub_metering_2 <- as.numeric(betElect$Sub_metering_2)
betElect$Sub_metering_3 <- as.numeric(betElect$Sub_metering_3)

##Opening a PNG file device 
png(file="Plot3.png", width=480, height=480)

##Plotting submeterings
plot(betElect$Date, betElect$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(betElect$Date, betElect$Sub_metering_1)
lines(betElect$Date, betElect$Sub_metering_2, col="blue")
lines(betElect$Date, betElect$Sub_metering_3, col="red")
legend("topright", pch='_', col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Closing graphic device
dev.off()
