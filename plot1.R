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
frequency(b$Global_active_power)
c = b %>% group_by("Global_active_power") %>% summarize(counts = n())

hist(b$Global_active_power, breaks = c(0, 2, 4, 6, 8), freq = TRUE)
hist(b$Global_active_power, breaks = 12, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


b$Global_active_power = as.numeric(b$Global_active_power)
range(b$Global_active_power)
str(b$Global_active_power)
str(b)

dev.cur()
dev.copy(png, file = "plot1.png",  width = 480, height = 480)
dev.off()













