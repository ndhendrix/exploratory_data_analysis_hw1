plot1 <- function() {
  #reads file into memory and selects only the dates of interest
  data <- read.table("household_power_consumption.txt", sep=";", header=T)
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data.sub <- data[year(data$Date)=="2007",]
  data.sub <- data.sub[month(data.sub$Date)==02,]
  data.sub <- data.sub[mday(data.sub$Date) %in% c(1,2),]
  rm(data)
  data.sub$Time <- strptime(data.sub$Time, format="%H:%M:%S")
  
  #creates graphic
  png("plot1.png")
  hist(as.numeric(as.character(data.sub$Global_active_power)), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red", breaks=15)
  dev.off()
}