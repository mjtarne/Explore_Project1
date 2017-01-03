#import data, set data types as something useful (actual Datetimes)
full_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
full_data$Datetime <- paste(full_data$Date, full_data$Time)
full_data$Datetime = dmy_hms(full_data$Datetime)
full_data[,1] = as.Date(full_data[,1], format = "%d/%m/%Y")


#subset the dates we care about
selected_dates = subset(full_data, Date == "2007-02-01" | Date == '2007-02-02')

#plotting
par(mfcol = c(1,1))
png(filename = "plot3.png", width = 480, height = 480)
with(selected_dates, plot(Datetime, Sub_metering_1, col = 'black', xlab = "", ylab = "Energy sub metering", type = 'l'))
with(selected_dates, lines(Datetime, Sub_metering_2, col = 'red'))
with(selected_dates, lines(Datetime, Sub_metering_3, col = 'blue'))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lwd = 1)
dev.off()
