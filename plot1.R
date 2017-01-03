#import data, set first column as Date
full_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
full_data[,1] = as.Date(full_data[,1], format = "%d/%m/%Y")

#subset the dates we care about
selected_dates = subset(full_data, Date == "2007-02-01" | Date == '2007-02-02')

#plotting
par(mfcol = c(1,1))
png(filename = "plot1.png", width = 480, height = 480)
hist(selected_dates$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = 'red', main = 'Global Active Power')
dev.off()