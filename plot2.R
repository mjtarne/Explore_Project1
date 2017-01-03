#import data, set first column as Date
full_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
full_data$Datetime <- paste(full_data$Date, full_data$Time)
full_data$Datetime = dmy_hms(full_data$Datetime)
full_data[,1] = as.Date(full_data[,1], format = "%d/%m/%Y")


#subset the dates we care about, convert to one date/time column
selected_dates = subset(full_data, Date == "2007-02-01" | Date == '2007-02-02')

#plotting
par(mfcol = c(1,1))
png(filename = "plot2.png", width = 480, height = 480)
plot(selected_dates$Datetime, selected_dates$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')
dev.off()
