## Exploratory Data Analysis 
## Course Project 1
## Plot 2


# read Electric Power Consumption data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# convert the Date and Time variables to Date/Time classes
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$completedate <- paste(subdata$Date, subdata$Time)
subdata$completedate <- strptime(subdata$completedate, "%Y-%m-%d %H:%M:%S")

# plot
plot(subdata$completedate, subdata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# save as png file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
