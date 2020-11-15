dataset <- read.table("week 1/household_power_consumption.txt", sep = ";", header = TRUE)
library(plyr)
library(dplyr)

df <- filter(dataset, Date == "1/2/2007" | Date == "2/2/2007")
df$Date <- as.Date(df[,1], "%d/%m/%Y")


# PNG 2

df$Global_active_power <- as.numeric(df$Global_active_power)
datetime = strptime(paste(df$Date, df$Time), '%Y-%m-%d %T')
plot(datetime, (df$Global_active_power), type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()