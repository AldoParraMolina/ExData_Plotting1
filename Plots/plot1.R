

# Loading an subsetting data --------------------------------------------------------------------------------------

# Load the data
epc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Date format
epc$Date <- as.Date(as.character(epc$Date), "%d/%m/%Y")

# Subset data 
epc_s <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

# Date and time format
epc_s$Date_time <- as.POSIXct(paste(as.character(epc_s$Date), as.character(epc_s$Time)))



# Plot 1 ----------------------------------------------------------------------------------------------------------

hist(epc_s$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


# Save plot -------------------------------------------------------------------------------------------------------

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

