#Read File
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Convert Date
data$fecha <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data$fechahora <- strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S")

#filter Data using Date
filtered <- data[data$fecha >= "2007-02-01" & data$fecha <= "2007-02-02", ]

#Plot 1
png(file="plot1.png",width=480,height=480)
hist(filtered$Global_active_power , col="red3", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()