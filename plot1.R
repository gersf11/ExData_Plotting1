file_name = "household_power_consumption.txt"
columns_to_read <- rep("NULL", 9)
columns_to_read[1] <- "character"
columns_to_read[3] <- "character"

loaded_data <- read.table(file_name, colClasses = columns_to_read, blank.lines.skip = TRUE, na.strings = "?", sep = ";")

start_date <- "1/2/2007"
end_date <- "2/2/2007"

small_data <- loaded_data[(loaded_data$V1 == start_date | loaded_data$V1 == end_date),]
names(small_data) <- c("Date", "Global_active_power")

png("plot1.png", width = 480, height = 480)
hist(as.numeric(small_data$Global_active_power), col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()