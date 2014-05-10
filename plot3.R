TB<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
TB2<-TB[(TB[,"Date"]=="1/2/2007")|(TB[,"Date"]=="2/2/2007"),]
TB2$TrueDate<-as.POSIXct(paste(TB2[,"Date"],TB2[,"Time"],sep=" "),format="%d/%m/%Y %H:%M:%S")

#windows(width=480,height=480)
png(file="plot3.png",width=480,height=480)

par(mfrow=c(1,1))
plot(TB2[,"TrueDate"],TB2[,"Sub_metering_1"],type="l",main="",xlab="", ylab="Energy sub metering",col="black")
lines(TB2[,"TrueDate"],TB2[,"Sub_metering_2"],col="red")
lines(TB2[,"TrueDate"],TB2[,"Sub_metering_3"],col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

#dev.copy(png, file = "plot3.png",width=480,height=480,units="px")
dev.off()