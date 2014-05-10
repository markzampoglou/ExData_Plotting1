TB<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
TB2<-TB[(TB[,"Date"]=="1/2/2007")|(TB[,"Date"]=="2/2/2007"),]
TB2$TrueDate<-as.POSIXct(paste(TB2[,"Date"],TB2[,"Time"],sep=" "),format="%d/%m/%Y %H:%M:%S")

# code for displaying plots both on screen and file has been commented out and replaced by code 
# that only writes to file, as building plot on window and then writing to png produces images
# of relatively lower quality than direct disk writing

# windows(width=480,height=480)
png(file="plot1.png",width=480,height=480)

par(mfrow=c(1,1))
hist(TB2[,"Global_active_power"],main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")

# dev.copy(png, file = "plot3.png",width=480,height=480,units="px")
dev.off()