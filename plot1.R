mydata <- read.table("./pconsumption/household_power_consumption.txt", 
             stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
             colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
             "numeric","numeric","numeric" )) %>% 
                           filter(dmy(Date) == sdate | dmy(Date)== edate)





png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(mydata, hist(Global_active_power, col="red", 
                  main = "Global Active Power", xlab= "Global Active Power (Kilowatt)"))
dev.off()
