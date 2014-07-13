setwd("/Users/eric/Downloads")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data[,1]<-as.Date(strptime((data[,1]),format="%d/%m/%Y"))

Feb01<-data[data[,1]==as.Date("2007-02-01"),]
Feb02<-data[data[,1]==as.Date("2007-02-02"),]
both<-rbind(Feb01,Feb02)
for (i in 3:9) {
  both[,i]<-as.numeric(as.character(both[,i]))
}
##plot1
par(mfrow=c(1,1))
hist(as.numeric(both[,3]),
     col="Red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power",ylim=c(0,1200),xlim=c(0,6))
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()
