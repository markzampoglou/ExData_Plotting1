TB<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
TB2<-TB[(TB[,"Date"]=="1/2/2007")|(TB[,"Date"]=="2/2/2007"),]
TB2$TrueDate<-as.POSIXct(paste(TB2[,"Date"],TB2[,"Time"],sep=" "),format="%d/%m/%Y %H:%M:%S")

#windows(width=480,height=480)
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))
plot(TB2[,"TrueDate"],TB2[,"Global_active_power"],type="l",main="",xlab="", ylab="Global Active Power (kilowatts)")
plot(TB2[,"TrueDate"],TB2[,"Voltage"],type="l",main="",xlab="datetime", ylab="Voltage")
plot(TB2[,"TrueDate"],TB2[,"Sub_metering_1"],type="l",main="",xlab="", ylab="Energy sub metering",col="black")
lines(TB2[,"TrueDate"],TB2[,"Sub_metering_2"],col="green")
lines(TB2[,"TrueDate"],TB2[,"Sub_metering_3"],col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","green","blue"),lty=c(1,1,1),border = "",bty="n")
plot(TB2[,"TrueDate"],TB2[,"Global_reactive_power"],type="l",main="",xlab="datetime", ylab="Global_reactive_power")

#dev.copy(png, file = "plot4.png",width=480,height=480,units="px")
dev.off()