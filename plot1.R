df_f <- read.csv("C:/Users/reeti/Desktop/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df_f$Date <- as.Date(df_f$Date, format="%d/%m/%Y")

# extracting the data from the relevant dates
df_req <- subset(df_f, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(df_f)

# converting the date into a better format
datetime <- paste(as.Date(df_req$Date), df_req$Time)

df_req$Datetime <- as.POSIXct(datetime)

# This generates the first plot
hist(df_req$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# This generates plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
