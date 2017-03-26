library(lubridate)

dat <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", dec=".", 
strip.white=TRUE), Date == "1/2/2007" | Date == "2/2/2007")
dim(dat)

DateTime <- dmy_hms(paste(dat$Date, dat$Time, sep = " "))
Day <- weekdays(DateTime)
dat1 <- cbind(DateTime, Day, dat)
str(dat1)


# PLOT 3 
# (note that the days of the week are in French due the setting of my computer)
par(mfrow=c(1,1))
plot(dat1$DateTime, dat1$Sub_metering_1,  type = "l", xlab ="", ylab ="Energy sub metering")
points(dat1$DateTime, dat1$Sub_metering_2, col = "red", type = "l")
points(dat1$DateTime, dat1$Sub_metering_3, col = "blue", type = "l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()


