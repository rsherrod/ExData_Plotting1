setwd('C:\\Training\\exploratory_data')

data_big <- read.csv(file="household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_big$Date <- as.Date(data_big$Date, format="%d/%m/%Y")

#Extract subset and convert dates
data <- subset(data_big, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


#Create Plot 3
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="C:\\Training\\exploratory_data\\github\\ExData_Plotting1\\plot3.png", height=480, width=480)
dev.off()