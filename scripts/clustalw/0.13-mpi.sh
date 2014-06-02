#!/bin/bash -e

################################################################################
# clustalw version 0.13-mpi INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   
################################################################################


export CC=mpicc
export CXX=mpic++
export CFLAGS=-O3
export CXXFLAGS=-O3

make clean
make
mkdir -p $APPDIR
cp -af * $APPDIR
exit $EXITSTATUS
