
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

jpeg(filename = "plot1.jpg", width = 480, height = 480)

hist(h$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kiloWatts)")

dev.off()

print("Done")