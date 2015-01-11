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
png("plot2.png")
        with(subsetData,plot(datetime,Global_active_power,type="l",
                     xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()