#Read File
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Convert Date
data$fecha <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data$fechahora <- strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S")

#filter Data using Date
filtered <- data[data$fecha >= "2007-02-01" & data$fecha <= "2007-02-02", ]

#Plot 3
png(file="plot3.png",width=480,height=480)
  plot(filtered$fechahora, filtered$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(filtered$fechahora, filtered$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(filtered$fechahora, filtered$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off() 