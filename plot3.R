## Download the data folder and unzip it

fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("exdata_data_household_power_consumption.zip")){
        download.file(fileURL,"exdata_data_household_power_consumption.zip")
}  
if (!file.exists("household_power_consumption.txt")) { 
        unzip("exdata_data_household_power_consumption.zip") 
}

## Load the data and set the column types

data_raw = read.table("household_power_consumption.txt", sep=";", header=TRUE)
data = subset(data_raw,data_raw$Date %in% c("1/2/2007","2/2/2007"))
data$Global_active_power = as.numeric(data$Global_active_power)
data$Date = as.Date(data$Date,format = "%d/%m/%Y")
time = as.POSIXct(paste(data$Date, data$Time, sep=" "))

## Create the third plot and write it in a png file

if (!file.exists("plot3.png")) {
        png("plot3.png")
        
        plot(time, data$Sub_metering_1, xlab = "", 
             ylab = "Energy sub metering", type = "l")
        lines(time, data$Sub_metering_2, col="red")
        lines(time, data$Sub_metering_3, col="blue")
        legend("topright",names(data)[7:9], col=c("black","red","blue"))
        
        dev.off()
}