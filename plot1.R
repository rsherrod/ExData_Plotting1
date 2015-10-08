setwd('C:\\Training\\exploratory_data')

#read full data set
data <- read.csv(file="household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#format date variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Extract subset
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

hist(data2$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

dev.copy(png, file="C:\\Training\\exploratory_data\\github\\ExData_Plotting1\\plot1.png", height=480, width=480)
dev.off()