setwd("C:/Users/AAmaya/Downloads/exdata_data_household_power_consumption")

# plot3.R 
data_file <- "household_power_consumption.txt"

# Leer solo las filas necesarias
data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)

# Convertir a clase Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filtrar fechas
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


# Combinar Fecha y Hora en un solo objeto POSIX
datetime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data$Datetime <- datetime

png("plot3.png", width = 480, height = 480)
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
