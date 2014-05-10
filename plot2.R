TB<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
TB2<-TB[(TB[,"Date"]=="1/2/2007")|(TB[,"Date"]=="2/2/2007"),]
TB2$TrueDate<-as.POSIXct(paste(TB2[,"Date"],TB2[,"Time"],sep=" "),format="%d/%m/%Y %H:%M:%S")

#windows(width=480,height=480)
png(file="plot2.png",width=480,height=480)

par(mfrow=c(1,1))
plot(TB2[,"TrueDate"],TB2[,"Global_active_power"],type="l",main="",xlab="", ylab="Global Active Power (kilowatts)")

#dev.copy(png, file = "plot3.png",width=480,height=480,units="px")
dev.off()