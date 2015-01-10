#Exploratory Analysis Course Project 1 - Base System Graphs
setwd("/Users/Non-corrupt user/Desktop/Suzy/DataScience/ExploratoryDA/Project1/")

#Read in data
data <- read.table(file="household_power_consumption.txt", header= TRUE,
                   sep=";", colClasses=c("character","character","numeric","numeric",
                                         "numeric","numeric","numeric","numeric",
                                         "numeric"), na.strings ="?")

#only want 2/1/07 $ 2/2/07
dataFeb <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
dataFeb$Date <- factor(dataFeb$Date)
table(dataFeb$Date)

#convert Date/Time;
library(lubridate)
#sapply(dataFeb, class)
dataFeb$DateTime <- strptime(paste(dataFeb$Date,dataFeb$Time),
                             format="%d/%m/%Y %T")



#write graphs to file
##default size is 480 X 480 default resolution is 72
#open png device and create file
png(file="plot4.png")

#create graph
#plot 4 - 4 plots on screen: global active power, volatage, 
#   energy sub metering, global reactive power
par(mfrow=c(2,2),mar=c(4,4,3,2), cex = 0.8)
with(dataFeb,{plot(DateTime, Global_active_power, type="n",xlab="",
                   ylab="Global Active Power")
              lines(DateTime, Global_active_power,type="l")
              plot(DateTime,Voltage, type="n", xlab="datetime",
                   ylab="Voltage")
              lines(DateTime, Voltage, type="l")
              plot(DateTime,Sub_metering_1,type="n", xlab="",
                   ylab="Energy sub metering")
              lines(DateTime, Sub_metering_1, type="l", col="black")
              lines(DateTime, Sub_metering_2, type="l", col="red")
              lines(DateTime, Sub_metering_3, type="l", col="blue")
              legend("topright",lty = 1, col=c("black","red","blue"),
                     legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                     bty = "n" , cex=0.9)
              plot(DateTime, Global_reactive_power,type="n",xlab="datetime",
                   ylab="Global_reactive_power")
              lines(DateTime,Global_reactive_power,type="l")
              
})





#close png file device
dev.off()