## Exploratory Data Analysis 
## Course Project 1
## Plot 1


# read Electric Power Consumption data 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset data from the dates 2007-02-01 and 2007-02-02
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# save as png file
hist(subdata$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
