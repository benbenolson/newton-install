#!/bin/bash

################################################################################
# GCC version 4.8.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="gcc"
VERSION="4.8.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load gmp
module load mpfr
module load mpc

mkdir build
cd build
../configure --prefix=$APPDIR --with-mpfr=/data/apps/mpfr/3.1.2 --with-gmp=/data/apps/gmp/5.1.1 --with-mpc=/data/apps/mpc/1.0.1 --srcdir=..
make
make install
