d<-read.table("powerBound.out", header=T)

xmin=50
xmax=130

ymin=round(min(d$avg.time),0)
ymax=round(max(d$avg.time),0) + 1

ymin
ymax

pdf("PowerBoundImpact.pdf",width=3.25, height=3.25)

par(cex.axis=0.8, cex.lab=0.8)

#plot(d$pkg.clamp.0[d$bmark=="spmz"], d$avg.time[d$bmark=="spmz"])

plot(d$pkg.clamp.0[d$bmark=="spmz"], d$avg.time[d$bmark=="spmz"], col="darkred", cex=0.4, xlab="Power Bound (Watts)", ylab="Runtime (seconds)",xlim=c(xmin,xmax), ylim=c(ymin,ymax),axes=FALSE,mgp=c(2,1,0),type="o", lwd=0.5, pch=16)
title(main="Impact of varying the PKG power bound\n on performance (n=32, c=16)", cex.main=0.65)
box(which="plot",lty=1)
lines(d$pkg.clamp.0[d$bmark=="sphot"], d$avg.time[d$bmark=="sphot"], cex=0.4, col="blue",type="o", lwd=0.5,pch=16)
lines(d$pkg.clamp.0[d$bmark=="btmz"], d$avg.time[d$bmark=="btmz"], cex=0.4, col="darkgreen",type="o", lwd=0.5,pch=16)
lines(d$pkg.clamp.0[d$bmark=="lumz"], d$avg.time[d$bmark=="lumz"], cex=0.4, col="black",type="o", lwd=0.5,pch=16)

text(122,7,"btmz", col="black", cex=0.5)
text(122,4,"spmz", col="black", cex=0.5)
text(122,10,"lumz", col="black", cex=0.5)
text(122,33,"sphot", col="black", cex=0.5)

axis(1,at=c(51,65,80,95,115), lab=c(51,65,80,95,115))
axis(2, at=seq(ymin,ymax, by=10), lab=seq(ymin,ymax,by=10))

dev.off()
