plot4 <- function() {
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
  png("plot4.png")
  par(mfrow = c(2,2))
  
  #upper left plot
  plot(data.sub$Date, as.numeric(as.character(data.sub$Global_active_power)), type="l", col="black", xlab=" ", ylab="Global Active Power")
  
  #upper right plot
  plot(data.sub$Date, as.numeric(as.character(data.sub$Voltage)), type="l", col="black", xlab="datetime", ylab="Voltage")
  
  #lower left plot
  plot(data.sub$Date, as.numeric(as.character(data.sub$Sub_metering_1)), type="l", col="black", xlab=" ", ylab="Energy sub metering")
  with(data.sub, lines(Date, as.numeric(as.character(Sub_metering_2)), col="red"))
  with(data.sub, lines(Date, as.numeric(as.character(Sub_metering_3)), col="blue"))
  legend("topright", lwd="1", bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #lower right plot
  plot(data.sub$Date, as.numeric(as.character(data.sub$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.off()
}