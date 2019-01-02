#checking current directory
getwd();
#setting work space to appropriate directory
setwd("C:/Users/jmekanay/Documents/coursera");
library(sqldf)
#Reading only the required subset of data
df <- read.csv2.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",na.strings="?");
#create datetime column that can be used as x axis for the graph
df$datetime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S");
#Display the line chart
with(df,plot(datetime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)"));
#Save the graph from screen to png format
dev.copy(png,file="plot2.png",width=480,height=480);
dev.off();
