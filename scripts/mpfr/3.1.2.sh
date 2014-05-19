#!/bin/bash -e

################################################################################
# MPFR version 3.1.2 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="mpfr"
VERSION="3.1.2"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

./configure --prefix=$APPDIR --enable-thread-safe --with-gmp=$INSTALLDIR/gmp/5.1.1 CC=icc
make
make check
make install
