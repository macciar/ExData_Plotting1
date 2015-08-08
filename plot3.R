#Reads unziped file located in current working directory
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE, dec=".")

#Converts Date column to date
epc$Date = as.Date(epc$Date, format = "%d/%m/%Y")

#Creates subset with data from the dates 2007-02-01 and 2007-02-02
subSetepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02", ]

#Creates dateTime pasting Date and Time columns
dateTime <- strptime(paste(subSetepc$Date, subSetepc$Time), "%Y-%m-%d %H:%M:%S")

#Converts Sub_metering_1 column to numeric
subSetepc$Sub_metering_1 = as.numeric(subSetepc$Sub_metering_1)

#Converts Sub_metering_2 column to numeric
subSetepc$Sub_metering_2 = as.numeric(subSetepc$Sub_metering_2)

#Converts Sub_metering_3 column to numeric
subSetepc$Sub_metering_3 = as.numeric(subSetepc$Sub_metering_3)

#Opens png device and creates 'plot3.png' file in my working directory
png("plot3.png", width=480, height=480)

#Creates plot and sends to the file png (no graphic appears on screen)
plot(dateTime,subSetepc$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
points(x=dateTime, y=subSetepc$Sub_metering_2, col="red", type="l")
points(x=dateTime, y=subSetepc$Sub_metering_3, col="blue", type="l")
legend("topright",lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Closes the png file device
dev.off()
