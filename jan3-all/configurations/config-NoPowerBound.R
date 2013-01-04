plotConfig<-function(inpFile,bmarkName,powerBound){
	d<-read.table(inpFile, header=T)
	d$totCores=d$nodes * d$cores
#	d1<-d[(d$Valid=="yes" & (d$pkg.clamp.0==51 | d$pkg.clamp.0 == 95 | d$pkg.clamp.0==115)),]
	d1<-d[(d$Valid=="yes" & (d$pkg.clamp.0==115)),]
	d2<-d1[d1$totCores==(max(d1$totCores)),]
	canonical<-d2[d2$pkg.clamp.0==max(d2$pkg.clamp.0),]
	canonical
	attach(d1)
	sort(d1$avg.time)
	ymin = floor(min(d1[1:12, "totalPow"], canonical[,"totalPow"]))- 500
	ymax = powerBound + 100
#	ymax = ceiling(canonical[,"totalPow"]) + 200
	xmin=1
	xmax=13

	plot(seq(1,12,by=1), d1[1:12,"totalPow"],xlab="Twelve Best Configurations (sorted) and the Canonical Configuration, <n, c, p>", ylab="Total Power Consumed (W)", axes=FALSE, ylim=c(ymin,ymax),pch=17,xlim=c(xmin,xmax))
	points(13, canonical[,"totalPow"], pch=15, col="red") 		
#	axis(1, at=seq(1,12,by=1), lab=paste("(", d1[1:12, "nodes"], ",", d1[1:12, "cores"], ",", d1[1:12, "pkg.clamp.0"], ")"), cex.axis=0.8)
axis(1, at=seq(1,13,by=1), lab=c(paste("(", d1[1:12, "nodes"], ",", d1[1:12, "cores"], ",", d1[1:12, "pkg.clamp.0"], ")"), paste("(",canonical$nodes,",",canonical$cores,",",canonical$pkg.clamp.0,")")), cex.axis=0.8)
	axis(2, at=c(ymin, seq(floor(ymin/1000)*1000,ymax, by=2000),ymax), lab=c(ymin,seq(floor(ymin/1000)*1000,ymax, by=2000),ymax),cex.axis=1)
#	abline(h=powerBound, lty=2, col="darkgray")
	title(main=paste("Benchmark: ", bmarkName,"; No Global Power Bound Enforced" ), cex=0.5)
	text(1, d1[1, "totalPow"]-400, paste(signif(d1[1,"avg.time"],5), "s"), cex=0.9)
	text(2, d1[2, "totalPow"]-400, paste(signif(d1[2,"avg.time"],5), "s"), cex=0.9)
	text(3, d1[3, "totalPow"]-400, paste(signif(d1[3,"avg.time"],5), "s"), cex=0.9)
	text(4, d1[4, "totalPow"]-400, paste(signif(d1[4,"avg.time"],5), "s"), cex=0.9)
	text(5, d1[5, "totalPow"]-400, paste(signif(d1[5,"avg.time"],5), "s"), cex=0.9)
	text(6, d1[6, "totalPow"]-400, paste(signif(d1[6,"avg.time"],5), "s"), cex=0.9)
	text(7, d1[7, "totalPow"]-400, paste(signif(d1[7,"avg.time"],5), "s"), cex=0.9)
	text(8, d1[8, "totalPow"]-400, paste(signif(d1[8,"avg.time"],5), "s"), cex=0.9)
	text(9, d1[9, "totalPow"]-400, paste(signif(d1[9,"avg.time"],5), "s"), cex=0.9)
	text(10, d1[10, "totalPow"]-400, paste(signif(d1[10,"avg.time"],5), "s"), cex=0.9)
	text(11, d1[11, "totalPow"]-400, paste(signif(d1[11,"avg.time"],5), "s"), cex=0.9)
	text(12, d1[12, "totalPow"]-400, paste(signif(d1[12,"avg.time"],5), "s"), cex=0.9)
	text(13, canonical[, "totalPow"]-400, paste(signif(canonical[,"avg.time"],5), "s"), cex=0.9)
	box(which="plot", lty=1)


#	text(7.5, powerBound+50, paste(powerBound, "W"), cex=0.9, col="darkgray")
	detach(d1)
	
}

pdf("synthConfigNoPowerBound.pdf",width=10,height=12)
par(mar=c(4,4,3,3),oma=c(1,1,1,1))
layout(matrix(seq(1,6,by=1),6,1,byrow=TRUE))
plotConfig("scale-cpu.out.10000", "CPU-bound, scalable", 6500)
plotConfig("scale-mem.out.10000", "Memory-bound, scalable", 6500)
plotConfig("no-scale-cpu.out.10000", "CPU-bound, not scalable", 6500)
plotConfig("no-scale-mem.out.10000", "Memory-bound, not scalable", 6500)
plotConfig("no-scale-cpu-comm.out.10000", "CPU-bound, not scalable, more communication", 6500)
plotConfig("no-scale-mem-comm.out.10000", "Memory-bound, not scalable, more communication", 6500)
dev.off()


#pdf("realConfig.pdf",width=10,height=9)
#par(mar=c(4,4,3,2),oma=c(1,1,1,1))
#layout(matrix(seq(1,4,by=1),4,1,byrow=TRUE))
#plotConfig("sphot.out.3000", "SPhot", 3000)
#plotConfig("bt-mz.out.3000", "BT-MZ", 3000)
#plotConfig("sp-mz.out.3000", "SP-MZ", 3000)
#plotConfig("lu-mz.out.3000", "LU-MZ", 3000)
#dev.off()


pdf("realConfigNoPowerBound.pdf",width=10,height=9)
par(mar=c(4,4,3,2),oma=c(1,1,1,1))
layout(matrix(seq(1,4,by=1),4,1,byrow=TRUE))
plotConfig("sphot.out.10000", "SPhot", 6500)
plotConfig("bt-mz.out.10000", "BT-MZ", 6500)
plotConfig("sp-mz.out.10000", "SP-MZ", 6500)
plotConfig("lu-mz.out.10000", "LU-MZ", 6500)
dev.off()
