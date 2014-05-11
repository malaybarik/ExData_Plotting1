##Reading the household power data
elect <- read.table("household_power_consumption.txt", header = T, sep = ";", colClass="character")

##Subsetting data for 01/02/2007 and 02/02/2007
betElect <- subset(elect, (elect$Date == "1/2/2007" | elect$Date == "2/2/2007"))
betElect$Date <- paste (betElect$Date, betElect$Time)

##Converting Date string to Date format
betElect$Date <- strptime(betElect$Date, "%d/%m/%Y %H:%M:%S")

##Converting Global_active_power to numeric variable 
betElect$Global_active_power <- as.numeric(betElect$Global_active_power)

##Opening a PNG file device 
png(file="Plot2.png", width=480, height=480)

##Plotting histogram
plot(betElect$Date, betElect$Global_active_power, type = "l", main="", ylab = "Global Active Power (killowatts)", xlab= "")

##Closing graphic device
dev.off()
