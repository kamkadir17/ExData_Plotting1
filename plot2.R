#load the required libraries
library(readr)
library(lubridate)

#read the given file onto the data frame
powerconsump <- read_delim("household_power_consumption.txt",delim = ";",col_names = TRUE, na = c("?", "NA"))
#extract only the two dates required for plotting
plotdata <- powerconsump[dmy(powerconsump$Date)  == ymd("2007-02-02") | dmy(powerconsump$Date)  == ymd("2007-02-01"),]
xvalues <- c(1, nrow(plotdata)/2, nrow(plotdata))

#Plot2
png("plot2.png",width=480,height=480,units="px")
plot(plotdata$Global_active_power, type ="s", ylab = "Global Active Power (kilowatts)", xaxt = 'n', xlab = "")
axis(1, xvalues, c("Thu","Fri","Sat"))
dev.off()