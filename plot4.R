## JHU on Coursera:
## Exploratory Data Analysis - Assignment 1, Plot 3

## DATA SOURCE: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 

# 0.1 download and unzip the the file
# if MAC add method="CURL"

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")


## Read data using read.csv
df.power = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))


## Format the date and select the data over a 2-day period in February, 2007(Feb 1 and Feb 2)
df.power$timestamp = strptime(paste(df.power$Date, df.power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df.power = df.power[df.power$timestamp >= startDate & df.power$timestamp <= endDate, ]



## Start creating the plot 1,2,3,4
png(filename="plot4.png", width=480, height=480)


# Set the canvas
par(mfcol=c(2,2))


# do 1st Plot
plot(df.power$timestamp, df.power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")


# do 2nd Plot
plot(df.power$timestamp, df.power$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(df.power$timestamp, df.power$Sub_metering_2, col="red")
lines(df.power$timestamp, df.power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")


# do 3rd Plot
plot(df.power$timestamp, df.power$Voltage, type="l",
     xlab="datetime", ylab="Voltage")


# do 4th Plot
plot(df.power$timestamp, df.power$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

#close the device
dev.off()
