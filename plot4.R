a = read.table("hpc.txt",  sep = ";", na.strings = "?")
head(a)
a[2,1]
colnames(a) = a[1,]
library(dplyr)
library(tidyr)
a = a[-1, ]
dim(a)

library(lubridate)
dmy(a$Date)
class(a$Date)
a$Date = dmy(a$Date)
class(a$Date)

b = subset(a, a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
head(b)

b$Time = parse_date_time(b$Time, "HMS")
b$Time = hms(b$Time)
View(b)

names(b)


table(wday(b$Date, label = TRUE))
datetime = paste(b$Date, b$Time)
head(datetime)
datetime = ymd_hms(datetime)

c = subset(a, a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
datetime = paste(c$Date, c$Time)
head(datetime)
datetime = ymd_hms(datetime)

par(mfrow = c(2,2))

png( filename = "plot4.png", width = 480, height = 480) ##run this before par, else only 1 graph gets plotted

plot(datetime, b$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")
plot(datetime, b$Voltage, type = "l", ylab = "Voltage")
plot(datetime, b$Sub_metering_1, type = "S", ylab = "Energy sub metering", xlab = " ")
lines(datetime, b$Sub_metering_2, type = "S", col = "red")
lines(datetime, b$Sub_metering_3, type = "S", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.7, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, b$Global_reactive_power, type = "h", ylab = "Global reactive power")
dev.copy(png, filename = "plot4.png", width = 480, height = 480) ## don't use this
dev.off()





