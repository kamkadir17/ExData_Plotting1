#load the required libraries
library(readr)
library(lubridate)

#read the given file onto the data frame
powerconsump <- read_delim("household_power_consumption.txt",delim = ";",col_names = TRUE, na = c("?", "NA"))
#extract only the two dates required for plotting
plotdata <- powerconsump[dmy(powerconsump$Date)  == ymd("2007-02-02") | dmy(powerconsump$Date)  == ymd("2007-02-01"),]
xvalues <- c(1, nrow(plotdata)/2, nrow(plotdata))

#Plot4
png("plot4.png",width=480,height=480,units="px")
par(mfcol=c(2,2))
####Plot4-1,1
plot(plotdata$Global_active_power, type ="s", ylab = "Global Active Power", xaxt = 'n', xlab = "")
axis(1, xvalues, c("Thu","Fri","Sat"))
####Plot4-1,2
plot(plotdata$Sub_metering_1, type ="n", ylab = "Energy sub metering", col = "black", xaxt = 'n', xlab = "")
points(plotdata$Sub_metering_1, type ="s", ylab = "Energy sub metering", col = "black")
points(plotdata$Sub_metering_2, type ="s", ylab = "Energy sub metering", col = "red")
points(plotdata$Sub_metering_3, type ="s", ylab = "Energy sub metering", col = "blue")
legend("topright",bty = "n" ,lty =1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
axis(1, xvalues, c("Thu","Fri","Sat"))
####Plot4-2,1
plot(plotdata$Voltage, type ="s", ylab = "Voltage", xlab = "datetime", xaxt = 'n')
axis(1, xvalues, c("Thu","Fri","Sat"))
####Plot4-2,2
plot(plotdata$Global_reactive_power, type ="s", ylab = "Global_reactive_power", xlab = "datetime", xaxt = 'n')
axis(1, xvalues, c("Thu","Fri","Sat"))
dev.off()
