# clean the environment
rm(list=ls())

# store the data in the mydata variable, substituting "?" with "NA
mydata <- read.table("data/household_power_consumption.txt",na.strings=c("?", "NA"),sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE)

# select the required subset of the data
dataNeeded <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")

# add a new column in which the date and time will be stored in the numeric form
dataNeeded$TimeDate <- do.call(paste, c(dataNeeded[c("Date", "Time")], sep = ":")) 
options(digits = 12)
options(digits.secs = 3)
dataNeeded$TimeDate <- strptime(dataNeeded$TimeDate,format='%d/%m/%Y:%H:%M:%S')
dataNeeded$TimeDate <- as.integer(as.POSIXct(dataNeeded$TimeDate))
dataNeeded$TimeDate <- as.numeric(dataNeeded$TimeDate)
dataNeeded$TimeDate <- dataNeeded$TimeDate - min(dataNeeded$TimeDate)

# set the margins
par(mar = c(4,4,3,1))

# plot four graphs
par(mfrow = c(2,2))

# 1: global active power
plot(dataNeeded$TimeDate,dataNeeded$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt='n')
axis(1, at=min(dataNeeded$TimeDate), label="Thu")
axis(1, at=min(dataNeeded$TimeDate)+24*60*60,label="Fri")
axis(1, at=max(dataNeeded$TimeDate)+60,label="Sat")

# 2: voltage
plot(dataNeeded$TimeDate,dataNeeded$Voltage,type="l",ylab="Voltage",xlab="datetime",xaxt = 'n',ylim=c(234,246))
axis(1, at=min(dataNeeded$TimeDate), label="Thu")
axis(1, at=min(dataNeeded$TimeDate)+24*60*60,label="Fri")
axis(1, at=max(dataNeeded$TimeDate)+60,label="Sat")

# 3: submetering
plot(dataNeeded$TimeDate,dataNeeded$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt = 'n')
lines(dataNeeded$TimeDate,dataNeeded$Sub_metering_2,col="red")
lines(dataNeeded$TimeDate,dataNeeded$Sub_metering_3,col="purple")
legend("topright",bty = "n",c("Sub_meterin_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","purple"))
axis(1, at=min(dataNeeded$TimeDate), label="Thu")
axis(1, at=min(dataNeeded$TimeDate)+24*60*60,label="Fri")
axis(1, at=max(dataNeeded$TimeDate)+60,label="Sat")

# 4: global reactive power
plot(dataNeeded$TimeDate,dataNeeded$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="",xaxt = 'n')
axis(1, at=min(dataNeeded$TimeDate), label="Thu")
axis(1, at=min(dataNeeded$TimeDate)+24*60*60,label="Fri")
axis(1, at=max(dataNeeded$TimeDate)+60,label="Sat")

# store the graph to a PNG file
dev.copy(png, file = "plot4.png")

# close the PNG device
dev.off()

