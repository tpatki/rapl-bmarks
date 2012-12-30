#!/bin/bash

#mkdir bin

#make sp-mz CLASS=A NPROCS=16

#make -j8 sp-mz CLASS=C NPROCS=1
#make -j8 sp-mz CLASS=C NPROCS=2
make -j8 sp-mz CLASS=C NPROCS=4
make -j8 sp-mz CLASS=C NPROCS=8
make -j8 sp-mz CLASS=C NPROCS=16
make -j8 sp-mz CLASS=C NPROCS=32
make sp-mz CLASS=C NPROCS=64
#make sp-mz CLASS=C NPROCS=128
#make sp-mz CLASS=C NPROCS=256
#make sp-mz CLASS=C NPROCS=512
#make sp-mz CLASS=C NPROCS=1024
