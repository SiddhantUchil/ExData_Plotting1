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


plot(datetime, b$Sub_metering_1, type = "S")

plot(datetime, b$Sub_metering_1, type = "S", ylab = "Energy sub metering")
lines(datetime, b$Sub_metering_2, type = "S", col = "red")
lines(datetime, b$Sub_metering_3, type = "S", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


?plot
?pch


dev.cur()
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
?png()
<<<<<<< HEAD
png(file = "plot3.png", width = 480, height = 480) ##run this first to create a blank image file and fit everything inside
=======
png(file = "plot3.png", width = 480, height = 480) ##run this first to create a blamk image file and fit everything inside
>>>>>>> 0cbfe8c62ed08ff93b421edd5fde7c9e2652ca4d
dev.off()

