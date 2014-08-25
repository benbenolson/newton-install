#!/bin/bash -e

################################################################################
# fftw version 3.2.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

./configure --prefix=$APPDIR --enable-threads --enable-float --enable-shared
make
make install
