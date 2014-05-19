#!/bin/bash -e

################################################################################
# GMP version 5.1.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="gmp"
VERSION="5.1.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-cxx
make
make check
make install
