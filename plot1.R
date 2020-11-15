dataset <- read.table("week 1/household_power_consumption.txt", sep = ";", header = TRUE)
library(plyr)
library(dplyr)

df <- filter(dataset, Date == "1/2/2007" | Date == "2/2/2007")
df$Date <- as.Date(df[,1], "%d/%m/%Y")


# PNG 1

df$Global_active_power <- as.numeric(df$Global_active_power)
png(file="plot1.png", width=480, height=480)
hist(df$Global_active_power, col = "red")
dev.off()
