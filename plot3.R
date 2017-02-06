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
data2$Time<-strptime(as.character(data2$Time),format=" %H:%M:%S") 

#Reconstruct plot 3 and save as a png file
 
png(filename = "plot3.png",width = 480, height = 480)
plot(data2$Sub_metering_1,col="black", type="l",ylim=c(0,40),ylab="Energy sub meeting",xlab="",xaxt="n",yaxt="n")
points(data2$Sub_metering_2,col="red", type="l")
points(data2$Sub_metering_3,col="blue", type="l")
axis(side=1, at=c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,10,20,30),labels=TRUE)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
