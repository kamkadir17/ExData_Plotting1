#load the required libraries
library(readr)
library(lubridate)

#read the given file onto the data frame
powerconsump <- read_delim("household_power_consumption.txt",delim = ";",col_names = TRUE, na = c("?", "NA"))
#extract only the two dates required for plotting
plotdata <- powerconsump[dmy(powerconsump$Date)  == ymd("2007-02-02") | dmy(powerconsump$Date)  == ymd("2007-02-01"),]

#Plot1
#Open a png file for drawing & plot the plot 1 per specification
png("plot1.png",width=480,height=480,units="px")
hist(plotdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main="Global Active Power", yaxs = "i", xaxs = "r")
dev.off()