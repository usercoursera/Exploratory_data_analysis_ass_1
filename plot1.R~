# clean the environment
rm(list=ls())

# store the data in the mydata variable, substituting "?" with "NA
mydata <- read.table("data/household_power_consumption.txt",na.strings=c("?", "NA"),sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE)

# select the required subset of the data
dataNeeded <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")

# set the margins
par(mar = c(4,4,2,1))

# plot a single graph
par(mfrow = c(1,1))
hist(dataNeeded$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)",ylab="Frequency",ylim=c(0,1200),xlim=c(0,8))

# copy the plot to a PNG file
dev.copy(png, file = "plot1.png") 

# close the PNG device
dev.off()

