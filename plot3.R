
# starting

print("Starting")


#read and prepare data

h <- read.csv("~/household_power_consumption.txt", sep=";", stringsAsFactor=FALSE)

h<-h[h$Date=="1/2/2007" | h$Date=="2/2/2007",]

datetime = paste(h$Date, h$Time)

h$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

power <- as.numeric(h$Global_active_power)

h$Global_active_power <- power



# plot

jpeg(filename = "plot3.jpg", width = 480, height = 480)


plot(h$DateTime,h$Sub_metering_1, type="l", col="black", main="", xlab="", ylab="Energy sub metering")
lines(h$DateTime,h$Sub_metering_2, col="red")
lines(h$DateTime,h$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()

print("Done")