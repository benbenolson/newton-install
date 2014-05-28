#!/bin/bash -e

################################################################################
# fftw version 2.1.5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################


./configure --prefix=$APPDIR --enable-threads --enable-float
make
make install
