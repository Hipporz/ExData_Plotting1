setwd("/Users/eric/Downloads")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data[,1]<-as.Date(strptime((data[,1]),format="%d/%m/%Y"))

Feb01<-data[data[,1]==as.Date("2007-02-01"),]
Feb02<-data[data[,1]==as.Date("2007-02-02"),]
both<-rbind(Feb01,Feb02)
for (i in 3:9) {
  both[,i]<-as.numeric(as.character(both[,i]))
}

plot(as.POSIXct(paste(both[,1],both[,2]),format="%Y-%m-%d %H:%M:%S"),both[,3],
     type="l",main="",xlab="",ylab="Global Active Power(kilowatts)")
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()
