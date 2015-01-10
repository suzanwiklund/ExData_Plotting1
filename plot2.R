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

#plot 2 - global active power by time
#write graphs to file
##default size is 480 X 480 default resolution is 72
#open png device and create file
png(file="plot2.png")

#create graph
par(mfrow=c(1,1),mar=c(5,4,4,2), cex = 1)
with(dataFeb, plot(DateTime,Global_active_power, type="n", xlab="",
                   ylab="Global Active Power (kilowatts)"))
with(dataFeb,lines(DateTime,Global_active_power, type ="l"))


#close png file device
dev.off()