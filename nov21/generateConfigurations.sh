#!/usr/bin/env Rscript

args<-commandArgs(trailingOnly=T)
print(args)

d<-read.table(args[1],header=T)
powerBound<-args[2]
print(powerBound)


d$totalPow<-(d$tot.pkg.0 + d$tot.pkg.1 + d$tot.dram.0 + d$tot.dram.1)
d$totalPow
d$Valid<- ifelse(as.numeric(d$totalPow) <= as.numeric(powerBound), "yes", "no")
d$Valid

attach(d)
d<-d[with(d,order(avg.time, -totalPow)),]
detach(d)

#d3<-d2[,c("id", "nodes", "cores", "pkg.clamp.0", "avg.time", "avg.pkg.0", "totalPow")]
write.table(d[,c("id", "nodes", "cores", "avg.time", "pkg.clamp.0", "avg.pkg.0", "totalPow", "Valid")], file=paste(args[1], ".", args[2], sep=""))
