library (dplyr)
library (data.table)
library (lubridate)## putting required dates into 2 date vectors
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


png(filename = "plot2.png", width = 480, height = 480, units = "px")


with(mydata, plot(date_time, Global_active_power ,type="l", pch=".", col="black",
                   xlab="", ylab="Global Active Power(kilowatts)" ))

dev.off()
