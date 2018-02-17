mydata <- read.table("./pconsumption/household_power_consumption.txt", 
                     stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
                     colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
                                    "numeric","numeric","numeric" )) %>% 
        filter(dmy(Date) == sdate | dmy(Date)== edate)

## creating a new column of date and time
mydata$date_time <- dmy_hms(paste(mydata2$Date, mydata2$Time))


bmp(filename = "plot2.bmp", width = 480, height = 480, units = "px")


with(mydata, plot(date_time, Global_active_power ,type="l", pch=".", col="black",
                   xlab="", ylab="Global Active Power(kilowatts)" ))

dev.off()