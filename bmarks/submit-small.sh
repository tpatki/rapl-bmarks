#!/bin/bash

cd NAS-MZ/SP-MZ/power
msub rapl-runs-small.msub

cd ../../BT-MZ/power
msub rapl-runs-small.msub

cd ../../LU-MZ/power
msub rapl-runs-small.msub


cd ../../../lulesh/power
msub rapl-runs-small.msub

cd ../../sphot/power
msub rapl-runs-small.msub

#cd ../../hypre/power
#msub rapl-runs-small.msub
