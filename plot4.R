#import data, set data types as something useful (actual Datetimes)
full_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
full_data$Datetime <- paste(full_data$Date, full_data$Time)
full_data$Datetime = dmy_hms(full_data$Datetime)
full_data[,1] = as.Date(full_data[,1], format = "%d/%m/%Y")


#subset the dates we care about
selected_dates = subset(full_data, Date == "2007-02-01" | Date == '2007-02-02')

#plotting
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(selected_dates$Datetime, selected_dates$Global_active_power, ylab = "Global Active Power", xlab = "", type = 'l')
plot(selected_dates$Datetime, selected_dates$Sub_metering_1, col = 'black', xlab = "", ylab = "Energy sub metering", type = 'l')
lines(selected_dates$Datetime, selected_dates$Sub_metering_2, col = 'red')
lines(selected_dates$Datetime, selected_dates$Sub_metering_3, col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lwd = 1)
plot(selected_dates$Datetime, selected_dates$Voltage, ylab = "Voltage", xlab = "datetime", type = 'l')
plot(selected_dates$Datetime, selected_dates$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
