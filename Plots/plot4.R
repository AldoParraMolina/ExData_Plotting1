

# Loading an subsetting data --------------------------------------------------------------------------------------

# Load the data
epc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Date format
epc$Date <- as.Date(as.character(epc$Date), "%d/%m/%Y")

# Subset data 
epc_s <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]

# Date and time format
epc_s$Date_time <- as.POSIXct(paste(as.character(epc_s$Date), as.character(epc_s$Time)))


# Plot 4 ----------------------------------------------------------------------------------------------------------

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(epc_s, {
    plot(Global_active_power ~ Date_time, type = "l", 
         ylab = "Global Active Power", xlab = "")
    
    plot(Voltage ~ Date_time, type="l", 
         ylab = "Voltage", xlab = "")
    
    plot(Sub_metering_1 ~ Date_time, type = "l", 
         ylab = "Energy sub metering", xlab = "")
    
    lines(Sub_metering_2 ~ Date_time, col = 'Red')
    
    lines(Sub_metering_3 ~ Date_time, col = 'Blue')
    
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Global_reactive_power ~ Date_time, type = "l", 
         ylab = "Global rective power", xlab = "")
})

# Save plot -------------------------------------------------------------------------------------------------------

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
