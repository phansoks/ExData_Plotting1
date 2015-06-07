#load data 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#convert Date and Time varibles to Date and Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"), format="%H:%M:%S")

#subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#draw plot 4
y <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
par(mfcol = c(2, 2))
#first plot (2)
data$Global_active_power <- as.numeric(as.character((data$Global_active_power)))
plot(y, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#second plot (3)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
plot(y, data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(y, data$Sub_metering_2, col="red")
lines(y, data$Sub_metering_3, col="blue")
#legend("topright" , lwd=c(1,1),col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.7)
#legend("topright", lwd=c(1,1),col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n" , cex=0.8)
legend("topright", lwd=c(1,1),col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n")

#third plot
data$Voltage <- as.numeric(as.character(data$Voltage))
plot(y, data$Voltage, type="l", ylab = "Voltage", xlab="datetime")

#fourth plot
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
plot(y, data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()