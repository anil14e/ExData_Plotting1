#Read data
filedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)

#Filter required data
newfiledata <- filedata[filedata$Date == "2/2/2007" | filedata$Date == "1/2/2007", ]

#Plot

png(file="plot4.png",width = 480, height = 480, units = "px")
#divide page 2 X 2 for 4 plots
par(mfrow=c(2,2))

#plot1
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_active_power,type = "p", pch =19,cex=0.0, ylab = "Global Active Power", xlab = "")
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_active_power)

#plot2
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Voltage,type = "p", pch =19,cex=0.0, ylab = "Voltage", xlab = "datetime")
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Voltage)

#plot3
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_1,type = "p",ylab = "Energy sub metering", xlab = "",cex = 0)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_1,col="black")
par(new=TRUE)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_2,col="red")
par(new=TRUE)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'), cex=0.75, bty = 'n')

#plot4
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_reactive_power,type = "p", pch =19,cex=0, ylab = "Global_reactive_power", xlab = "datetime")
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_reactive_power)

dev.off()