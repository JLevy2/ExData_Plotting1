# Load the data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")

#convert the Date to a Date class
data$Date<-as.Date(data$Date, "%d/%m/%Y" ) 

# subset the dataset for the specific dates
data2 <-subset(data, Date == "2007-02-01"|Date == "2007-02-02" )

#convert Global Active Power to numeric class and time to a time class
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Time<-strptime(as.character(data2$Time),format=" %H:%M:%S") 

#Reconstruct plot 1 and save as a png file  
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(data2$Global_active_power)), col="red", ylim = c(0,1200), 
xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power")
dev.off
