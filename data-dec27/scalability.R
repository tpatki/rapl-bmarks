plotbmark <- function(inpFile, bmarkName, powerBound){

d<-read.table(inpFile, header=T)

d$totalCores[d$pkg.clamp.0==powerBound] = d$nodes[d$pkg.clamp.0==powerBound] * d$cores[d$pkg.clamp.0==powerBound]
d$speedup[d$pkg.clamp.0==powerBound] = max(d$avg.time[d$pkg.clamp.0==powerBound])/(d$avg.time[d$pkg.clamp.0==powerBound])

ymin = 1
ymax = 16


plot(d$totalCores[d$pkg.clamp.0==95], d$speedup[d$pkg.clamp.0==95],log="xy",axes=FALSE, xlab="Number of total cores", ylab="Speedup", ylim=c(ymin,ymax))
box(which="plot",lty=1)
axis(2,at=(2^(0:4)), lab=(2^(0:4)))
axis(1,at=(2^(5:9)), lab=(2^(5:9)))
abline(h=(2^(0:4)), lty=2, col="lightgray")
abline(v=(2^(5:9)), lty=2, col="lightgray")


#End of function
}

pdf("scalability-synth.pdf")
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("scale-cpu.out", "scale-cpu", 95)
plotbmark("no-scale-cpu.out", "no-scale-cpu", 95)
plotbmark("scale-mem.out", "scale-mem", 95)
plotbmark("no-scale-mem.out", "no-scale-mem", 95)
dev.off()
