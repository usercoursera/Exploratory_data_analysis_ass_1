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

# plot a single graph
par(mfrow = c(1,1))
plot(dataNeeded$TimeDate,dataNeeded$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt = 'n')

# add week days to the x axe
axis(1, at=min(dataNeeded$TimeDate), label="Thu")
axis(1, at=min(dataNeeded$TimeDate)+24*60*60,label="Fri")
axis(1, at=max(dataNeeded$TimeDate)+60,label="Sat")

# copy the plot to a PNG file
dev.copy(png, file = "plot2.png") 

# close the PNG device
dev.off()

