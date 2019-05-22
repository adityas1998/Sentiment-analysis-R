c<-read.csv("Reviews.csv")
v<-c
x<-v[1:100,c("ProductId","Time","Score")]
g<-subset(x,ProductId=="B001GVISJM")
i<-g$Time
y<-x[order(x$Time),]
g<-subset(y,ProductId=="B001GVISJM")
jpeg("")
plot(as.Date(as.POSIXct(i, origin="1970-01-01")),g$Score,xlab="Years",ylab="Sentiment Score",main=g$ProductId,cex=1,col="red")
dev.off()

