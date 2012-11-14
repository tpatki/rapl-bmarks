#!/bin/bash

#mkdir bin

make bt-mz CLASS=A NPROCS=16

make -j8 bt-mz CLASS=C NPROCS=1
make -j8 bt-mz CLASS=C NPROCS=2
make -j8 bt-mz CLASS=C NPROCS=4
make -j8 bt-mz CLASS=C NPROCS=8
make -j8 bt-mz CLASS=C NPROCS=16
make -j8 bt-mz CLASS=C NPROCS=32
#make -j8 bt-mz CLASS=C NPROCS=64
#make -j8 bt-mz CLASS=C NPROCS=128
#make bt-mz CLASS=C NPROCS=256
#make bt-mz CLASS=C NPROCS=512
#make bt-mz CLASS=C NPROCS=1024
