#!/bin/sh -f 
# Compile Elmer modules and install it
#
# This script doesn't work as-is. The .so files will not be created
# successfully unless many of the files are compiled with -fPIC
# The directories containing files that must be compiled this
# way are the following: mathlibs/src/arpack/ umfpack/src/umfpack/
# hutiter/src/ matc/src/ eio/src/ mathlibs/src/lapack/ mathlibs/src/blas/
# umfpack/src/amd/

module unload intel-compilers
module load intel-compilers/2013.1

# replace these with your compilers:
export CC=icc
export CXX=icc
export FC=ifort
export F77=ifort
export CFLAGS=-fPIC
export CPPFLAGS=-fPIC
export FFLAGS=-fPIC

modules="matc umfpack mathlibs elmergrid meshgen2d eio hutiter fem" 
for m in $modules; do
  cd $m
  make clean
  make distclean
  ./configure --prefix=/data/apps/elmer/6518
  make
  make install
  cd .. 
done


