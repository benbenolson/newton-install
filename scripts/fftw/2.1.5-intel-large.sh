#!/bin/bash -e

################################################################################
# fftw version 2.1.5 INSTALL SCRIPT
#   for use on UTK Newton only
#   - enabled large mcmodel and f77 interface
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR --enable-threads --enable-float CC=icc FC=ifort CFLAGS="-mcmodel=large" F77=ifort
make
make install
