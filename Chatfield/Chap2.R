#smooth.sym<-function(my.ts, window.q){
#  window.size<-2*window.q+1
#  my.ts.sm<-rep(0, length(my.ts)-window.size)
#  for (i in 1:length(my.ts.sm)){
#    my.ts.sm[i]<-mean(my.ts[i:(i+window.size-1)])
#  }
#  my.ts.sm
#} # moving average with equal and symmetric weights

smooth.sym<-function(my.ts, window.q){
  window.size<-2*window.q+1
  my.ts.sm<-rep(0, length(my.ts)-window.size)
  for (i in 1:length(my.ts.sm)){
    my.ts.sm[i]<-mean(my.ts[i:(i+window.size-1)])
  }
  my.ts.sm
} # moving average with equal and symmetric weights

# smooth.spencer<-function(my.ts){
#   weight<-c(-3, -6, -5, 3, 21, 46, 67, 74, 67, 46, 21, 3, -5, -6, -3)/320
#   my.ts.sm<-rep(0, length(my.ts)-15)
#   for (i in 1:length(my.ts.sm)){
#     my.ts.sm[i]<-sum(my.ts[i:(i+14)*weight])
#   }
#   my.ts.sm
# } # Spencer's 15-point moving average

smooth.spencer<-function(my.ts){
  weight<-c(-3,-6,-5,3,21,46,67,74,67,46,21,3,-5,-6,-3)/320
  my.ts.sm<-rep(0, length(my.ts)-15)
  for (i in 1:length(my.ts.sm)){
    my.ts.sm[i]<-sum(my.ts[i:(i+14)]*weight)
  }
  my.ts.sm
} # Spencer’s 15-point moving average

library(tseries)
data(bev)
bev.sm<-smooth.sym(bev, 7)
bev.spencer<-smooth.spencer(bev)
x.pos<-c(1500, 1560, 1620, 1680, 1740, 1800, 1869)
par(mfrow=c(3,1), mar=c(4,4,4,4))
plot(bev, type="l", xlab="Year", ylab="Index", xaxt="n")
axis(1, x.pos, x.pos)
plot(c(1, length(bev)), c(0, max(bev)), type="n", xlab="Year", ylab="Index", xaxt="n")
lines(seq(8, length(bev)-8), bev.sm)
axis(1, x.pos-1500+1, x.pos)
plot(c(1, length(bev)), c(0, max(bev)), type="n", xlab="Year", ylab="Index", xaxt="n")
lines(seq(8, length(bev)-8), bev.spencer)
axis(1, x.pos-1500+1, x.pos)

wine<-read.csv("../data/aus_wine_sales.csv", header=F)
wine.ts<-ts(wine[,2], frequency=4, start=c(1985,1)) # create a time series object
wine.de<-decompose(wine.ts, type="additive")
plot(wine.de)

set(seed1)
x <- rnorm(400)
par(mfrow=c(2,1), mac=c(3,4,3,4))
plot(x, type="l", xlab="", ylab="")
title(xlab="Time", ylab="Series", line=2, cex.lab=1.2)
acf(x,ylab="", main="")
title(xlab="Lag", ylab="ACF", line=2)

set.seed(1)
ts.sim3<-cumsum(rnorm(400))
par(mfrow=c(2,1), mar=c(3,4,3,4))
plot(ts.sim3, type="l", xlab="", ylab="")
title(xlab="Time", ylab="Series", line=2, cex.lab=1.2)
acf(ts.sim3, ylab="",main="")
title(xlab="Lag", ylab="ACF", line=2)

# Ex 2.1
x.data <- c(153, 189, 221, 215, 302, 223, 201, 173, 121, 106, 86, 87, 108, 133, 177, 241, 228, 283, 255, 238, 164, 128, 108, 87, 74, 95, 145, 200, 187, 201, 292, 220, 233, 172, 119, 81, 65, 76, 74, 111, 170, 243, 178, 248, 202, 163, 139, 120, 96, 95, 53, 94)
# x <- matrix(x.data,nrow=4,ncol=13,byrow=TRUE) This will make ts crush
time_ser=ts(x.data,frequency=13,start=c(1995,1), end=c(1998,13))
plot(time_ser, type="l", xlab="week period", ylab="sales")
# Ex 2.2
time_ser2=ts(c(1.6, 0.8, 1.2, 0.5, 0.9, 1.1, 1.1, 0.6, 1.5, 0.8, 0.9, 1.2, 0.5, 1.3, 0.8, 1.2))
plot(time_ser2, type="l", xlab="", ylab="")
# Ex 2.4
x =c(0.02, 0.05, -0.09, 0.08, -0.02, 0.00, 0.12, 0.06, 0.02, -0.08)
acf(x)