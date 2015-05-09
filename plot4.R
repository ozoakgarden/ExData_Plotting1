dataset <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
dataset <- subset(dataset, (Date == "1/2/2007") | (Date == "2/2/2007"))
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,3,2), oma=c(0,0,0,0), lty=1)
with (dataset, plot(datetime, Global_active_power, type="l", xlab = " ", 
                    ylab="Global Active Power"))
with (dataset, plot(datetime, Voltage, type="l"))
with (dataset, plot(datetime, Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering"))
with (dataset, lines(datetime, Sub_metering_2, type="l", col="red"))
with (dataset, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
with (dataset, plot(datetime, Global_reactive_power, type="l"))
dev.off()