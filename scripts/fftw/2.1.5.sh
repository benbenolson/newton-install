#!/bin/bash -e

################################################################################
# fftw version 2.1.5 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="fftw"
VERSION="2.1.5"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-threads --enable-float
make
make install
