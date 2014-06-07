
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

jpeg(filename = "plot2.jpg", width = 480, height = 480)


plot(h$DateTime,h$Global_active_power, type="l", col="black", main="Global Active Power", xlab="", ylab="Global Active Power (kiloWatts)")


dev.off()

print("Done")