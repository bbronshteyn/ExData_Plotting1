epcData <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings = '?')
epcDataSub <- subset(epcData,Date == "1/2/2007" | Date == "2/2/2007")
epcDataSub$Datetime <- strptime(paste(epcDataSub$Date,' ',epcDataSub$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width = 480,height = 480)

par(mfcol = c(2,2))

#plot 1,1
with(epcDataSub, plot(Datetime, Global_active_power, type = 'l',ylab = "Global Active Power (kilowatts)",xlab = ''))

#plot 2,1
with(epcDataSub, plot(Datetime, Sub_metering_1, type = 'n',ylab = "Energy sub metering",xlab = ''))
with(epcDataSub, lines(Datetime, Sub_metering_1, col="black"))
with(epcDataSub, lines(Datetime, Sub_metering_2, col="red"))
with(epcDataSub, lines(Datetime, Sub_metering_3, col="blue"))
legend("topright",names(epcDataSub)[7:9],lty=1,col=c('black','red','blue'),bty = 'n', cex = 0.85)

#plot 1,2
with(epcDataSub, plot(Datetime, Voltage, type = 'l',ylab = "Voltage",xlab = 'datetime'))

#plot 2,2
with(epcDataSub, plot(Datetime, Global_reactive_power, type = 'l',ylab = "Global_reactive_power",xlab = 'datetime'))

dev.off()