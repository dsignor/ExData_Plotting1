mydata <- read.table("C:/Users/Signor/Documents/household_power_consumption.txt", header=TRUE, 
                     sep=";",na.strings = "?",colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

DateTime <- paste(mydata$Date,mydata$Time,sep = " ")
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S",tz = "")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- cbind(mydata,DateTime)

newdata <- subset(mydata,mydata$Date == "2007-02-01" |  mydata$Date == "2007-02-02")
class(newdata$Date)
class(newdata$Time)
class(newdata$DateTime)

par(mfrow = c(1,1))

png(file = "plot1.png")

hist(newdata$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')

dev.off()