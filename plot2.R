#Read data
filedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)

#filter required data
newfiledata <- filedata[filedata$Date == "2/2/2007" | filedata$Date == "1/2/2007", ]

#plot
png(file="plot2.png",width = 480, height = 480, units = "px")
plot(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_active_power,type = "p", pch =19,cex=0.0, ylab = "Global Active Power(kilowatts)", xlab = "")
lines(strptime(paste(newfiledata$Date, " ", newfiledata$Time), "%d/%m/%Y %H:%M:%S"),newfiledata$Global_active_power)
dev.off()
