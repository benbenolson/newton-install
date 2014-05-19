#!/bin/bash -e

################################################################################
# GROMACS version 4.6.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="gromacs"
VERSION="4.6.1-mpi"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load cmake/2.8.8
module load intel-compilers/2011.5.220

INTELCOMPILERS=$INSTALLDIR/intel/2011.5.220/composerxe-2011.5.220/bin/intel64/icc

rm -rf build
mkdir build
cd build

cmake .. -DGMX_BUILD_OWN_FFTW=ON \
  -DCMAKE_C_COMPILER=$INTELCOMPILERS  \
  -DCMAKE_INSTALL_PREFIX=$APPDIR \
  -DGMX_MPI=ON
make
make install
