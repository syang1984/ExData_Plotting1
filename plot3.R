# Plot 3 Script

# Place the data into a dataframe and skip the first 66,637 rows.
data <- "household_power_consumption.txt"
hpc <- read.table(data, header = FALSE, sep = ";", na.strings = "?", 
                  skip = 66637, 
                  nrows = 2880)

# Place the headers
names(hpc) <- names(read.table(data, header = TRUE, sep = ";", nrows = 1))

# Convert the Date and Time values to xlt values for plotting.
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Setting the background to "white."
par(bg = "white")

# Creating a PNG file 480x480, this is where the plot will be placed.
png(filename = "plot3.png", width = 480, height = 480)
col <- c("black", "red", "blue")

#Producing the plot.
plot(datetime, hpc[, 7], type = "l", col = col[1], xlab = "", 
     ylab = "Energy sub metering")
lines(datetime, hpc[, 8], col = col[2])
lines(datetime, hpc[, 9], col = col[3])
legend("topright", legend = names(hpc[7:9]), col = col, lty = c(1, 1, 1))

#Close the PNG device.
dev.off()