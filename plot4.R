df_f <- read.csv("C:/Users/reeti/Desktop/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df_f$Date <- as.Date(df_f$Date, format="%d/%m/%Y")

# We will now extract the data from the relevant dates
df_req <- subset(df_f, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(df_f)

# We will now convert the date to a better format
datetime <- paste(as.Date(df_req$Date), df_req$Time)

df_req$Datetime <- as.POSIXct(datetime)

# The code below is used to make plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df_req, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

# The code below saves plot4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
