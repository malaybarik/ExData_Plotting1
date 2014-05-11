##Reading the household power data
elect <- read.table("household_power_consumption.txt", header = T, sep = ";", colClass="character")

##Subsetting data for 01/02/2007 and 02/02/2007
betElect <- subset(elect, (elect$Date == "1/2/2007" | elect$Date == "2/2/2007"))

##Converting Global_active_power to numeric variable 
betElect$Global_active_power <- as.numeric(betElect$Global_active_power)

##Opening a PNG file device 
png(file="Plot1.png")

##Plotting histogram
hist(betElect$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (killowatts)")

##Closing graphic device
dev.off()
