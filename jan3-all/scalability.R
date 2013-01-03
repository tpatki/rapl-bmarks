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


#End of function
}

pdf("scalability-synth.pdf")
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("scale-cpu.out", "scale-cpu", 95)
plotbmark("no-scale-cpu.out", "no-scale-cpu", 95)
plotbmark("scale-mem.out", "scale-mem", 95)
plotbmark("no-scale-mem.out", "no-scale-mem", 95)
dev.off()


pdf("scalability-real.pdf")
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("sphot.out", "sphot", 95)
plotbmark("bt-mz.out", "bt-mz", 95)
plotbmark("sp-mz.out", "sp-mz", 95)
plotbmark("lu-mz.out", "lu-mz", 95)
dev.off()


pdf("scalability-synth-115.pdf")
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("scale-cpu.out", "scale-cpu",115)
plotbmark("no-scale-cpu.out", "no-scale-cpu", 115)
plotbmark("scale-mem.out", "scale-mem", 115)
plotbmark("no-scale-mem.out", "no-scale-mem", 115)
dev.off()


pdf("scalability-real-115.pdf")
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("sphot.out", "sphot", 115)
plotbmark("bt-mz.out", "bt-mz", 115)
plotbmark("sp-mz.out", "sp-mz", 115)
plotbmark("lu-mz.out", "lu-mz", 115)
dev.off()
