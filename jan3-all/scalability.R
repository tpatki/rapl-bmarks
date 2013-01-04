plotbmark <- function(inpFile, bmarkName, powerBound){

d<-read.table(inpFile, header=T)

d$totalCores[d$pkg.clamp.0==powerBound] = d$nodes[d$pkg.clamp.0==powerBound] * d$cores[d$pkg.clamp.0==powerBound]
d$speedup[d$pkg.clamp.0==powerBound] = max(d$avg.time[d$pkg.clamp.0==powerBound])/(d$avg.time[d$pkg.clamp.0==powerBound])

ymin = 1
ymax = 16


plot(d$totalCores[d$pkg.clamp.0==powerBound], d$speedup[d$pkg.clamp.0==powerBound],log="xy",axes=FALSE, xlab="Number of total cores", ylab="Speedup", ylim=c(ymin,ymax),pch=2)
box(which="plot",lty=1)
axis(2,at=(2^(0:4)), lab=(2^(0:4)))
axis(1,at=(2^(5:9)), lab=(2^(5:9)))
abline(h=(2^(0:4)), lty=2, col="lightgray")
abline(v=(2^(5:9)), lty=2, col="lightgray")
title(main=bmarkName, cex=0.4)


#End of function
}

pdf("scalability-synth.pdf", width=9)
par(mar=c(6,4,3,2),oma=c(1,1,5,1))
layout(matrix(seq(1,6,by=1),2,3,byrow=TRUE))
plotbmark("scale-cpu.out", "CPU-bound, scalable", 95)
plotbmark("no-scale-cpu.out", "CPU-bound, not scalable", 95)
plotbmark("scale-mem.out", "Memory-bound, scalable", 95)
plotbmark("no-scale-mem.out", "Memory-bound, not scalable", 95)
plotbmark("no-scale-cpu-comm.out", "CPU-bound, not scalable \n(more communication)", 95)
plotbmark("no-scale-mem-comm.out", "Memory-bound, not scalable \n (more communication)", 95)
mtext("Scalability Characteristics of Synthetic Benchmarks \n at 95W, without turbo", side = 3, line = 1, outer = TRUE, cex=1.1)
dev.off()


pdf("scalability-real.pdf")
par(mar=c(4,4,3,2),oma=c(2,2,5,2))
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("sphot.out", "SPhot", 95)
plotbmark("bt-mz.out", "BT-MZ", 95)
plotbmark("sp-mz.out", "SP-MZ", 95)
plotbmark("lu-mz.out", "LU-MZ", 95)
mtext("Scalability Characteristics of Real Benchmarks \n at 95W, without turbo", side = 3, line = 1, outer = TRUE, cex=1.2)
dev.off()


pdf("scalability-synth-115.pdf", width=9)
par(mar=c(6,4,3,2),oma=c(1,1,5,1))
#par(mar=c(2,2,2,2),oma=c(2,2,5,2))
layout(matrix(seq(1,6,by=1),2,3,byrow=TRUE))
plotbmark("scale-cpu.out", "CPU-bound, scalable",115)
plotbmark("no-scale-cpu.out", "CPU-bound, not scalable", 115)
plotbmark("scale-mem.out", "Memory-bound, scalable", 115)
plotbmark("no-scale-mem.out", "Memory-bound not scalable", 115)
plotbmark("no-scale-cpu-comm.out", "CPU-bound, not scalable \n (more communication)", 115)
plotbmark("no-scale-mem-comm.out", "Memory-bound, not scalable \n (more communication)", 115)
mtext("Scalability Characteristics of Synthetic Benchmarks \n at 115W, with turbo", side = 3, line = 1, outer = TRUE,cex=1.2)
dev.off()


pdf("scalability-real-115.pdf")
par(mar=c(4,4,3,2),oma=c(2,2,5,2))
#par(mar=c(2,2,2,2),oma=c(2,2,5,2))
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("sphot.out", "SPhot", 115)
plotbmark("bt-mz.out", "BT-MZ", 115)
plotbmark("sp-mz.out", "SP-MZ", 115)
plotbmark("lu-mz.out", "LU-MZ", 115)
mtext("Scalability Characteristics of Real Benchmarks \n at 115W, with turbo", side = 3, line = 1, outer = TRUE, cex=1.2)
dev.off()


pdf("scalability-synth-51.pdf", width=9)
par(mar=c(6,4,3,2),oma=c(1,1,5,1))
#par(mar=c(2,2,2,2),oma=c(2,2,5,2))
layout(matrix(seq(1,6,by=1),2,3,byrow=TRUE))
plotbmark("scale-cpu.out", "CPU-bound, scalable",51)
plotbmark("no-scale-cpu.out", "CPU-bound, not scalable", 51)
plotbmark("scale-mem.out", "Memory-bound, scalable", 51)
plotbmark("no-scale-mem.out", "Memory-bound not scalable", 51)
plotbmark("no-scale-cpu-comm.out", "CPU-bound, not scalable \n (more communication)", 51)
plotbmark("no-scale-mem-comm.out", "Memory-bound, not scalable \n (more communication)", 51)
mtext("Scalability Characteristics of Synthetic Benchmarks \n at 51W, with turbo", side = 3, line = 1, outer = TRUE,cex=1.2)
dev.off()


pdf("scalability-real-51.pdf")
par(mar=c(4,4,3,2),oma=c(2,2,5,2))
#par(mar=c(2,2,2,2),oma=c(2,2,5,2))
layout(matrix(seq(1,4,by=1),2,2,byrow=TRUE))
plotbmark("sphot.out", "SPhot", 51)
plotbmark("bt-mz.out", "BT-MZ", 51)
plotbmark("sp-mz.out", "SP-MZ", 51)
plotbmark("lu-mz.out", "LU-MZ", 51)
mtext("Scalability Characteristics of Real Benchmarks \n at 51W, with turbo", side = 3, line = 1, outer = TRUE, cex=1.2)
dev.off()
