file_name = "household_power_consumption.txt"
columns_to_read <- rep("NULL", 9)
columns_to_read[1] <- "character"
columns_to_read[3] <- "character"
columns_to_read[4] <- "character"
columns_to_read[5] <- "character"
columns_to_read[7] <- "character"
columns_to_read[8] <- "character"
columns_to_read[9] <- "character"

loaded_data <- read.table(file_name, colClasses = columns_to_read, blank.lines.skip = TRUE, na.strings = "?", sep = ";")

start_date <- "1/2/2007"
end_date <- "2/2/2007"

small_data <- loaded_data[(loaded_data$V1 == start_date | loaded_data$V1 == end_date),]

names(small_data) <- c("Date", "Global_active_power", "Global_reactive_power","Voltage","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

small_data$Global_active_power <- as.numeric(small_data$Global_active_power)
small_data$Global_reactive_power <- as.numeric(small_data$Global_reactive_power)
small_data$Voltage <- as.numeric(small_data$Voltage)
small_data$Sub_metering_1 <- as.numeric(small_data$Sub_metering_1)
small_data$Sub_metering_2 <- as.numeric(small_data$Sub_metering_2)
small_data$Sub_metering_3 <- as.numeric(small_data$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

attach(mtcars)
par(mfrow=c(2,2))


# sub 1-1

plot(small_data$Global_active_power, type = "l", ylab = "Global Active Power", xaxt='n', xlab = "")
at <- seq(from = 0, to = nrow(small_data), by = nrow(small_data)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

# sub 1-2

plot(small_data$Voltage, type = "l", xaxt='n', xlab = "datetime", ylab = "Voltage")
at <- seq(from = 0, to = nrow(small_data), by = nrow(small_data)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

# sub 2-1

plot(small_data$Sub_metering_1, type = "l", col = "black", xaxt='n', ylab= "Energy sub metering", xlab = "")
par(new = TRUE)
plot(small_data$Sub_metering_2, type = "l", col = "red", xaxt='n', axes = FALSE, ylim = range(c(small_data$Sub_metering_1, small_data$Sub_metering_2)), xaxt='n', ylab = '', xlab = "")
par(new = TRUE)
plot(small_data$Sub_metering_3, type = "l", col = "blue", xaxt='n', axes = FALSE, ylim = range(c(small_data$Sub_metering_1, small_data$Sub_metering_3)), xaxt='n', ylab = '', xlab = "")
at <- seq(from = 0, to = nrow(small_data), by = nrow(small_data)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1),bty = "n", xjust = 0, yjust = 0, seg.len = 2)




# sub 2-2
plot(small_data$Global_reactive_power, type = "l", xaxt='n', xlab = "datetime", ylab = "Global_reactive_power")
at <- seq(from = 0, to = nrow(small_data), by = nrow(small_data)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

dev.off()