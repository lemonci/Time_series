z <- rnorm(500, 0, 1)
par(mfrow = c(2,1), mar = c(3,4,3,4))
plot(z, type="l", xlab="Time", ylab="Series")
acf(z, xlab="Lag", ylab="ACF", main="")

n<-500
z<-rnorm(n, 0, 1)
x.rw<-cumsum(z)
par(mfrow = c(2,1), mar=c(4,4,4,4))
plot(x.rw, type="l", xlab="Time", ylab="Series")
acf(x.rw, xlab="Lag", ylab="ACF", main="")

n<-500
z<-rnorm(n)
x.ma1<-z[2:n]-0.8*z[1:(n-1)]
x.ma2<-z[3:n]+0.7*z[2:(n-1)]-0.2*z[1:(n-2)]

par(mfrow=c(2,2), mar=c(4,4,4,4))
plot(x.ma1, type="l", xlab="Time", ylab="Series")
acf(x.ma1, xlab="Lag", ylab="ACF", main="")
plot(x.ma2, type="l", xlab="Time", ylab="Series")
acf(x.ma2, xlab="Lag", ylab="ACF", main="")

n<-500
z<-rnorm(n,0,1)
x.ar1.1<-x.ar1.2<-x.ar1.3<-rep(0,n)
for (i in 2:n){
  x.ar1.1[i]<- 0.8*x.ar1.1[i-1]+z[i]
  x.ar1.2[i]<- -0.8*x.ar1.2[i-1]+z[i]
  x.ar1.3[i]<- 0.3*x.ar1.3[i-1]+z[i]
}

par(mfrow=c(3,2), mar=c(4,4,4,4))
plot(x.ar1.1, type="l", xlab="Time", ylab="Series")
acf(x.ar1.1, xlab="Lag", ylab="ACF", main="")
plot(x.ar1.2, type="l", xlab="Time", ylab="Series")
acf(x.ar1.2, xlab="Lag", ylab="ACF", main="")
plot(x.ar1.3, type="l", xlab="Time", ylab="Series")
acf(x.ar1.3, xlab="Lag", ylab="ACF", main="")

n<-500
z<-rnorm(n,0,1)
x.ar3.1 <-rep(0,n)
for (i in 3:n){
  x.ar3.1[i]<-x.ar3.1[i-1]-0.5*x.ar3.1[i-2]+z[i]
}
par(mfrow=c(2,1))
plot(x.ar3.1, type="l", xlab="Time", ylab="Series")
acf(x.ar3.1, xlab="Lag", ylab="ACF", main="")

x1 <- arima.sim(n=500, list(ar=0.7, ma=-0.4))
x2 <- arima.sim(n=500, list(ar=c(0.9, -0.5), ma=c(-0.2,0.25)), sd=sqrt(0.5))
par(mfrow=c(2,2))
plot(x1, type="l", xlab="Time", ylab="Series")
acf(x1, xlab="Lag", ylab="ACF", main="")
plot(x2, type="l", xlab="Time", ylab="Series")
acf(x2, xlab="Lag", ylab="ACF", main="")

y1<-arima.sim(list(order=c(1,1,1), ar=-0.5, ma=-0.3), n=500)
y2<-arima.sim(list(order=c(1,1,2), ar=0.3, ma=c(-0.3,0.5)), n=500)
par(mfrow=c(2,2))
plot(y1, type="l", xlab="Time", ylab="Series")
acf(y1, xlab="Lag", ylab="ACF", main="")
plot(y2, type="l", xlab="Time", ylab="Series")
acf(y2, xlab="Lag", ylab="ACF", main="")

library("fracdiff")
x<-fracdiff.sim(2000, ar=0.3, ma=c(-0.3, 0.5), d=0.4, sd=0.2)
names(x)
par(mfrow=c(2,1))
plot(x$series, type="l", xlab="Time", ylab="Series")
acf(x$series, 50, xlab="Lag", ylab="ACF", main="")

xx <- arima.sim(list(order=c(1,1,1), ar=0.3, ma=0.9), n = 500)
yy <- fracdiff.sim(500, ar=0.3, ma=c(-0.3, 0.5), d=0.45)
par(mfrow=c(2,2))
plot(xx, type="l", xlab="Time", ylab="Series")
acf(xx, xlab="Lag", ylab="ACF", main="")
plot(yy$series, type="l", xlab="Time", ylab="Series")
acf(yy$series, xlab="Lag", ylab="ACF", main="")

