# Read the overal data
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Generate a datetime variable with Date and Time
data$datetime<-strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %H:%M:%S")
# Convert Date as.Date variable 
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")
# Subset dates to period 2007-02-01 and 2007-02-02.
subsetData<-subset(data,Date==(as.Date("2007-2-1","%Y-%m-%d"))
                   |Date==(as.Date("2007-2-2","%Y-%m-%d")))
# Make the time-trend graph for Global_active_power in a png device
png("plot4.png")
par(mfcol=c(2,2),mar=c(4,4,2,2))
with(subsetData,{
        plot(datetime,Global_active_power,type="l",
                     xlab="",ylab="Global Active Power (kilowatts)")
        plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(subsetData$datetime,subsetData$Sub_metering_2,col="red")
        lines(subsetData$datetime,subsetData$Sub_metering_3,col="blue")
        legend("topright",pch="_",col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
        plot(datetime,Voltage,type="l")
        plot(datetime,Global_reactive_power,type="l")
})
dev.off()