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