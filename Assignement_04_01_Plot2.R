library(lubridate)

dat <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", dec=".", 
strip.white=TRUE), Date == "1/2/2007" | Date == "2/2/2007")
dim(dat)

DateTime <- dmy_hms(paste(dat$Date, dat$Time, sep = " "))
Day <- weekdays(DateTime)
dat1 <- cbind(DateTime, Day, dat)
str(dat1)

# PLOT 2 
# (note that the days of the week are in French due the setting of my computer)
par(mfrow=c(1,1))
plot(dat1$DateTime, dat1$Global_active_power,  type = "l", xlab ="", ylab ="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
