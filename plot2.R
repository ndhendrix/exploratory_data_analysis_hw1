plot2 <- function() {
  #reads file into memory and selects only the dates of interest,
  #puts into a new dataframe, "data.sub"
  library(lubridate)
  data <- read.table("household_power_consumption.txt", sep=";", header=T)
  data$Date2 <- as.Date(data$Date, format="%d/%m/%Y")
  data.sub <- data[year(data$Date2)=="2007",]
  data.sub <- data.sub[month(data.sub$Date2)==02,]
  data.sub <- data.sub[mday(data.sub$Date2) %in% c(1,2),]
  
  #removes huge dataframe
  rm(data)
  
  #casts Date and Global_active_power into a useable format
  data.sub$Date <- strptime(paste(data.sub$Date, data.sub$Time), "%d/%m/%Y %H:%M:%S")
  data.sub$Global_active_power <- as.numeric(as.character(data.sub$Global_active_power))
  
  #creates graphic
  png("plot2.png")
  plot(data.sub$Date, data.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}