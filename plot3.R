#Change language settings
Sys.setenv("LANGUAGE"="EN")
Sys.setlocale("LC_TIME", "English")

#load data 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#convert Date and Time varibles to Date and Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"), format="%H:%M:%S")

#subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#draw plot 3
png(file = "plot3.png", bg="transparent")
par(mfcol = c(1, 1))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
y <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
plot(y, data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(y, data$Sub_metering_2, col="red")
lines(y, data$Sub_metering_3, col="blue")
legend("topright", lwd=c(1,1),col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()