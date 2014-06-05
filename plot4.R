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

png(file = "plot4.png")

par(mfrow = c(2, 2))
plot(newdata$DateTime,newdata$Global_active_power,type="l",ylab='Global Active Power (kilowatts)',xlab = " ")
plot(newdata$DateTime,newdata$Voltage,type="l",ylab='Voltage',xlab = "datetime")
plot(newdata$DateTime,newdata$Sub_metering_1,ylab = "Energy sub metering",xlab = " ", 
     type = "n")
points(newdata$DateTime, newdata$Sub_metering_1, col = "black",type="l")
points(newdata$DateTime, newdata$Sub_metering_2, col = "red",type="l")
points(newdata$DateTime, newdata$Sub_metering_3, col = "blue",type="l")
legend("topright", inset=.0005,cex=.60,col = c("black", "red","blue"),
       xjust = 1,yjust=0,bty="n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1.5,1.5,1.5))
plot(newdata$DateTime,newdata$Global_reactive_power,type="l",ylab='Global_reactive_power',xlab = " ")

dev.off()