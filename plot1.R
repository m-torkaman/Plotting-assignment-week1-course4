library (data.table)
## putting required dates into 2 date vectors
sdate <- as.Date("2007-02-01")  ## start date
edate <- as.Date("2007-02-02")  ## end date
##reading and subseting date based on required dates 
mydata <- read.table("./pconsumption/household_power_consumption.txt", 
             stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
             colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
             "numeric","numeric","numeric" )) %>% 
                           filter(dmy(Date) == sdate | dmy(Date)== edate)





png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(mydata, hist(Global_active_power, col="red", 
                  main = "Global Active Power", xlab= "Global Active Power (Kilowatt)"))
dev.off()
