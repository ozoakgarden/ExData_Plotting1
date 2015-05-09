dataset <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
dataset <- subset(dataset, (Date == "1/2/2007") | (Date == "2/2/2007"))
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(as.numeric(dataset$Global_active_power), col ="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()