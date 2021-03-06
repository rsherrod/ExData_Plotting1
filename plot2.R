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
                               
#plot 2
plot(data2$Global_active_power~data2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="C:\\Training\\exploratory_data\\github\\ExData_Plotting1\\plot2.png", height=480, width=480)
dev.off()