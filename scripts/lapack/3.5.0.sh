#!/bin/bash -e

################################################################################
# LAPACK version 3.5.0 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load cmake/2.8.8

cmake -DCMAKE_INSTALL_PREFIX="$APPDIR" -G "Unix Makefiles"

#First, build blas and lapack.
cd BLAS/SRC
make
cd ../..
make
make install
