

# Loading an subsetting data --------------------------------------------------------------------------------------

# Load the data
epc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Date format
epc$Date <- as.Date(as.character(epc$Date), "%d/%m/%Y")

# Subset data 
epc_s <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

# Date and time format
epc_s$Date_time <- as.POSIXct(paste(as.character(epc_s$Date), as.character(epc_s$Time)))



# Plot 2 ----------------------------------------------------------------------------------------------------------

plot(epc_s$Date_time, epc_s$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

# Save plot -------------------------------------------------------------------------------------------------------

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
