#intake of data from txt file
getwd()
setwd("C:/Users/prase/Desktop/Coursera")
Power_consumption<-read.csv("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
str(Power_consumption)
#change of data types
Power_consumption$Date<-as.Date(Power_consumption$Date,format="%d/%m/%Y")
Power_consumption$Global_active_power<-as.numeric(Power_consumption$Global_active_power)
Power_consumption$Global_reactive_power<-as.numeric(Power_consumption$Global_reactive_power)
Power_consumption$Voltage<as.numeric(Power_consumption$Voltage)
Power_consumption$Sub_metering_1<-as.numeric(Power_consumption$Sub_metering_1)
Power_consumption$Sub_metering_2<-as.numeric(Power_consumption$Sub_metering_2)
str(Power_consumption)
#create new column
Power_consumption$Date_Time<-paste(Power_consumption$Date,Power_consumption$Time)
str(Power_consumption)
# Change new column data type
Power_consumption$Date_Time<-strptime(Power_consumption$Date_Time,format="%Y-%m-%d %H:%M:%S")
str(Power_consumption)
#Subset data from 1st Feb 07 - 2nd Feb 07
Date1<-as.Date("01/02/2007",format="%d/%m/%Y")
Date1
Date2<-as.Date("02/02/2007",format="%d/%m/%Y")
Date2
Power_consumption_Feb2007<-subset(Power_consumption,Date>=Date1 & Date<=Date2)
str(Power_consumption_Feb2007)
#Creation of Plot2.png
png(file="plot2.png",height=480,width=480)
with(Power_consumption_Feb2007,plot(Date_Time,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))
dev.off()

