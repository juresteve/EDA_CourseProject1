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

## Create the first plot and write it in a png file

if (!file.exists("plot1.png")) { 
        png("plot1.png")

        hist(data$Global_active_power,col="red",
        xlab="Global Active Power (kilowatts)",main="Global Active Power")

        dev.off()
}
