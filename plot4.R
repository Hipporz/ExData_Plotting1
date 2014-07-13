setwd("/Users/eric/Downloads")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data[,1]<-as.Date(strptime((data[,1]),format="%d/%m/%Y"))

Feb01<-data[data[,1]==as.Date("2007-02-01"),]
Feb02<-data[data[,1]==as.Date("2007-02-02"),]
both<-rbind(Feb01,Feb02)
for (i in 3:9) {
  both[,i]<-as.numeric(as.character(both[,i]))
}
par(mfrow=c(2,2))
plot(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,3],
     type="l",main="",xlab="",ylab="Global Active Power(kilowatts)")

plot(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,5],
     type="l",xlab="datetime",ylab="Volltage")

plot(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,7],type="l",xlab="",ylab="Energy sub metering")
lines(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,8],col="Red",xlab="")
lines(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,9],col="Blue",xlab="")
legend("topright", pch =NA,lwd=2,lty=1, col = c("black", "red","Blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n",cex=0.6)

plot(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,4],
     type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()
