library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","archive.zip")
unzip("archive.zip")
file <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
dateFrom <- as.Date("01/02/2007", format="%d/%m/%Y")
dateTo <- as.Date("02/02/2007", format="%d/%m/%Y")
file2<-file[between(as.Date(file$Date,"%d/%m/%Y"),dateFrom ,dateTo),]
png("plot4.png",width=480,height=480,units="px")
par(mfrow = c(2,2))
#hist(as.numeric(as.character(file2$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
file2$Datetime<-strptime(paste(as.character(file2$Date[]),as.character(file2$Time[])),"%d/%m/%Y %H:%M:%S")
#1
plot(file2$Datetime,as.numeric(as.character(file2$Global_active_power)),type="l",xlab="",ylab="Global Active Power")

#2

plot(file2$Datetime,as.numeric(as.character(file2$Voltage)),type="l",xlab="datetime",ylab="Voltage")


#3
plot(file2$Datetime,as.numeric(as.character(file2$Sub_metering_1)), type="l",xlab="",ylab="Energy sub metering",col="black")
lines(file2$Datetime,as.numeric(as.character(file2$Sub_metering_2)), type="l",col="red")
lines(file2$Datetime,as.numeric(as.character(file2$Sub_metering_3)), type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

#4

plot(file2$Datetime,as.numeric(as.character(file2$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()