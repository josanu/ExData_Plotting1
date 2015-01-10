#Read File
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Convert Date
data$fecha <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data$fechahora <- strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S")

#filter Data using Date
filtered <- data[data$fecha >= "2007-02-01" & data$fecha <= "2007-02-02", ]

#Plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))

# plot 1 (NW)
plot(filtered$fechahora, filtered$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# plot 2 (NE)
plot(filtered$fechahora, filtered$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(filtered$fechahora, filtered$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(filtered$fechahora, filtered$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2",    col = "red")
points(filtered$fechahora, filtered$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3",    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" )

# plot 4 (SE)
plot(filtered$fechahora, filtered$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))  
dev.off()  