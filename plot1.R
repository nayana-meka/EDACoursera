#checking current directory
getwd();
#setting work space to appropriate directory
setwd("C:/Users/jmekanay/Documents/coursera");
library(sqldf)
#Reading only the required subset of data
df <- read.csv2.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",na.strings="?");
#Display the histogram
with(df,hist(Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red",Main="Global Active Power"));
#Save the graph from screen to png format
dev.copy(png,file="plot1.png",width=480,height=480);
dev.off();
