# PLOT 4

# Load the data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")

#convert the Date to a Date class
data$Date<-as.Date(data$Date, "%d/%m/%Y" ) 

# subset the dataset for the specific dates
data2 <-subset(data, Date == "2007-02-01"|Date == "2007-02-02" )

#convert data to numeric class and time to a time class
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1 <-as.numeric(as.character(data2$Sub_metering_1 ))
data2$Sub_metering_2 <-as.numeric(as.character(data2$Sub_metering_2 ))
data2$Sub_metering_3 <-as.numeric(as.character(data2$Sub_metering_3 ))
data2$Voltage <-as.numeric(as.character(data2$Voltage ))
data2$Global_reactive_power<-as.numeric(as.character(data2$Global_reactive_power))
data2$Time<-strptime(as.character(data2$Time),format=" %H:%M:%S") 

#Reconstruct plot 4 and save as a png file 

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(data2$Global_active_power, type="l",ylim=c(0,8),ylab="Global Active Power (kilowatts)",xlab="",xaxt="n",yaxt="n")
axis(side=1, at=c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6),labels=TRUE)

plot(data2$Voltage, type="l",ylab="Voltage",xlab="datetime",xaxt="n")
axis(side=1, at=c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))

plot(data2$Sub_metering_1,col="black", type="l",ylim=c(0,40),ylab="Energy sub meeting",xlab="",xaxt="n",yaxt="n")
points(data2$Sub_metering_2,col="red", type="l")
points(data2$Sub_metering_3,col="blue", type="l")
axis(side=1, at=c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,10,20,30),labels=TRUE)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")

plot(data2$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(side=1, at=c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))

dev.off()



