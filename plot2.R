#load data 
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
                   
#convert Date and Time varibles to Date and Time classes
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time,format="%H:%M:%S"), format="%H:%M:%S")

#subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#draw plot 2
par(mfcol = c(1, 1))
data$Global_active_power <- as.numeric(as.character((data$Global_active_power)))
y <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
plot(y, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#save png file
dev.copy(png, file = "plot2.png")
dev.off()