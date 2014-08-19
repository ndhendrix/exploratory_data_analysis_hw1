plot3 <- function() {
  #reads file into memory and selects only the dates of interest
  library(lubridate)
  data <- read.table("household_power_consumption.txt", sep=";", header=T)
  data$Date2 <- as.Date(data$Date, format="%d/%m/%Y")
  data.sub <- data[year(data$Date2)=="2007",]
  data.sub <- data.sub[month(data.sub$Date2)==02,]
  data.sub <- data.sub[mday(data.sub$Date2) %in% c(1,2),]
  rm(data)
  data.sub$Date <- strptime(paste(data.sub$Date, data.sub$Time), "%d/%m/%Y %H:%M:%S")
  
  #creates graphic
  png("plot2.png")
  with(data.sub,{
    plot(Date, Sub_metering_1, type="l", col="black")
    plot(Date, Sub_metering_2, type="l", col="red")
    plot(Date, Sub_metering_3, type="l", col="blue")
  })
  legend("topright", col=c("black", "red", "blue"))
#   , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}