#!/bin/bash

cd synthetic/no-scale-cpu
msub rapl-runs-small.msub

cd ../scale-cpu
msub rapl-runs-small.msub

