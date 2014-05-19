#!/bin/bash -e

################################################################################
# MPC version 1.0.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="mpc"
VERSION="1.0.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load gmp/5.1.1
module load mpfr/3.1.2

./configure --prefix=$APPDIR --with-mpfr=$INSTALLDIR/mpfr/3.1.2 --with-gmp=$INSTALLDIR/gmp/5.1.1
make
make check
make install
