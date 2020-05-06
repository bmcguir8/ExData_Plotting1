##this code uses lubridate and dyplr
##this code assumes that you have the unzipped file in your WD, and haven't
##changed the file name
plot2 <- {
  header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
  data <- read.table("household_power_consumption.txt", header = TRUE, 
                     na.strings = "?", sep = ";", skip = 66636, nrows = 2879) ##reads in select rows
  names(data) <- header
  data <- mutate(data, Date = as.character(data$Date), Time = as.character(data$Time),
                 Date.Time = paste(data$Date, data$Time))
  data <- mutate(data, Date.Time = dmy_hms(data$Date.Time))
  png(filename = "plot2.png")
  plot(data$Date.Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",
       type = "l")
  dev.off()
}  