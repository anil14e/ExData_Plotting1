#Read data
filedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)

#filter required data
newfiledata <- filedata[filedata$Date == "2/2/2007" | filedata$Date == "1/2/2007", ]

#plot
png(file="plot3.png",width = 480, height = 480, units = "px")
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_1,type = "p",ylab = "Energy sub metering", xlab = "",cex = 0)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_1,col="black")
par(new=TRUE)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_2,col="red")
par(new=TRUE)
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'), cex=0.75,border = "black")
dev.off()