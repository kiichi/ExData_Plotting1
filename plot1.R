library(data.table)
dt<-fread("household_power_consumption.txt")
setkey(dt,Date)
twodays<-dt[J(c('2/1/2007','2/2/2007')),]
gap<-as.numeric(twodays[,Global_active_power])

png("plot1.png",width=480,height=480)
hist(gap,main="Global Active Power",col="red",xlab='Global Active Power (kilowatts)')
dev.off()