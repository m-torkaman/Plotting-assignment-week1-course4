library (data.table)
## setting start and end date, as specified in the assignment 
sdate<-as.Date("2007-02-01")
edate <- as.Date("2007-02-02")

##reading data and chosing right raws for 2 days, using pipeline
mydata <- read.table("./pconsumption/household_power_consumption.txt", 
             stringsAsFactors = FALSE, sep=";", header = TRUE , na.strings = "?" ,
             colClasses = c("character" ,"character", "numeric", "numeric","numeric","numeric",
             "numeric","numeric","numeric" )) %>% 
                           filter(dmy(Date) == sdate | dmy(Date)== edate)





bmp(filename = "plot1.bmp", width = 480, height = 480, units = "px")
with(mydata, hist(Global_active_power, col="red", 
                  main = "Global Active Power", xlab= "Global Active Power (Kilowatt)"))
dev.off()
