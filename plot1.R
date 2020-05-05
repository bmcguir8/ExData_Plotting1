##this code uses lubridate and dyplr
##this code assumes that you have the unzipped file in your WD, and haven't
##changed the file name
plot1 <- {
  header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
  data <- read.table("household_power_consumption.txt", header = TRUE, 
       na.strings = "?", sep = ";", skip = 66636, nrows = 2879) ##reads in select rows
  names(data) <- header
  data <- mutate(data, Date = dmy(data$Date))
  hist(data$Global_active_power, col = "red", breaks = 12, main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
}