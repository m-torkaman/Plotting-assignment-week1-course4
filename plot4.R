library (dplyr)
library (data.table)
library (lubridate)
## putting required dates into 2 date vectors
sdate <- as.Date("2007-02-01")  ## start date
edate <- as.Date("2007-02-02")  ## end date
##reading and subseting date based on required dates
mydata <- read.table("./pconsumption/household_power_consumption.txt", 
                     stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
                     colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
                                    "numeric","numeric","numeric" )) %>% 
        filter(dmy(Date) == sdate | dmy(Date)== edate)

## creating a new column of date and time

mydata$date_time <- dmy_hms(paste(mydata2$Date, mydata2$Time))



png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
## first plot (Top Left)
with(mydata, plot(date_time, Global_active_power ,type="l",
                  xlab="", ylab="Global Active Power",  mar=c(4,2,0,1) ))

## Second plot (Down Left)

with(mydata, {plot(date_time, Sub_metering_1, type="l",  mar=c(2,2,0,0),
                   ylab= "Energy sub mettering", xlab = "")
        lines(x=date_time, y=Sub_metering_2, col="red")
        lines(x=date_time, y=Sub_metering_3, col= "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, cex = 0.9)


## Third plot (Top Right)
with(mydata, plot(date_time, Voltage ,type="l", 
                  xlab="datetime", ylab="Voltage",   mar=c(4,2,0,0) ))

## Forth plot (Down Right)
with(mydata, plot(date_time, Global_reactive_power ,  type="l", 
                   xlab="datetime",   mar=c(2,2,0,1) 
                   ))


dev.off()
