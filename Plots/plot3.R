

# Loading an subsetting data --------------------------------------------------------------------------------------

# Load the data
epc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Date format
epc$Date <- as.Date(as.character(epc$Date), "%d/%m/%Y")

# Subset data 
epc_s <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

# Date and time format
epc_s$Date_time <- as.POSIXct(paste(as.character(epc_s$Date), as.character(epc_s$Time)))



# Plot 3 ----------------------------------------------------------------------------------------------------------

plot(epc_s$Date_time, epc_s$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(epc_s$Date_time, epc_s$Sub_metering_2, col="red")
lines(epc_s$Date_time, epc_s$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

# Save plot -------------------------------------------------------------------------------------------------------

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
