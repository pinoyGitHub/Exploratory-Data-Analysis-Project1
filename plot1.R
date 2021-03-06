## JHU on Coursera:
## Exploratory Data Analysis - Assignment 1, Plot 1

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
df.power$Date = as.Date(df.power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
df.power = df.power[df.power$Date >= startDate & df.power$Date <= endDate, ]


## Create Plot 1
png(filename="plot1.png", width=480, height=480)
hist(df.power$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", col="red")
dev.off()
