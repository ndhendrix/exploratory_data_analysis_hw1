plot1 <- function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=T)
  data$Date <- as.Date(data.$Date, format="%d/%m/%Y")
  data.sub <- data[year(data$Date)=="2007",]
  data.sub <- data.sub[month(data.sub$Date)==02,]
  data.sub <- data.sub[mday(data.sub$Date) %in% c(1,2),]
  rm(data)
  print(head(data.sub))
}