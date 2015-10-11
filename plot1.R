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

# Construct Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot_1 <- hist(as.numeric(as.character(hpc$Global_active_power)), col="red",
               xlab = "Global Active Power (kilowatts)",
               ylab = "Frequency",
               main = "Global Active Power")
dev.off()