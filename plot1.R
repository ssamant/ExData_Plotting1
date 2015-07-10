##read in table
powerData <- read.table("./household.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

##subset for required dates 01 Feb 2007 -- 02 Feb 2007
power2007 <- powerData[powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007",]

####create date+time column
power2007$DateTime <- as.POSIXct(paste(power2007$Date, power2007$Time), format = "%d/%m/%Y %H:%M:%S")


png("./plot1.png", width = 480, height = 480)
hist(power2007$Global_active_power, freq = TRUE, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()


