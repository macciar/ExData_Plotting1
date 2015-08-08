#Reads unziped file located in current working directory
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE, dec=".")

#Converts Date column to date
epc$Date = as.Date(epc$Date, format = "%d/%m/%Y")

#Creates subset with data from the dates 2007-02-01 and 2007-02-02
subSetepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02", ]

#Creates dateTime pasting Date and Time columns
dateTime <- strptime(paste(subSetepc$Date, subSetepc$Time), "%Y-%m-%d %H:%M:%S")

#Converts Global_active_power column to numeric
subSetepc$Global_active_power = as.numeric(subSetepc$Global_active_power)

#Converts Voltage column to numeric
subSetepc$Voltage = as.numeric(subSetepc$Voltage)

#Converts Sub_metering_1 column to numeric
subSetepc$Sub_metering_1 = as.numeric(subSetepc$Sub_metering_1)

#Converts Sub_metering_2 column to numeric
subSetepc$Sub_metering_2 = as.numeric(subSetepc$Sub_metering_2)

#Converts Sub_metering_3 column to numeric
subSetepc$Sub_metering_3 = as.numeric(subSetepc$Sub_metering_3)

#Converts Global_reactive_power column to numeric
subSetepc$Global_reactive_power = as.numeric(subSetepc$Global_reactive_power)

#Opens png device and creates 'plot4.png' file in my working directory
png("plot4.png", width=480, height=480)

#Creates multiple plots and sends to the file png (no graphic appears on screen)
par(mfrow = c(2, 2), mar = c(6, 4, 4, 2), oma = c(0, 0, 2, 0))

with(subSetepc, {
   	plot(dateTime,subSetepc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
	plot(dateTime,subSetepc$Voltage, type="l", xlab="datetime", ylab="Voltage")
 	plot(dateTime,subSetepc$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
	points(x=dateTime, y=subSetepc$Sub_metering_2, col="red", type="l")
	points(x=dateTime, y=subSetepc$Sub_metering_3, col="blue", type="l")
	legend("topright",lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
	plot(dateTime,subSetepc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

#Closes the png file device
dev.off()

