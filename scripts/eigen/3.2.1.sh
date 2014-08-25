#!/bin/bash -e

################################################################################
# EIGEN version 3.2.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

module load cmake/2.8.8

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$APPDIR ..
make
make install
