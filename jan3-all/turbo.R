d<-read.table("turbo-one-node.out", header=T)

d$effective = signif((2.601 * d$freq.ratio), 4)
d$speedup = (max(d$avg.time)/d$avg.time)

pdf("turbo-one-node.pdf")
par(mar=c(4,4,1,1),oma=c(1,1,4,1))

layout(matrix(seq(1,3,by=1),3,1,byrow=TRUE))


plot(d$cores, d$effective,xlab="Number of cores", ylab="Effective Frequency (GHz)", xaxt='n')
#title(main="Turbo frequencies at varying core counts on a single node")
box(which="plot",lty=1)
axis(1,at=seq(0,16,by=1), lab=seq(0,16,by=1))

plot(d$cores, d$speedup,xlab="Number of cores", ylab="Speedup", axes=FALSE)
#title(main="Turbo frequencies at varying core counts on a single node")
box(which="plot",lty=1)
axis(1,at=seq(0,16,by=1), lab=seq(0,16,by=1))
axis(2,at=seq(0,18,by=4), lab=seq(0,18,by=4))


plot(d$cores, d$pkg.clamp.0, xlab="Number of cores", ylab="Package Power (W)", xaxt='n')
#title(main="Turbo frequencies at varying core counts on a single node")
box(which="plot",lty=1)
axis(1,at=seq(0,16,by=1), lab=seq(0,16,by=1))

mtext(side=3, cex=1, "Results of Intel Turbo Boost on a single node \n (Synthetic Benchmark 1, CPU-bound, scalable)", outer=TRUE)
dev.off()
