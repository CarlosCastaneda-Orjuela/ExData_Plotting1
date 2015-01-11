# Read the overal data
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Convert Date as.Date variable 
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")
# Subset dates to period 2007-02-01 and 2007-02-02.
subsetData<-subset(data,Date==(as.Date("2007-2-1","%Y-%m-%d"))
                   |Date==(as.Date("2007-2-2","%Y-%m-%d")))
# Make a histogram of Global_active_power variable in a png device
png("plot1.png")
        hist(subsetData$Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
dev.off()