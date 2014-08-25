#!/bin/bash -e

################################################################################
# Silo version 4.10 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load hdf5/1.8.9-gcc-serial
module load intel-compilers/2011.5.220

HDF5=$INSTALLDIR/hdf5/1.8.9-gcc-serial
./configure --prefix=$APPDIR --enable-shared --with-hdf5=$HDF5/include,$HDF5/lib CXX=icpc CC=icc FC=ifort F77=ifort FCLIBS=-lifcore_pic CPPFLAGS="-I/usr/include/readline"
make
make install

