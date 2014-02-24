#!/bin/bash

################################################################################
# GSL version 1.15 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="gsl"
VERSION="1.15"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR
make -j8
make check
make install
