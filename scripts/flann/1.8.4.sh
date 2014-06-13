#!/bin/bash -e

################################################################################
# FLANN version 1.8.4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load cmake/2.8.8
module load hdf5/1.8.9-gcc-serial

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX="$APPDIR" ..

#First, build blas and lapack.
make -j 8
make install
