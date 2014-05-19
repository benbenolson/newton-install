#!/bin/bash -e

################################################################################
# CGAL version 3.9 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="cgal"
VERSION="3.9"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load cmake/2.8.8
module load intel-compilers/2011.5.220
module unload boost/1.51
module load gmp/5.1.1
module load mpfr/3.1.2

GMP_INCLUDE_DIR=$INSTALLDIR/gmp/5.1.1/include
GMP_LIBRARIES=$INSTALLDIR/gmp/5.1.1/lib/libgmp.so
GMP_LIBRARY_DIR=$INSTALLDIR/gmp/5.1.1/lib/

MPFR_INCLUDE_DIR=$INSTALLDIR/mpfr/3.1.2/include
MPFR_LIBRARIES=$INSTALLDIR/mpfr/3.1.2/lib/libmpfr.so
MPFR_LIBRARY_DIR=$INSTALLDIR/mpfr/3.1.2/lib/

GMPXX_INCLUDE_DIR=$INSTALLDIR/gmp/5.1.1/include
GMPXX_LIBRARIES=$INSTALLDIR/gmp/5.1.1/lib/gmpxx.so

rm CMakeCache.txt
rm -rf build

mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=$APPDIR \
  -DGMP_INCLUDE_DIR=$GMP_INCLUDE_DIR \
  -DGMP_LIBRARIES=$GMP_LIBRARIES \
  -DGMP_LIBRARY_DIR=$GMP_LIBRARY_DIR \
  -DMPFR_INCLUDE_DIR=$MPFR_INCLUDE_DIR \
  -DMPFR_LIBRARIES=$MPFR_LIBRARIES \
  -DMPFR_LIBRARY_DIR=$MPFR_LIBRARY_DIR
make
make install
