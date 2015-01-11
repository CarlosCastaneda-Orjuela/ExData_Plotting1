# Read the overal data
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Generate a datetime variable with Date and Time
data$datetime<-strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %H:%M:%S")
# Convert Date as.Date variable 
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")
# Subset dates to period 2007-02-01 and 2007-02-02.
subsetData<-subset(data,Date==(as.Date("2007-2-1","%Y-%m-%d"))
                   |Date==(as.Date("2007-2-2","%Y-%m-%d")))
# Make the plot and lines for Sub_metering 1,2, and 3 in a png device
png("plot3.png")
with(subsetData,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(subsetData$datetime,subsetData$Sub_metering_2,col="red")
lines(subsetData$datetime,subsetData$Sub_metering_3,col="blue")
legend("topright",pch="_",col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
dev.off()