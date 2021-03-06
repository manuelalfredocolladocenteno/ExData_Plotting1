dataset <- read.table("week 1/household_power_consumption.txt", sep = ";", header = TRUE)
library(plyr)
library(dplyr)

df <- filter(dataset, Date == "1/2/2007" | Date == "2/2/2007")
df$Date <- as.Date(df[,1], "%d/%m/%Y")


# PNG 4

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
datetime = strptime(paste(df$Date, df$Time), '%Y-%m-%d %T')

par(mfrow=c(2,2))
plot(datetime, (df$Global_active_power), type='l', xlab='', ylab='Global Active Power')
plot(datetime, (df$Voltage), type='l', xlab='', ylab='Voltage')
plot(datetime, (df$Sub_metering_1), type='l', xlab='', ylab='Energy sub metering')
lines(datetime, (df$Sub_metering_2), type='l', col = 'blue',xlab='', ylab='Energy sub metering')
lines(datetime, (df$Sub_metering_2), type='l', col = 'red',xlab='', ylab='Energy sub metering')
lines(datetime, (df$Sub_metering_3), type='l', col = 'blue',xlab='', ylab='Energy sub metering')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
plot(datetime, (df$Global_reactive_power), type='l', xlab='', ylab='Global_Reactive_Power')

dev.copy(png, 'plot4.png', height=480, width=480)
dev.off()