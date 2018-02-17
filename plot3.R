mydata <- read.table("./pconsumption/household_power_consumption.txt", 
                     stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
                     colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
                                    "numeric","numeric","numeric" )) %>% 
        filter(dmy(Date) == sdate | dmy(Date)== edate)

## creating a new column of date and time

mydata$date_time <- dmy_hms(paste(mydata2$Date, mydata2$Time))

png(filename = "plot3.png", width = 480, height = 480, units = "px")


with(mydata, {plot(date_time, Sub_metering_1, type="l", 
                   ylab= "Energy sub mettering", xlab = "")
             points(x=date_time, y=Sub_metering_2, col="red", type = "l")
             points(x=date_time, y=Sub_metering_3, col= "blue", type = "l")
         })
legend("topright",pch=c("_","_","_"),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))


dev.off()
