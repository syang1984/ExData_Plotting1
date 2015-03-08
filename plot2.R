# Plot 2 Script

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
png(filename = "plot2.png", width = 480, height = 480)

#Producing the plot.
plot(datetime, hpc$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#Close the PNG device.
dev.off()

