library(data.table)
dt<-fread("household_power_consumption.txt")
setkey(dt,Date)
twodays<-dt[J(c('1/2/2007','2/2/2007')),]

gap<-as.numeric(twodays[,Global_active_power])
vol<-as.numeric(twodays[,Voltage])
subm1<-as.numeric(twodays[,Sub_metering_1])
subm2<-as.numeric(twodays[,Sub_metering_2])
subm3<-as.numeric(twodays[,Sub_metering_3])
grp<-as.numeric(twodays[,Global_reactive_power])
datev<-strptime(paste(twodays[,Date],twodays[,Time], sep=' '),'%d/%m/%Y %H:%M:%S')


png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
#------------------------------------------------------------------
par(mar=c(3,6,2,2))
hist(gap,main="Global Active Power",col="red",xlab='Global Active Power (kilowatts)')


#------------------------------------------------------------------

par(mar=c(3,6,2,2))
plot(datev,subm1,xlab="",ylab='Energy sub metering',type="o",cex=0)
lines(datev,subm2,type="o",cex=0,col="red")
lines(datev,subm3,type="o",cex=0,col="blue")
legend("topright", box.lwd = 0,box.col = "white",bg = "white", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","blue","red"),cex=0.7)


#------------------------------------------------------------------
par(mar=c(4,4,1,4))
plot(datev,vol,xlab="datetime",ylab='Voltage',type="o",cex=0)

#------------------------------------------------------------------
par(mar=c(4,4,2,4))
plot(datev,grp,xlab="datetime",ylab='Global Reactive Power',type="o",cex=0)
dev.off()
