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
png(file="plot3.png")

#create graph
#plot 3 - energy used by room
#legend("top", legend=c("label 1", "label 2", "label 3"), lty = c(1, 2, 3))
#http://www.statmethods.net/advgraphs/parameters.html
par(mfrow=c(1,1),mar=c(5,4,4,2), cex = 1)
with(dataFeb, plot(DateTime,Sub_metering_1,type="n",xlab="", ylab="Energy sub metering"))


with(dataFeb, {lines(DateTime, Sub_metering_1, type="l", col="black")
               lines(DateTime, Sub_metering_2, type="l", col="red")
               lines(DateTime, Sub_metering_3, type="l", col="blue")} 
)


legend("topright",lty = 1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))





#close png file device
dev.off()