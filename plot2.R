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

## Create the second plot and write it in a png file

if (!file.exists("plot2.png")) {
        png("plot2.png")
        
        plot(time, data$Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)")
        
        dev.off()
}
