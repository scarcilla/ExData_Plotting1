## Exploratory Data Analysis 
## Course Project 1
## Plot 4


# read Electric Power Consumption data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# convert the Date and Time variables to Date/Time classes
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$completedate <- paste(subdata$Date, subdata$Time)
subdata$completedate <- strptime(subdata$completedate, "%Y-%m-%d %H:%M:%S")

# plot
par(mfrow=c(2,2))
plot(subdata$completedate, subdata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(subdata$completedate, subdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(subdata$completedate, subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subdata$completedate, subdata$Sub_metering_2, col = "red")
lines(subdata$completedate, subdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",
       lty = 1, lwd = 1, col = c("black", "red", "blue"), cex = 0.9)
plot(subdata$completedate, subdata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

# save as png file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
