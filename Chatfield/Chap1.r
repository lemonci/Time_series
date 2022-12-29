library(tseries) # load the library
data(bev) # load the dataset
plot(bev, xlab="Year", ylab="Wheat price index", xaxt = "n")
x.pos <- c(1500, 1560, 1620, 1680, 1740, 1800, 1869) # define x-axis labels
axia(1, x.pos, x.pos)

sp500<-read.csv("mydata/sp500_ret_1995-2016.csv")
n<-nrow(sp500)
x.pos<-c(seq(1,n,800),n)
plot(sp500$Return, type="l", xlab="Day", ylab="Daily return", xaxt="n")
axis(1, x.pos, sp500$Data[x.pos])

pop<-read.csv("mydata/US_pop_birthrate.csv", header=T)
x.pos<-c(seq(1, 56, 7), 56)
x.label<-c(seq(1960, 2009, by=7), 2015)
par(mfrow=c(2,1), mar=c(3,4,3,4))
plot(pop[,2], type="l", xlab="", ylab="", xaxt="n")
axis(1, x.pos, x.label, cex.axis=1.2)
title(xlab="Year", ylab="Population", line=2, cex.lab=1.2)
plot(pop[,3], type="l", xlab="", ylab="", xaxt="n")
points(pop[,3])
axis(1, x.pos, x.label, cex.axis=1.2)
title(xlab="Year", ylab="Birth rates", line=2, cex.lab=1.2)

ibm<-read.table("mydata/taq_trade_ibm_100104.txt", header = T, sep="\t")
ibm.new<-ibm[,c(1,2,7)]
ibm[,2]<-as.numric(as.character(ibm[,2]))
### take 9:35:00-9:37:59am trading record
data<-ibm.new[1458:2371,]
newtime<-rep(0, nrow(data))
for (i in 1:nrow(data)){
  min<-as.numeric(substr(as.character(data$TIME[i]), 3, 4))
  sec<-as.numeric(substr(as.character(data$TIME[i]), 6, 7))
  newtime[i]<- (min-30)*60+sec
}
x.label<-c("9:35:00", "9:35:31", "9:36:00", "9:36:30", "9:37:00", "9:37:30", "9:38:00")
x.pos<-c(1, 139, 249, 485, 619, 776, 914)

par(mfrow=c(2,1), mar=c(2,4,2,4))
plot(newtime, data[,2], xlab="", ylab="", xaxt="n", type="h")
axis(1, newtime[x.pos], x.lable, cex.axis=1.2)
title(xlab="Time", ylab="Price", line=2, cex.lab=1.2)
plot(newtime, data[,3], xlab=", ylab=", xaxt="n", type="h")
axis(1, newtime[x.pos], x.lable, cex.axis=1.2)
title(xlab="Time", ylab="Volume", line=2, cex.lab=1.2)

# Updated thesis comments