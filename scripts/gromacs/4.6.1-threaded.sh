#!/bin/bash -e

################################################################################
# GROMACS version 4.6.1-threaded INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

module load fftw/3.2.2
module load cmake/2.8.8
module unload intel-compilers
module load intel-compilers/2013.1

INTELDIR=/data/apps/intel/2013.1/composerxe/bin

rm -rf build
mkdir build
cd build

cmake .. \
  -DCMAKE_C_COMPILER="$INTELDIR/icc"  \
  -DCMAKE_CXX_COMPILER="$INTELDIR/icpc" \
  -DCMAKE_INSTALL_PREFIX="$APPDIR" \
  -DCMAKE_PREFIX_PATH="/data/apps/fftw/3.2.2"
make
make install
