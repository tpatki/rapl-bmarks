#!/bin/bash

#Export path to libmsr
curr=`pwd`

export PATH_LIBMSR=$curr/librapl/libmsr/lib
#export PATH_LIBMSR=$curr/rapl-bmarks/bmarks/librapl/libmsr/lib
echo $PATH_LIBMSR

cd librapl/libmsr
mkdir -p lib
make clean && make 

cd mpi
make clean && make rapl-icc

cd ../../../synthetic/no-scale-mem-comm
make clean && make -j8

cd ../no-scale-cpu-comm
make clean && make -j8

cd ../no-scale-mem
make clean && make -j8

cd ../no-scale-cpu
make clean && make -j8

cd ../scale-cpu
make clean && make -j8

cd ../scale-mem
make clean && make -j8


#cd ../turbo-tests
#make clean && make -j8
