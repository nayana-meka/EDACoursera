#checking current directory
getwd();
#setting work space to appropriate directory
setwd("C:/Users/jmekanay/Documents/coursera");
library(sqldf)
#Reading only the required subset of data
df <- read.csv2.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",na.strings="?");
#create datetime column that can be used as x axis for the graph
df$Datetime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S");
png("plot4.png", width=480, height=480)
#set rows and columns of plot
par(mfrow=c(2,2));
#Display the charts
#plot1
with(df,plot(datetime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power"));
#plot2
with(df,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage"));
#plot3
with(df,plot(datetime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering"));
lines(df$datetime,df$Sub_metering_2,col="red");
lines(df$datetime,df$Sub_metering_3,col="blue");
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1));
#plot4
with(df,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"));
dev.off();
