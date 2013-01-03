plotbmark <- function(inpFile, bmarkName, powerBound){

d<-read.table(inpFile, header=T)

d$totalCores[d$pkg.clamp.0==powerBound] = d$nodes[d$pkg.clamp.0==powerBound] * d$cores[d$pkg.clamp.0==powerBound]
d$speedup[d$pkg.clamp.0==powerBound] = max(d$avg.time[d$pkg.clamp.0==powerBound])/(d$avg.time[d$pkg.clamp.0==powerBound])

ymin = 1
ymax = 16


plot(d$totalCores[d$pkg.clamp.0==powerBound], d$speedup[d$pkg.clamp.0==powerBound],log="xy",axes=FALSE, xlab="Number of total cores", ylab="Speedup", ylim=c(ymin,ymax))
box(which="plot",lty=1)
axis(2,at=(2^(0:4)), lab=(2^(0:4)))
axis(1,at=(2^(5:9)), lab=(2^(5:9)))
abline(h=(2^(0:4)), lty=2, col="lightgray")
abline(v=(2^(5:9)), lty=2, col="lightgray")
title(main=bmarkName)


#End of function
}

pdf("test.pdf")
plotbmark("no-scale-cpu-comm.out", "CPU-bound, not scalable version 2", 95)
dev.off()

pdf("test2.pdf")
plotbmark("no-scale-mem-comm.out", "Mem-bound, not scalable version 2", 95)
dev.off()
