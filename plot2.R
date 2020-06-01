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

plot(datetime, b$Global_active_power, type = "l")

  
  
  
  
  
  
  
  
  
  
  
