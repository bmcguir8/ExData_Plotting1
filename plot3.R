##this code uses lubridate and dyplr
##this code assumes that you have the unzipped file in your WD, and haven't
##changed the file name
plot3 <- {
  header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
  data <- read.table("household_power_consumption.txt", header = TRUE, 
                     na.strings = "?", sep = ";", skip = 66636, nrows = 2879) ##reads in select rows
  names(data) <- header
  data <- mutate(data, Date = as.character(data$Date), Time = as.character(data$Time),
                 Date.Time = paste(data$Date, data$Time))
  data <- mutate(data, Date.Time = dmy_hms(data$Date.Time))
  png(filename = "plot3.png")
  plot(data$Date.Time, data$Sub_metering_1, type = "l", xlab = "", 
       ylab = "Energy sub metering")
  points(data$Date.Time, data$Sub_metering_2, type = "l", col = "red")
  points(data$Date.Time, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1)
  dev.off()
}  
  