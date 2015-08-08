#Reads the unziped file located in current working directory
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE, dec=".")

#Converts Date column to date
epc$Date = as.Date(epc$Date, format = "%d/%m/%Y")

#Creates subset with data from the dates 2007-02-01 and 2007-02-02
subSetepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02", ]

#Converts Global_active_power column to numeric
subSetepc$Global_active_power = as.numeric(subSetepc$Global_active_power)

#Opens png device and creates 'plot1.png' file in my working directory
png("plot1.png", width=480, height=480)

#Creates histogram and sends to the file png (no graphic appears on screen)
hist(subSetepc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Closes the png file device
dev.off()
