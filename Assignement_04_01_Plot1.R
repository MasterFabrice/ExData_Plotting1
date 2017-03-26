library(lubridate)

dat <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", dec=".", 
strip.white=TRUE), Date == "1/2/2007" | Date == "2/2/2007")
dim(dat)

DateTime <- dmy_hms(paste(dat$Date, dat$Time, sep = " "))
Day <- weekdays(DateTime)
dat1 <- cbind(DateTime, Day, dat)
str(dat1)

# PLOT 1
par(mfrow=c(1,1))
par(hist(dat1$Global_active_power,col="red",main = "Global Active Power",xlab ="Global Active Power (kilowatts)"),bg="white",pin=)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
