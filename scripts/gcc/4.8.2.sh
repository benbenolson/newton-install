#!/bin/bash -e

################################################################################
# GCC version 4.8.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load gmp/5.1.1
module load mpfr/3.1.2
module load mpc/1.0.1

rm -rf build
mkdir -p build
cd build
../configure --prefix=$APPDIR --with-mpfr="$INSTALLDIR/mpfr/3.1.2" --with-gmp="$INSTALLDIR/gmp/5.1.1" --with-mpc="$INSTALLDIR/mpc/1.0.1" --srcdir=..
make -j8
make install
