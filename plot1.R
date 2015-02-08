#Read data from input file
filedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)

#filter data for required dates
newfiledata <- filedata[filedata$Date == "2/2/2007" | filedata$Date == "1/2/2007", ]

#plot histogram
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(newfiledata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()