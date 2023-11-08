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

## Create the fourth plot and write it in a png file


if (!file.exists("plot4.png")) {
        png("plot4.png")

        par(mfcol=c(2,2),mar=c(4,4,2,2))
        
        plot(time, data$Global_active_power, type = "l",
             xlab = "", ylab = "Global Active Power (kilowatts)")
        
        plot(time, data$Sub_metering_1, xlab = "", 
             ylab = "Energy sub metering", type = "l")
        lines(time, data$Sub_metering_2, col="red")
        lines(time, data$Sub_metering_3, col="blue")
        legend("topright", names(data)[7:9], col=c("black","red","blue"), cex=0.8, lwd=1, bty="n")
        
        plot(time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        plot(time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
        dev.off()
}