# Set the working directory for the project
setwd("C:/Users/Ankit Malik/Desktop/EDA/Course_Project_1/")
getwd()

# Read data from the txt file
hpc <- read.csv("household_power_consumption.txt", sep=";")

# Subset data to include only 2 days
hpc$Date <- as.character(hpc$Date)
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time columns to date and time format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time <- strptime(hpc$Time,"%H:%M:%S")
hpc$Time <- strftime(hpc$Time, "%H:%M:%S")
hpc$datetime <- paste(hpc$Date,hpc$Time, sep=' ')
hpc$datetime <- strptime(hpc$datetime, format="%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))

# Construct Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(hpc, plot(datetime,Global_active_power,ylab = "Global Active Power",
               xlab = " ", type = "l"))
with(hpc, plot(datetime, as.numeric(as.character(Voltage)), ylab = "voltage",
               xlab = "datetime", type = "l"))
with(hpc, plot(datetime, as.numeric(as.character(Sub_metering_1)), 
               type = "l", ylab = "Energy sub metering",
               xlab = " "))
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_2)), col="red")
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_3)), col="blue")
legend("topright", lwd = 1, bty = "n", cex = 0.5, col=c("black","red","blue"), legend = c('Sub_metering_1',
                                                                'Sub_metering_2',
                                                                'Sub_metering_3'))
with(hpc, plot(datetime, as.numeric(as.character(Global_reactive_power)), type = "l",
               ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()