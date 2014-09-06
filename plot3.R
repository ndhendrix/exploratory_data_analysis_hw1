plot3 <- function() {
  #reads file into memory and selects only the dates of interest,
  #saved to a new dataframe, "data.sub"
  library(lubridate)
  data <- read.table("household_power_consumption.txt", sep=";", header=T)
  data$Date2 <- as.Date(data$Date, format="%d/%m/%Y")
  data.sub <- data[year(data$Date2)=="2007",]
  data.sub <- data.sub[month(data.sub$Date2)==02,]
  data.sub <- data.sub[mday(data.sub$Date2) %in% c(1,2),]
  
  #clears huge dataframe
  rm(data)
  
  #puts Date and the Sub_metering variables into useable formats
  data.sub$Date <- strptime(paste(data.sub$Date, data.sub$Time), "%d/%m/%Y %H:%M:%S")
  data.sub$Sub_metering_1 <- as.numeric(as.character(data.sub$Sub_metering_1))
  data.sub$Sub_metering_2 <- as.numeric(as.character(data.sub$Sub_metering_2))
  data.sub$Sub_metering_3 <- as.numeric(as.character(data.sub$Sub_metering_3))
    
  #creates graphic
  png("plot3.png")
  plot(data.sub$Date, data.sub$Sub_metering_1, type="l", col="black", xlab=" ", ylab="Energy sub metering")
  with(data.sub, lines(Date, Sub_metering_2, col="red"))
  with(data.sub, lines(Date, Sub_metering_3, col="blue"))
  legend("topright", lwd="1", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}