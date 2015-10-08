setwd('C:\\Training\\exploratory_data')

#read full data set
data <- read.csv(file="household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#format date variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Extract subset
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$Datetime <- as.POSIXct(datetime) 


#plot 4
par(mfrow=c(2,2))
with(data2, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub meeting", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", lty= c(1,1,1), col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex = 0.7)
        plot(Global_reactive_power~Datetime, type="l",ylab="Global_reactive_power",xlab="datetime",ylim=c(0,0.5),las=1)
})
dev.copy(png, file="C:\\Training\\exploratory_data\\github\\ExData_Plotting1\\plot4.png", height=480, width=480)
dev.off()